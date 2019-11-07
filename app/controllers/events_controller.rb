class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :edit_only_admin, only: [:edit, :update, :destroy]

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
          flash[:success] = "Votre evenement a bien été créé"
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
          flash[:success] = "Votre evenement a bien été mise a jour"
          redirect_to event_path
        else
          render :edit
        end 
  
end

def destroy
      @event = Event.find(params[:id])
      @event.destroy
      flash[:danger] = "Votre evenement est bien supprimé"
      redirect_to events_path
end

private

def edit_only_admin
  @event = Event.find(params[:id])
  if current_user == @event.admin
  else
    flash[:danger] = "Vous ne pouvez pas faire cette action"
    redirect_to events_path
  end
end

end
