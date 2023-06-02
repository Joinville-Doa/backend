require 'faker'

# Create 100 fake users

10.times do
  password =  Faker::Internet.password(min_length: 6)
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    document_number: Faker::IDNumber.valid,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    phone: Faker::PhoneNumber.phone_number,
    password: password,
    password_confirmation: password,
    accept_terms_of_use: true
  )

  puts "User #{User.last.name} created"
end

# Create 10 categories
10.times do
  Category.create!(
    name: Faker::Lorem.word,
  )

  puts "Category #{Category.last.name} created"
end

# Create 100 donations with random user
100.times do
  Donation.create!(
    user: User.all.sample,
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    phone_contact: Faker::PhoneNumber.phone_number,
    new_product: Faker::Boolean.boolean,
    image_one: Faker::Avatar.image,
    image_two: Faker::Avatar.image,
    image_three: Faker::Avatar.image,
    image_four: Faker::Avatar.image,
    image_five: Faker::Avatar.image
  )

  puts "Donation #{Donation.last.title} created"
end