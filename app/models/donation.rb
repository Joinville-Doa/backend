class Donation < ApplicationRecord
  belongs_to :user
  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :title, presence: true
end
