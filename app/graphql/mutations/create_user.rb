module Mutations
    class CreateUser < BaseMutation
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

      def resolve(name:, email:, password:, password_confirmation:, document_number:, phone:, accept_terms_of_use:, date_of_birth:)
        user = User.new(
          name: name,
          email: email,
          password: password,
          password_confirmation: password_confirmation,
          document_number: document_number,
          phone: phone,
          accept_terms_of_use: accept_terms_of_use,
          date_of_birth: date_of_birth
        )

        if user.save
          { user: user, errors: [] }
        else
          { user: nil, errors: user.errors.full_messages }
        end
      end
    end
  end
