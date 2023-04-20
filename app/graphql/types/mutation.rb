Types::MutationType = GraphQL::ObjectType.define do
    name 'Mutation'

    field :login, Types::UserType do
      description 'Log in a user'
      argument :email, !types.String
      argument :password, !types.String
      resolve ->(_obj, args, ctx) do
        user = User.find_for_database_authentication(email: args[:email])
        if user && user.valid_password?(args[:password])
          ctx[:warden].set_user(user, scope: :user)
          user
        else
          raise GraphQL::ExecutionError, 'Invalid email or password'
        end
      end
    end

    field :logout, Types::UserType do
      description 'Log out the current user'
      resolve ->(_obj, _args, ctx) do
        user = ctx[:current_user]
        if user
          ctx[:warden].logout(:user)
          user
        else
          raise GraphQL::ExecutionError, 'Not logged in'
        end
      end
    end

    field :register, Types::UserType do
      description 'Register a new user'
      argument :email, !types.String
      argument :password, !types.String
      resolve ->(_obj, args, _ctx) do
        User.create!(email: args[:email], password: args[:password])
      end
    end
end