class StaticPagesController < ApplicationController
  def home 
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

  def about
  end

  def contact
  end

private

end
