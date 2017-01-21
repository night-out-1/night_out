class EventsController < ApplicationController

	before_action :set_event, only: [:show, :edit, :update, :destroy, :add_user_to_event]
  before_action :authenticate_user!, :except => [:index]

	def index
		#below if else statement is for locations based on user zip or philly if no current user
		if current_user
      		@user = User.find(current_user.id)
      		@search = @user.postal_code
      		@base_locations = Yelp.client.search(@search)
      		@events = Event.all
      		@array = []
      		@events.each do |event|
      			array = [event.id, event.location_latitude.to_f, event.location_longitude.to_f]
      			@array.push(array)
      		end
      		zip = @user.postal_code.to_i
      		max_zip = zip + 150
      		min_zip = zip - 150
      		@zip_event_id_array = []
      		@events.each do |event| 
      			if event.location_postal_code.to_i > min_zip && event.location_postal_code.to_i < max_zip
      				@zip_event_id_array.push(event.id)
      			end
      		end
      		for i in [0..@zip_event_id_array.length] do
      			@zip_events = Event.find(@zip_event_id_array[i])
      		end 
    	end
    	@latitude_min = params[:latitude_min]
    	@latitude_max = params[:latitude_max] 	
	end

	def show
		@creator_name = (User.find_by id: @event.creator).username
		@comments = Comment.all

	end

	def new
		@location_name = params[:location_name]
		@location_street_address = params[:location_street_address]
		@location_city= params[:location_city]
		@location_photo_url= params[:location_photo_url]
		@location_url= params[:location_url]
		@location_postal_code = params[:location_postal_code]
		@location_latitude = params[:location_latitude]
		@location_longitude = params[:location_longitude]
		@event = Event.new
		@event.location_name = @location_name
		@event.location_street_address = @location_street_address
		@event.location_city = @location_city
		@event.location_photo_url = @location_photo_url
		@event.location_url = @location_url
		@event.location_postal_code = @location_postal_code
		@event.location_latitude = @location_latitude
		@event.location_longitude = @location_longitude
		@event.creator = current_user.id
		@event.user_id = current_user.id
		@event.save
		current_user.events.push(@event)

	end

	def create
		@event = Event.new(event_params)
		@event.user_id = current_user.id
		@event.creator = current_user.id

		if @event.save
			current_user.events.push(@event)
			redirect_to event_path(@event)
			current_user.events.push(@event)
		else
			render :new
		end
	end

	def edit
	end

	def update
		@event.update(event_params)
		redirect_to event_path(@event)
	end

	def destroy
		@event.destroy
		redirect_to events_path
	end

	def search
		@responses = Yelp.client.search(params[:location])
		@events = Event.all
		render :index
	end

	def add_user_to_event
		@event.users.push(current_user)
		redirect_to event_path(@event)
	end

	private

  def event_params
    params.require(:event).permit(:user_id, :name, :time, :description, :location, :creator)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end