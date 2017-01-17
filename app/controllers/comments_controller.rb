class CommentsController < ApplicationController

	before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

	def index
		@comments = Comment.all
	end

	def show
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		# redirect_to
	end

	def edit
	end

	def update
		@comment.update(comment_params)
		# redirect_to
	end

	def destroy
		@comment.destroy
		# redirect_to
	end

	private

  def comment_params
    params.require(:comment).permit(:user_id, :event_id, :title, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end