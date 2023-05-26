module Mutations
  class DeleteCategory < Mutations::BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(id:)
      category = Category.find_by(id: id)

      if category
        if category.destroy
          { success: true, errors: [] }
        else
          { success: false, errors: category.errors.full_messages }
        end
      else
        { success: false, errors: ['Categoria não encontrada'] }
      end
    end
  end
end
