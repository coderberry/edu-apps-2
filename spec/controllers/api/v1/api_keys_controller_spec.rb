require 'spec_helper'

describe Api::V1::ApiKeysController do

  before(:each) do
    @joe = FactoryGirl.create(:user)
    @good_key = FactoryGirl.create(:api_key, { scope: 'api', tokenable: @joe })
    @expired_key = FactoryGirl.create(:api_key, { scope: 'api', tokenable: @joe })
    @expired_key.update_attribute(:expired_at, 30.days.ago)
  end

  describe "#index" do
    it "should return only the active api tokens for an access token" do
      get 'index', {}, { 'Authorization' => "Bearer #{@good_key.access_token}" }
      results = JSON.parse(response.body)
      @joe.api_keys.size.should == 2
      results['api_keys'].should have(1).thing
    end
  end

  describe "#create" do
    it "should create a new api token for a user" do
      post 'create', {}, { 'Authorization' => "Bearer #{@good_key.access_token}" }
      results = JSON.parse(response.body)
      results['api_key']['user_id'].should == @joe.id
      results['api_key']['access_token'].should match /\S{32}/
    end

    it "should create a new api token for an organization" do
      organization = @joe.organizations.create!(name: 'My Org')
      organization.memberships.where(user_id: @joe.id).first.update_attribute(:is_admin, true)
      post 'create', { api_key: { organization_id: organization.id } }, { 'Authorization' => "Bearer #{@good_key.access_token}" }
      results = JSON.parse(response.body)
      puts results.inspect
      results['api_key']['organization_id'].should == organization.id
      results['api_key']['access_token'].should match /\S{32}/
    end
  end

  describe "#destroy" do
    it "should destroy an api token" do
      existing_token = FactoryGirl.create(:api_key, { scope: 'api', tokenable: @joe })
      delete 'destroy', { id: existing_token.id }, { 'Authorization' => "Bearer #{@good_key.access_token}" }
      response.status.should == 200
    end
  end

end
