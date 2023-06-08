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

    field :donation, Types::DonationType, null: true
    field :message, [String], null: false

    def resolve(title:, description:, user_id:, phone_contact:, new_product:, category_id:, image_one:, image_two: nil, image_three: nil, image_four: nil, image_five: nil)
      puts "\n \n \n \n \n \n \n Antes de salvar no de começar a criar  \n \n \n \n \n \n \n "

      new_donation = Donation.new(
        title: name_normalize(title),
        description: description,
        user_id: user_id,
        phone_contact: regex_phone(phone_contact),
        new_product: new_product,
        category_id: category_id,
        image_one: image_one,
        image_two: image_two,
        image_three: image_three,
        image_four: image_four,
        image_five: image_five
      )
      puts "\n \n \n \n \n \n \n Antes de salvar no IF \n \n \n \n \n \n \n "

      if new_donation.save
        puts "\n \n \n \n \n \n \n Classificado criado com sucesso \n \n \n \n \n \n \n "
        { donation: new_donation, message: ["Classificado criado com sucesso"] }
      else
        puts "\n \n \n \n \n \n \n Houve um erro ao criar o classificado \n \n \n \n \n \n \n "
        { donation: nil, message: ["Houve um erro ao criar o classificado"] }
      end
    end
  end
end
