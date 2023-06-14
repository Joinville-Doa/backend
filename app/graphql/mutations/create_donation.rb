module Mutations
  class CreateDonation < BaseMutation
    include Mutations::Concerns::UserValidation

    argument :title, String, required: true
    argument :description, String, required: true
    argument :user_id, ID, required: true
    argument :category_id, ID, required: true
    argument :phone_contact, String, required: true
    argument :new_product, Boolean, required: true
    argument :image_one, String, required: true
    argument :image_two, String, required: false
    argument :image_three, String, required: false
    argument :image_four, String, required: false
    argument :image_five, String, required: false
    argument :has_whatsapp, Boolean, required: true

    field :donation, Types::DonationType, null: true
    field :message, [String], null: false

    def resolve(title:, description:, user_id:, phone_contact:, new_product:, category_id:, has_whatsapp:, image_one:, image_two: nil, image_three: nil, image_four: nil, image_five: nil)
      new_donation = Donation.new(
        title: name_normalize(title),
        description: description,
        user_id: user_id,
        phone_contact: regex_phone(phone_contact),
        new_product: new_product,
        category_id: category_id,
        has_whatsapp: has_whatsapp,
        image_one: image_one,
        image_two: image_two,
        image_three: image_three,
        image_four: image_four,
        image_five: image_five
      )

      if new_donation.save
        { donation: new_donation, message: ["Classificado criado com sucesso"] }
      else
        { donation: nil, message: ["Houve um erro ao criar o classificado"] }
      end
    end
  end
end
