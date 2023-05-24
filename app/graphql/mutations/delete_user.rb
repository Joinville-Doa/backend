module Mutations
  class DeleteUser < BaseMutation
    argument :id, ID, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(id:)
      user = User.find(id)

      if user.destroy
        { user: user, message: ["User deleted successfully"] }
      else
        { user: nil, errors: ["User not deleted"] }
      end
    end
  end
end