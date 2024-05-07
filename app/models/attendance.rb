class Attendance < ApplicationRecord
  belongs_to :event
  belongs_to :user


  after_create :confirmation_email

  def confirmation_send
    AttendanceMailer.confirmation_email(self.user_id).deliver_now
  end

end
