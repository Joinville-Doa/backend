require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  it "Usuário faltando atributos" do
    user = User.new(
      name: Faker::Name.name,
      email: Faker::Internet.email
    )
    expect(user).to be_invalid
  end

  it "usuário atributos válidos" do
    password = Faker::Internet.password(min_length: 6)
    user = User.new(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      document_number: Faker::IDNumber.valid,
      date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
      password: password,
      password_confirmation: password,
      accept_terms_of_use: true
    )
    expect(user).to be_valid
  end

  it "atualizar usuário" do
    user = User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      document_number: Faker::IDNumber.valid,
      date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
      password: Faker::Internet.password(min_length: 6),
      password_confirmation: Faker::Internet.password(min_length: 6),
      accept_terms_of_use: true
    )
    updated_name = Faker::Name.name
    updated_email = Faker::Internet.email
    updated_phone = Faker::PhoneNumber.phone_number
    updated_document_number = Faker::IDNumber.valid
    updated_date_of_birth = Faker::Date.birthday(min_age: 18, max_age: 65)
    user.update(
      name: updated_name,
      email: updated_email,
      phone: updated_phone,
      document_number: updated_document_number,
      date_of_birth: updated_date_of_birth
    )

    expect(user.name).to eq(updated_name)
    expect(user.email).to eq(updated_email)
    expect(user.phone).to eq(updated_phone)
    expect(user.document_number).to eq(updated_document_number)
    expect(user.date_of_birth).to eq(updated_date_of_birth.strftime("%Y-%m-%d"))
  end

  it "deletar usuário" do
    user = User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      document_number: Faker::IDNumber.valid,
      date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
      password: Faker::Internet.password(min_length: 6),
      password_confirmation: Faker::Internet.password(min_length: 6),
      accept_terms_of_use: true
    )
    user.destroy

    expect(user.destroyed?).to be_truthy
  end
end
