class UsersController < ApplicationController
	def new
	        @user = User.new
	        render :new
	    end

	    def show
	        @user = User.find(params[:id])
	        @compliment = Compliment.new
	        render :show
	    end

	    def create
	     user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
	     @user = User.new(user_params)
	   if @user.save
	      login(@user) # <-- login the user
	      redirect_to location_path(@user)# <-- go to show
	   else
	     render :new
	   end
	 end

	    def edit
	   @user = User.find(params[:id])
	   render :edit
	    end

	    def update                
	   @user = User.find(params[:id])
	   updated_attributes = params.require(:user).permit(:first_name, :last_name)
	   @user.update_attributes(updated_attributes)
	   redirect_to @user 
	    end

	   # def index
	   #   @user = User.new
	   #   render :new
	   # end

	   private
	     def user_params
	     params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
	   end


end
