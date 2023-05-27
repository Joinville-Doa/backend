module Mutations
  class DeleteDonation < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false
    field :message, [String], null: false

    def resolve(id:)
      donation = Donation.find_by(id: id) rescue nil

      if donation.present?
        donation.destroy
          { success: true, message: ["Classificado deletado com sucesso"] }
      else
        { success: false, message: ["Classificado não encontrado"] }
      end
    end
  end
end
