module Mutations
  class DeleteUser < BaseMutation
    argument :id, ID, required: true

    field :user, Types::UserType, null: true
    field :message, [String], null: false

    def resolve(id:)
      user = User.find(id) rescue nil

      if user.present?
        user.destroy
        { user: user, message: ['Usuário excluido com sucesso'] }
      else
        { user: nil, message: ['Usuário não encontrado'] }
      end

    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(e.record.errors.full_messages.join(', '))
    end
  end
end