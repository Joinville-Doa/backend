module Types
  class QueryType < Types::BaseObject
    field :user, Types::UserType, null: true do
      description 'Find a user by ID'
      argument :id, ID, required: true
      argument :email, String, required: false
    end

    def user(id:)
      User.find(id)
    end

    def users
      User.all
    end

    def user_by_email(email:)
      User.find_by(email: email)
    end
  end
end
