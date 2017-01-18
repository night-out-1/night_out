class CommentsController < ApplicationController

	before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index]

	def index
		@comments = Comment.all
	end

	def show
		@creator_name = (User.find_by id: @comment.user_id).username
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id

		@comment.save
		redirect_to event_path(@comment.event)
	end

	def edit
	end

	def update
		@comment.update(comment_params)
		redirect_to event_path(@comment.event)
	end

	def destroy
		@comment.destroy
		redirect_to event_path(@comment.event)
	end

	private

  def comment_params
    params.require(:comment).permit(:user_id, :event_id, :title, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end