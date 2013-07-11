require 'spec_helper'

describe Organization do
  it { should validate_presence_of(:name) }
  it { should have_many(:memberships) }
  it { should have_many(:users).through(:memberships) }
  it { should have_many(:api_keys) }
end
