require 'rails_helper'

RSpec.describe Response, type: :model do
  it { should belong_to(:investor).class_name('User') }
end
