class PhotoEventsController < ApplicationController


	def create
	@event = Event.find(params[:event_id])
    @event.photo_event.attach(params[:photo_event])
    photo_event?
  
  end


  private

  def photo_event?
  	@event = Event.find(params[:event_id])
  	if @event.photo_event.attached?
  		redirect_to event_path(@event.id)
  	else
  	 @event.destroy
  	 flash[:danger] = "La photo est obligatoire"
  	 redirect_to new_event_path
  	end
  end
end

