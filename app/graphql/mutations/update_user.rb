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
    field :message, [String], null: false

    def resolve(id:, **attributes)
      current_user = User.find_by(id: id) rescue nil

      validate_password(password: attributes[:password], password_confirmation: attributes[:password_confirmation])
      validate_password_is_equal_in_user(password: attributes[:password], current_user: current_user)
      validate_email(email: attributes[:email], current_user: current_user) if attributes[:email] != current_user.email
      valide_document_number(document_number: attributes[:document_number], current_user: current_user) if attributes[:document_number] != current_user.document_number
      validate_accept_terms_of_use(accept_terms_of_use: attributes[:accept_terms_of_use])

      attributes[:name] = name_normalize(attributes[:name])
      attributes[:email] = email_normalize(attributes[:email])
      attributes[:phone] = regex_phone(attributes[:phone])
      attributes[:document_number] = regex_document_number(attributes[:document_number])

      user = User.find_by(id: id) rescue nil

      if user.present?
        user.update!(attributes)
        { user: user, message: ["Usuário atualizado com sucesso"], status: 200 }
      else
        { user: nil, message: ["Usuário não encontrado"], status: 404 }
      end

    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(e.record.errors.full_messages.join(', '))
    end
  end
end
