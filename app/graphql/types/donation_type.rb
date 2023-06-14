module Types
  class DonationType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :phone_contact, String, null: false
    field :new_product, Boolean, null: false
    field :created_at, String, null: false
    field :updated_at, String, null: false
    field :total, Integer, null: false
    field :limit, Integer, null: false
    field :offset, Integer, null: false
    field :category_id, ID, null: false
    field :has_whatsapp, Boolean, null: false
    field :image_one, String
    field :image_two, String
    field :image_three, String
    field :image_four, String
    field :image_five, String
  end
end
