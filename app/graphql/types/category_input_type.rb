module Types
  class CategoryInputType < Types::BaseInputObject
    argument :name, String, required: true
  end
end
