class Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: [:create] # Se necessário, desative a verificação de autenticidade CSRF para a rota de login GraphQL

  respond_to :json

  def create
    mutation = Mutations::LoginUser.new(object: nil, field: nil, context: { request: request })
    result = mutation.resolve(email: params[:user][:email], password: params[:user][:password])

    if result[:user]
      render json: { user: result[:user] }
    else
      render json: { errors: result[:errors] }, status: :unprocessable_entity
    end
  end
end
