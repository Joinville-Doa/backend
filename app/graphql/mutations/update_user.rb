module Mutations
  class UpdateUser < BaseMutation
    include Mutations::Concerns::UserValidation

    argument :id, ID, required: true
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
    argument :document_number, String, required: true
    argument :phone, String, required: true
    argument :accept_terms_of_use, Boolean, required: true
    argument :date_of_birth, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(id:, **attributes)
      validate_password(password: attributes[:password], password_confirmation: attributes[:password_confirmation])
      validate_email(email: attributes[:email])
      valide_document_number(document_number: attributes[:document_number])
      validate_accept_terms_of_use(accept_terms_of_use: attributes[:accept_terms_of_use])

      attributes[:name] = name_normalize(attributes[:name])
      attributes[:email] = email_normalize(attributes[:email])
      attributes[:phone] = regex_phone(attributes[:phone])
      attributes[:document_number] = regex_document_number(attributes[:document_number])

      user = User.find_by(id: id)
      if user.update(attributes)
        { user: user, message: ["User updated successfully"] }
      else
        { user: nil, message: ["User not updated"] }
      end
    end
  end
end
