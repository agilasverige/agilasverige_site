Factory.define :attendant do |a|
  a.first_name Faker::Name.first_name
  a.last_name Faker::Name.last_name
  a.organization Faker::Company.name
  a.email Faker::Internet.email
  a.address Faker::Address.street_address
  a.zip_code Faker::Address.zip_code
  a.postal_address Faker::Address.city
end


