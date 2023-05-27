module Mutations
  class UpdateCategory < BaseMutation
    include Mutations::Concerns::UserValidation

    argument :id, ID, required: true
    argument :name, String, required: true

    field :category, Types::CategoryType, null: true
    field :message, [String], null: false

    def resolve(id:, name:)
      category = Category.find_by(id: id) rescue nil

      if category.present?
        category.update(name: name_normalize(name))
        { category: category, message: ["Categoria atualizado com sucesso"] }
      else
        { category: nil, message: ["Categoria não encontrada"]}
      end
      # Eletrodomésticos
    end
  end
end
