class CommentsController < ApplicationController
  def index
  end

  def new

  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Thanks for commenting"
      redirect_to root_path
    else
      flash[:notice] = "Unable to comment... try again"
      redirect_to root_path
    end 
  end

  def show
  end

  def edit
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      flash[:notice] = "Comment edited"
      redirect_to root_path
    else
      flash[:notice] = "Unable to edit comment"
      redirect_to root_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment deleted"
      redirect_to admin_show_path
    else
      flash[:notice] = "Unable to delete comment"
      render "back"
    end
  end

  private 
    def comment_params
      params.require(:comment).permit(:name, :body, :flag, :report_id, :humanizer_answer, :humanizer_question_id)
    end
end
