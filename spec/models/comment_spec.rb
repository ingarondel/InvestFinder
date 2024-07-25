require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:idea) }
  it { should belong_to(:user) }
  it { should have_many(:reactions).dependent(:destroy) }

  it { should validate_presence_of(:content) }
end
