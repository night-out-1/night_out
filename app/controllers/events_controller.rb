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
		@event = Event.new
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

	private

  def event_params
    params.require(:event).permit(:user_id, :name, :time, :description, :location, :creator)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end