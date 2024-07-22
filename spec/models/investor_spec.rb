require 'rails_helper'

RSpec.describe Investor, type: :model do
  it { should have_one(:response).dependent(:destroy)}

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:surname) }
end
