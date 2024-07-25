class CommentsController < ApplicationController
  before_action :find_idea, only: %i[create]
  before_action :find_comment, only: %i[edit update destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.idea = @idea
    if @comment.save
      flash[:notice] = 'Your comment was successfully created.'
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = 'Comment updated successfully.'
      redirect_to idea_path(@comment.idea)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = 'Comment deleted successfully.'
    redirect_to idea_path(@comment.idea)
  end

  private

  def find_idea
    @idea = Idea.find(params[:idea_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, reactions_attributes: :reaction_type)
  end
end
