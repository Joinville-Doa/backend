module Mutations
  class DeleteDonation < Mutations::BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(id:)
      donation = Donation.find_by(id: id)

      if donation
        if donation.destroy
          { success: true, errors: [] }
        else
          { success: false, errors: donation.errors.full_messages }
        end
      else
        { success: false, errors: ['Classificado não encontrado'] }
      end
    end
  end
end
