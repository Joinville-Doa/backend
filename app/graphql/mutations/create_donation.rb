module Mutations
  class CreateDonation < Mutations::BaseMutation
    argument :donation, Types::DonationInputType, required: true

    field :donation, Types::DonationType, null: true
    field :errors, [String], null: false

    def resolve(donation:)
      new_donation = Donation.new(donation.to_h)

      if new_donation.save
        { donation: new_donation, errors: [] }
      else
        { donation: nil, errors: new_donation.errors.full_messages }
      end
    end
  end
end
