class ResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_idea, only: %i[create destroy]
  before_action :find_response, only: :destroy
  before_action :authorize_user, only: :destroy

  def create
    @response = @idea.responses.new(investor: current_user)
    if @response.save
      flash[:notice] = 'Your response was successfully created.'
      redirect_to @idea
    else
      render 'ideas/show'
    end
  end

  def destroy
    @response.destroy
    flash[:notice] = 'Response was removed successfully.'
    redirect_to @idea
  end

  private

  def find_idea
    @idea = Idea.find(params[:idea_id])
  end

  def find_response
    @response = @idea.responses.find_by(investor: current_user)
  end

  def authorize_user
    unless @response.present?
      flash[:notice] = 'You have not responded to this idea.'
      redirect_to @idea
    end
  end
end
