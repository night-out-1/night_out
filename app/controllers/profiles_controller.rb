class ProfilesController < ApplicationController

	before_action :authenticate_user!

  def index
  	@users = User.all
  end

  def show
  	@user = User.find_by_id(params[:id])
  	if current_user
    	@user = User.find(current_user.id)
    	@events = Event.all
    	@array = []
    	@events.each do |event|
      		array = [event.id, event.location_latitude.to_f, event.location_longitude.to_f]
      		@array.push(array)
   		end
    end
  end
end
