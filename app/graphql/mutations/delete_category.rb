module Mutations
  class DeleteCategory < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false
    field :message, [String], null: false

    def resolve(id:)
      category = Category.find_by(id: id) rescue nil

      if category.present?
        category.destroy
        { success: true, message: ["Categoria excluída"] }
      else
        { success: false, message: ['Categoria não encontrada'] }
      end
    end
  end
end
