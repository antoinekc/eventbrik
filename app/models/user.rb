class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
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


  
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end


end