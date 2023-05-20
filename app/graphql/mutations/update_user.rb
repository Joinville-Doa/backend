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
      validate_password(attributes[:password], attributes[:password_confirmation])
      validate_email(attributes[:email])
      valide_document_number(attributes[:document_number])

      attributes[:name] = name_normalize(attributes[:name])
      attributes[:email] = email_normalize(attributes[:email])
      attributes[:phone] = regex_phone(attributes[:phone])

      user = User.find_by(id: id)
      if user.update(attributes)
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
