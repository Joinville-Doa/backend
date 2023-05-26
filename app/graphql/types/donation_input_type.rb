module Types
  class DonationInputType < Types::BaseInputObject
    argument :user_id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: true
    argument :phone_contact, String, required: true
    argument :new_product, Boolean, required: true
    argument :images, [String], required: true
  end
end
