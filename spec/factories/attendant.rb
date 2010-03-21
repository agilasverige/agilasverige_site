Factory.define :attendant do |a|
  a.first_name 'Firstname'
  a.last_name 'Lastname'
  a.organization 'An Organization AB'
  a.email 'email@test.com'
  a.address 'A Road 100'
  a.zip_code '12345'
  a.postal_address 'Postaladdress'
end

Factory.define :lars, :parent => 'attendant' do |a|
  a.first_name 'Lars'
  a.last_name 'Larsson'
  a.organization 'Larsson AB'
  a.email 'lars@larsson.se'
  a.address 'Larssongatan 1'
  a.zip_code '12121'
  a.postal_address 'Larsboda'
end

