module Mutations
  class UpdateDonation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :donation, Types::DonationInputType, required: true

    field :donation, Types::DonationType, null: true
    field :errors, [String], null: false

    def resolve(id:, donation:)
      existing_donation = Donation.find_by(id: id)

      if existing_donation
        if existing_donation.update(donation.to_h)
          { donation: existing_donation, errors: [] }
        else
          { donation: nil, errors: existing_donation.errors.full_messages }
        end
      else
        { donation: nil, errors: ['Classificado não encontrado'] }
      end
    end
  end
end
