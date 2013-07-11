require 'spec_helper'

describe Api::V1::SessionController do
  describe "#create" do

    before(:each) do
      @pw = 'secret'
      @joe = FactoryGirl.create(:user, password: @pw)
    end

    it "with valid info" do
      post 'create', { email: @joe.email, password: @pw }
      results = JSON.parse(response.body)
      results['api_key']['access_token'].should match /\S{32}/
      results['api_key']['user_id'].should eq(@joe.id)
    end

    it "with no such email" do
      post 'create', { email: "something@email.com", password: @pw }
      response.status.should eq(404)
    end

    it "with invalid info" do
      post 'create', { email: @joe.email, password: 'huh' }
      response.status.should eq(401)
    end
  end
end
