class User < ApplicationRecord
  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/, message: "email adress please" } 
  validates :last_name, 
  presence: true
  validates :first_name, 
  presence: true

  has_many :events
  has_many :attendances
  has_many :events, through: :attendances
end