class EventsController < ApplicationController

	before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index]

	def index
		@events = Event.all
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
		@event = Event.new
		@event.location_name = @location_name
		@event.location_street_address = @location_street_address
		@event.location_city = @location_city
		@event.location_photo_url = @location_photo_url
		@event.location_url = @location_url
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
		render :index
	end

	private

  def event_params
    params.require(:event).permit(:user_id, :name, :time, :description, :location, :creator)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end