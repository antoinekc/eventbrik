class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date, presence: true
  validate :start_date_in_future
  validates :duration, presence: true, numericality: { greater_than: 0, only_integer: true, multiple_of: 5 }
  validates :title, presence: true, length: { minimum: 3, maximum: 140 }
  validates :description, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true

  private

  def start_date_in_future
    errors.add(:start_date, "must be in the future") if start_date.present? && start_date <= Date.today
  end

  # def confirmation_send
  #   UserMailer.confirmation_email(self).deliver_now
  # end

end