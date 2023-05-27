module Mutations
  class CreateCategory < BaseMutation
    include Mutations::Concerns::UserValidation

    argument :name, String, required: true

    field :category, Types::CategoryType, null: true
    field :message, [String], null: false

    def resolve(name:)

      new_category = Category.new(name: name_normalize(name))

      if new_category.save
        { category: new_category, message: [] }
      else
        { category: nil, message: new_category.message.full_messages }
      end
    end
  end
end
