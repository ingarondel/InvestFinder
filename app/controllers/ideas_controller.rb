class IdeasController < ApplicationController
  before_action :find_idea, only: %i[show edit update destroy]

  def index
    @ideas = Idea.all
  end

  def show
  end

  def new
    @idea = Idea.new
  end

  def edit
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:notice] = 'Your idea successfully created.'
      redirect_to @idea
    else
      render :new
    end
  end

  def destroy
    @idea.destroy
    flash[:notice] = 'Idea was deleted successfully.'
    redirect_to root_path
  end

  def update
    if @idea.update(idea_params)
      redirect_to @idea, notice: 'Your idea successfully updated.'
    else
      render :edit
    end
  end

  private

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:title, :description, :fund_capital, :industries,
                                :problem_solved, :geographic_focus, :team_members,
                                :next_steps, :investor_require)
  end
end