require 'machinist/active_record'

User.blueprint do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  organization { Faker::Company.name }
  email { Faker::Internet.email }
  address { Faker::Address.street_address }
  zip_code { Faker::Address.zip_code }
  postal_address { Faker::Address.city }
  password { 'password' }
  password_confirmation { 'password' }
end

SpeakingProposal.blueprint do
  title { Faker::Lorem.sentence }
  abstract { Faker::Lorem.paragraphs.join('\n\n').strip }
end

User.blueprint(:admin) do
  role { 'admin'}
end
