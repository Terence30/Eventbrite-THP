class UsersController < ApplicationController
before_action :authenticate_user!
 
  def show
    user_is_current_user
  	@admin_id= current_user.id
  	@event = Event.all	
  end

  private

  def user_is_current_user
  	user = User.find(params["id"])
  	  if user.id == current_user.id
  	  else
  	    flash[:danger] = "Vous n'avez pas acces a cette page"
  	    redirect_to "/"
  	  end
  end

end
