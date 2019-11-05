class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

  def index
    @array_event = Event.all
  end

  def show
    @event = Event.find(params["id"])
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

end
