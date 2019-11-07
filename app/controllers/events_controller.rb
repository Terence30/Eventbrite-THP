class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    array_event = Event.all
    @array_event = array_event.reverse
  end

  def show
    @event = Event.find(params["id"])
    @participants = @event.attendances
  end
	
  def new
 	@event= Event.new
  end

  def create
  	event_params = params.permit!
  	@event= Event.new(title: params["title"], start_date: params["start_date"], duration: params["duration"], description: params["description"], price: params["price"], location: params["location"], admin: current_user)
  	    if @event.save # essaie de sauvegarder en base @gossip
  	    	@array_event = Event.all
            redirect_to event_path(@event.id)

        else
          render "/events/new"
    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
        end
  end

def edit
  @event = Event.find(params[:id])
  
end
  
def update

      @event = Event.find(params[:id])
      puts params
      event_params = params.permit(:title, :start_date, :duration, :description, :price, :location)
        if @event.update(event_params)
          redirect_to event_path
        else
          render :edit
        end 
  
end

def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to events_path
end

end
