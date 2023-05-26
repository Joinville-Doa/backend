module Mutations
  class UpdateCategory < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :category, Types::CategoryInputType, required: true

    field :category, Types::CategoryType, null: true
    field :errors, [String], null: false

    def resolve(id:, category:)
      existing_category = Category.find_by(id: id)

      if existing_category
        if existing_category.update(category.to_h)
          { category: existing_category, errors: [] }
        else
          { category: nil, errors: existing_category.errors.full_messages }
        end
      else
        { category: nil, errors: ['Classificado não encontrado'] }
      end
    end
  end
end
