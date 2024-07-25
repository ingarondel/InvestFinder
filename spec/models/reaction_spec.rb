require 'rails_helper'

RSpec.describe Reaction, type: :model do
  it { should belong_to(:reactable) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:reaction_type) }
end
