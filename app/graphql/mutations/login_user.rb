module Mutations
  class LoginUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :token, String, null: true
    field :message, [String], null: false

    def resolve(email:, password:)
      user = User.find_for_database_authentication(email: email)

      if user && user.valid_password?(password)
        token = generate_token(user)
        { user: user, token: token, message: ["Login realizado com sucesso"] }
      else
        { user: nil, token: nil, message: ['E-mail ou Senha inválido.'] }
      end
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(e.record.errors.full_messages.join(', '))
    end

    private

    def generate_token(user)
      payload = { user_id: user.id }
      secret_key = Rails.application.secrets.secret_key_base
      expiration_time = 1.hour.from_now.to_i

      token = JWT.encode(payload, secret_key, 'HS256', exp: expiration_time)
      user.update(authentication_token: token)
      user.reload

      token
    end
  end
end
