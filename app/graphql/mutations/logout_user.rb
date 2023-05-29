module Mutations
  class LogoutUser < BaseMutation
    argument :email, String, required: true

    field :success, Boolean, null: false
    field :message, [String], null: false

    def resolve(email)
      user = User.find_for_database_authentication(email: email) rescue nil
      sign_out(user)
      { success: true, message: ["Logout realizado com sucesso"] }
    end

    private

    def sign_out(user)
      user.authentication_token = nil if user
      user.reload if user

      context[:current_user] = nil if user
    end
  end
end
