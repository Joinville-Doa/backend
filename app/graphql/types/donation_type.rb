module Types
  class DonationType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :phone_contact, String, null: false
    field :new_product, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :images, [String], null: false
  end
end
