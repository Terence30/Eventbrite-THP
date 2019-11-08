class UsersController < ApplicationController
before_action :authenticate_user!
 
  def show
    user_is_current_user
  	@admin_id= current_user.id
  	@event = Event.all	
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      puts params.inspect
      user_params = params.require(:user).permit(:first_name, :last_name, :description, :photo_event)
        if @user.update(user_params)
          flash[:success] = "Votre profil a bien été mise a jour"
          redirect_to user_path
        else
          render :edit
        end 
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
