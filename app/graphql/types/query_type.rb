Types::QueryType = GraphQL::ObjectType.define do
    name 'Query'

    field :currentUser, Types::UserType do
      description 'Get the currently logged-in user'
      resolve ->(_obj, _args, ctx) { ctx[:current_user] }
    end
end