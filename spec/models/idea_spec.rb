require 'rails_helper'

RSpec.describe Idea, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :fund_capital }
  it { should validate_presence_of :industries }
  it { should validate_presence_of :problem_solved }
  it { should validate_presence_of :geographic_focus }
  it { should validate_presence_of :team_members }
  it { should validate_presence_of :next_steps }
  it { should validate_presence_of :investor_require }
end
