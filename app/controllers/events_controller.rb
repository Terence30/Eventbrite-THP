class EventsController < ApplicationController

def index
	@array_event= Event.all
end

def show

	@event = Event.find(params["id"])
	
end
	
end
