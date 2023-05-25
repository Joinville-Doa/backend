module Types
  class MutationType < Types::BaseObject
    field :createUser, mutation: Mutations::CreateUser
    field :updateUser, mutation: Mutations::UpdateUser
    field :deleteUser, mutation: Mutations::DeleteUser
    field :loginUser, mutation: Mutations::LoginUser
    field :logoutUser, mutation: Mutations::LogoutUser
  end
end
