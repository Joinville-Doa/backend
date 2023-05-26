module Types
  class MutationType < Types::BaseObject
    field :createUser, mutation: Mutations::CreateUser
    field :updateUser, mutation: Mutations::UpdateUser
    field :deleteUser, mutation: Mutations::DeleteUser
    field :loginUser, mutation: Mutations::LoginUser
    field :logoutUser, mutation: Mutations::LogoutUser
    field :create_category, CategoryType, mutation: Mutations::CreateCategory
    field :update_category, CategoryType, mutation: Mutations::UpdateCategory
    field :delete_category, Boolean, mutation: Mutations::DeleteCategory
    field :create_donation, DonationType, mutation: Mutations::CreateDonation
    field :update_donation, DonationType, mutation: Mutations::UpdateDonation
    field :delete_donation, Boolean, mutation: Mutations::DeleteDonation
  end
end
