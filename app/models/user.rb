class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, :document_number, :phone, :accept_terms_of_use, presence: true
end
