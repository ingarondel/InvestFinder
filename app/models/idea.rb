class Idea < ApplicationRecord
  belongs_to :user

  validates :title,          :description,      :fund_capital, :industries,
            :problem_solved, :geographic_focus, :team_members,
            :next_steps,     :investor_require, presence: true
end
