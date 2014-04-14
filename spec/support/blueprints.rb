require 'machinist/active_record'

User.blueprint do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  organization { Faker::Company.name }
  email { Faker::Internet.email }
  password { 'password' }
  password_confirmation { 'password' }
end

Registration.blueprint do
end

SpeakingProposal.blueprint do
  title { Faker::Lorem.sentence }
  abstract { Faker::Lorem.paragraphs.join('\n\n').strip }
end

User.blueprint(:admin) do
  role { 'admin'}
end

Conference.blueprint do
  # Attributes here
end

Registration.blueprint do
  # Attributes here
end

AdminUser.blueprint do
  # Attributes here
end

Ipn.blueprint do
  # Attributes here
end
