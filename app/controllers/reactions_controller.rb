class ReactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reactable, only: [:create]
  before_action :find_reaction, only: [:update, :destroy]
  before_action :save_last_path, only: %i[create update destroy]

  def create
    @reaction = @reactable.reactions.new(reaction_params)
    @reaction.user = current_user

    if @reaction.save
      redirect_to @last_path
    else
      flash[:notice] = 'Your reaction was failed.'
      redirect_to @last_path
    end
  end

  def update
    if @reaction.update(update_reaction_params)
      flash[:notice] = 'Reaction updated successfully.'
      redirect_to request.referer
    else
      flash[:notice] = 'Your reaction update failed.'
      redirect_to request.referer
    end
  end

  def destroy
    @reaction.destroy
    flash[:notice] = 'Reaction deleted successfully.'
    redirect_to request.referer
  end

  private

  def set_reactable
    @reactable_id = params[:reactable_id].to_i
    @reactable_type = params[:reactable_type]
    @reactable = @reactable_type.constantize.find(@reactable_id)
  end

  def find_reaction
    @reaction = Reaction.find(params[:id])
    unless @reaction.user == current_user
      flash[:alert] = 'You cannot delete a reaction that is not yours.'
      redirect_to @last_path
    end
  end

  def save_last_path
    if @reactable_type == "Idea"
      @last_path =  @reactable
    elsif @reactable_type == "Comment"
      @last_path = @reactable.idea
    end
  end

  def reaction_params
    params.permit(:reactable_type, :reactable_id, :reaction_type)
  end

  def update_reaction_params
    params.permit(:reaction_type)
  end
end
