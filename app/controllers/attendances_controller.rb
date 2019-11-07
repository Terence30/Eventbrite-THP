class AttendancesController < ApplicationController
	  before_action :authenticate_user!
  
  def index
    @event = Event.find(params[:event_id])
    event_id = @event.id

    @attendances = Attendance.all 
    @attendances_event = @attendances.where("event_id = ?", event_id)

    @users = User.all
  end

end
