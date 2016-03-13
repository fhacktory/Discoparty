require 'rails_helper'

describe Vote do
  it { should belong_to(:user) }
  it { should belong_to(:track) }

  it { should validate_presence_of(:vote_type) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:track) }
end
