module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false
    field :user, Types::UserType, null: true do
      description 'Procura um usuário por ID'
      argument :id, ID, required: true
    end
    field :user_by_email, Types::UserType, null: true do
      description 'Procura um usuário por email'
      argument :email, String, required: true
    end
    field :user_by_token, Types::UserType, null: true do
      description 'Procura um usuário por token'
      argument :token, String, required: true
    end
    field :categories, [Types::CategoryType], null: false
    field :category, Types::CategoryType, null: true do
      description 'Procura uma categoria por ID'
      argument :id, ID, required: true
    end
    field :category_by_name, Types::CategoryType, null: true do
      description 'Procura uma categoria por nome'
      argument :name, String, required: true
    end
    field :donations, [Types::DonationType], null: false do
      description 'Lista todos os classificados'
      argument :limit, Integer, required: false
      argument :offset, Integer, required: false
    end
    field :donation, Types::DonationType, null: true do
      description 'Procura um classificado por ID'
      argument :id, ID, required: true
    end
    field :donations_by_user, [Types::DonationType], null: false do
      description 'Procura classificados por usuário'
      argument :user_id, ID, required: true
    end
    field :donations_by_category, [Types::DonationType], null: false do
      description 'Procura classificados por categoria'
      argument :category_id, ID, required: true
    end
    field :donations_by_title, [Types::DonationType], null: false do
      description 'Procura classificados por título'
      argument :title, String, required: true
    end

    def users
      User.all
    end

    def user(id:)
      User.find(id)
      rescue ActiveRecord::RecordNotFound => e
        GraphQL::ExecutionError.new("Usuário não existe")
    end

    def user_by_email(email:)
      User.find_by(email: email)
    end

    def user_by_token(token:)
      User.find_by(authentication_token: token)
    end

    def categories
      Category.all
    end

    def category(id:)
      Category.find(id)
    end

    def category_by_name(name:)
      name = name.split.map(&:capitalize).join(' ')
      Category.find_by(name: name)
    end

    def donations(limit: nil, offset: nil)
      donations = Donation.all.order(created_at: :desc)
      total = donations.count

      if limit && offset
        donations = donations.limit(limit).offset(offset)
      end
    end

    def donation(id:)
      Donation.find(id)
    end

    def donations_by_user(user_id:)
      Donation.where(user_id: user_id)
    end

    def donations_by_category(category_id:)
      Donation.where(category_id: category_id)
    end

    def donations_by_title(title:)
      title = title.split.map(&:capitalize).join(' ')
      Donation.where(title: title)
    end
  end
end
