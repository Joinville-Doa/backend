module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false
    field :user, Types::UserType, null: true do
      description 'Find a user by ID'
      argument :id, ID, required: true
    end
    field :user_by_email, Types::UserType, null: true do
      description 'Find a user by email'
      argument :email, String, required: true
    end

    def users
      User.all
    end

    def user(id:)
      User.find(id)
    end

    def user_by_email(email:)
      User.find_by(email: email)
    end
  end
end
