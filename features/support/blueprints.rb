require 'machinist/active_record'

  
User.blueprint do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  organization { Faker::Company.name }
  email { Faker::Internet.email }
  zip_code { Faker::Address.zip_code }
  postal_address { Faker::Address.city }
  password { 'password' }
  password_confirmation { 'password' }
end



