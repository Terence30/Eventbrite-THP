class Attendance < ApplicationRecord
    after_create :new_participant_send
	belongs_to :user
	belongs_to :event

  def new_participant_send
    AdminMailer.new_participant(self).deliver_now

  end
end