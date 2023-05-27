module Types
  class CategoryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end
