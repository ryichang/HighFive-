class LocationsController < ApplicationController
	def new
		@user = User.new
		render :new
	end

	def show
		
	end

end