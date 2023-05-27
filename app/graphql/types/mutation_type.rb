module Types
  class MutationType < Types::BaseObject
    field :createUser, mutation: Mutations::CreateUser
    field :updateUser, mutation: Mutations::UpdateUser
    field :deleteUser, mutation: Mutations::DeleteUser
    field :loginUser, mutation: Mutations::LoginUser
    field :logoutUser, mutation: Mutations::LogoutUser
    field :createCategory, mutation: Mutations::CreateCategory
    field :updateCategory, mutation: Mutations::UpdateCategory
    field :deleteCategory, mutation: Mutations::DeleteCategory
    field :createDonation, mutation: Mutations::CreateDonation
    field :updateDonation, mutation: Mutations::UpdateDonation
    field :deleteDonation, mutation: Mutations::DeleteDonation
  end
end
