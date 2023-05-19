module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :document_number, String, null: false
    field :phone, String, null: false
    field :accept_terms_of_use, Boolean, null: false
    field :date_of_birth , String, null: false
  end
end