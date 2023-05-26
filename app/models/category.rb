class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :donations, through: :categorizations
end