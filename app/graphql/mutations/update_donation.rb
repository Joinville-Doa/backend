module Mutations
  class UpdateDonation < BaseMutation
    include Mutations::Concerns::UserValidation

    argument :id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: true
    argument :user_id, ID, required: true
    argument :phone_contact, String, required: true
    argument :new_product, Boolean, required: true
    argument :image_one, String, required: true
    argument :image_two, String, required: false
    argument :image_three, String, required: false
    argument :image_four, String, required: false
    argument :image_five, String, required: false

    field :donation, Types::DonationType, null: true
    field :message, [String], null: false

    def resolve(id:, title:, description:, user_id:, phone_contact:, new_product:, image_one:, image_two: nil, image_three: nil, image_four: nil, image_five: nil)
      donation = Donation.find_by(id: id) rescue nil

      if donation.present?
        donation.update(
          title: name_normalize(title),
          description: description,
          user_id: user_id,
          phone_contact: regex_phone(phone_contact),
          new_product: new_product,
          image_one: image_one,
          image_two: image_two,
          image_three: image_three,
          image_four: image_four,
          image_five: image_five
        )

        { donation: donation, message: ["Classificado atualizado com sucesso"] }
      else
        { donation: nil, message: ["Houve um erro ao atualizar o classificado"] }
      end
    end
  end
end
