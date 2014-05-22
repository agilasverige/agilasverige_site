# encoding: UTF-8
require 'csv'

namespace :payson do
  desc "Load payment status from Payson transaction export (options: FILE=file_to_import.csv)"
  task :load_transactions => :environment do

    path = ENV['FILE'] || 'payson.csv'

    conference = Conference.current

    puts("#\n")
    puts("# Updating user registrations to #{conference.year} from file #{path}\n")
    puts("#\n\n")

    CSV.foreach(path, headers: :first_row, skip_blanks: true, encoding: "UTF-8") do |row|
      attrs = row.to_hash

      email = attrs['Från']
      payson_ref = attrs['PaysonRef']

      user = User.find_by_email(email)
      registration = user.registrations.where(conference_id: conference).first

      registered = registration.present?
      payed = (registered and (registration.payson_token.present? or registration.payson_ref.present?))

      if payed
        puts("Skipping #{email}, already registered and payed")
      elsif registered
        puts("#{email} registered but NOT marked payed, updating payson token...")

        # NOTE: we should really set the payson_token, but it's not available from the Payson exports
        registration.payson_ref = payson_ref
        registration.save!

      else
        puts("#{email} NOT registered, adding registration...")
        Registration.create!(conference_id: conference.id, user_id: user.id, payson_ref: payson_ref)

      end
    end
  end
end
