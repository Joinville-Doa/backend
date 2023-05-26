module Mutations
  class CreateCategory < Mutations::BaseMutation
    argument :category, Types::CategoryInputType, required: true

    field :category, Types::CategoryType, null: true
    field :errors, [String], null: false

    def resolve(category:)
      new_category = Category.new(category.to_h)

      if new_category.save
        { category: new_category, errors: [] }
      else
        { category: nil, errors: new_category.errors.full_messages }
      end
    end
  end
end
