module Mutations
    class CreateUser < BaseMutation
      include Mutations::Concerns::UserValidation

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
        validate_password(password: password, password_confirmation: password_confirmation)
        validate_email(email: email)
        valide_document_number(document_number: document_number)
        validate_accept_terms_of_use(accept_terms_of_use: accept_terms_of_use)

        user = User.new(
          name: name_normalize(name),
          email: email_normalize(email),
          password: password,
          password_confirmation: password_confirmation,
          document_number: regex_document_number(document_number),
          phone: regex_phone(phone),
          accept_terms_of_use: accept_terms_of_use,
          date_of_birth: date_of_birth
        )

        if user.save
          { user: user, message: ["User created successfully"]}
        else
          { user: nil, message: ["User not created"] }
        end

      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new(e.record.errors.full_messages.join(', '))
      end
    end
  end
