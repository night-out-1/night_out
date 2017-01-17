class EventsController < ApplicationController

	before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

	def index
		@events = Event.all
	end

	def show
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		# redirect_to
	end

	def edit
	end

	def update
		@event.update(event_params)
		# redirect_to
	end

	def destroy
		@event.destroy
		# redirect_to
	end

	private

  def event_params
    params.require(:event).permit(:user_id, :name, :time, :description, :location)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end