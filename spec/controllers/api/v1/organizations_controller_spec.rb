require 'spec_helper'

describe Api::V1::OrganizationsController do

  before(:each) do
    @joe = FactoryGirl.create(:user)
    @joe_key = @joe.session_api_key
    @org = FactoryGirl.create(:organization)
    @membership = @joe.memberships.create(is_admin: true, organization: @org)
  end

  describe "#index" do
    it "without token in header" do
      get 'index'
      response.status.should eq(401)
    end

    it "with invalid token" do
      get 'index', {}, { 'Authorization' => "Bearer 12345" }
      response.status.should eq(401)
    end

    it "with expired token" do
      @joe_key.update_attribute(:expired_at, 30.days.ago)
      assert !ApiKey.active.map(&:id).include?(@joe_key.id)
      get 'index', {}, { 'Authorization' => "Bearer #{@joe_key.access_token}" }
      response.status.should eq(401)
    end

    it "with valid token" do
      get 'index', {}, { 'Authorization' => "Bearer #{@joe_key.access_token}" }
      results = JSON.parse(response.body)
      results['organizations'].should have(1).thing
    end
  end

  describe "#show" do
    it "without token in header" do
      get 'show', { id: @org.id }
      response.status.should eq(401)
    end

    it "with expired token" do
      @joe_key.update_attribute(:expired_at, 30.days.ago)
      ApiKey.active.map(&:id).should_not include @joe_key.id
      get 'show', { id: @org.id }, { 'Authorization' => "Bearer #{@joe_key.access_token}" }
      response.status.should eq(401)
    end

    it "with valid token" do
      get 'show', { id: @org.id }, { 'Authorization' => "Bearer #{@joe_key.access_token}" }
      results = JSON.parse(response.body)
      results['organization']['id'].should == @org.id
      results['organization']['name'].should == @org.name
    end
  end

  describe "#create" do
    it "without token in header" do
      post 'create', { organization: { name: 'Instructure' } }
      response.status.should eq(401)
    end

    it "with valid token" do
      post 'create', { organization: { name: 'Instructure' } }, { 'Authorization' => "Bearer #{@joe_key.access_token}" }
      results = JSON.parse(response.body)
      results['organization']['name'].should == "Instructure"
      results['organization']['id'].should > 0
    end
  end

  describe "#update" do
    it "without token in header" do
      put 'update', { id: @org.id, organization: { name: 'URUG' } }
      response.status.should eq(401)
    end

    it "with valid token" do
      put 'update', { id: @org.id, organization: { name: 'URUG' } }, { 'Authorization' => "Bearer #{@joe_key.access_token}" }
      results = JSON.parse(response.body)
      results['organization']['name'].should == "URUG"
      results['organization']['id'].should eq(@org.id)
    end
  end

  describe "#destroy" do
    it "without token in header" do
      delete 'destroy', { id: @org.id }
      response.status.should eq(401)
    end

    it "without invalid organization id" do
      delete 'destroy', { id: -1 }, { 'Authorization' => "Bearer #{@joe_key.access_token}" }
      response.status.should eq(404)
    end

    it "with valid token" do
      delete 'destroy', { id: @org.id }, { 'Authorization' => "Bearer #{@joe_key.access_token}" }
      response.status.should eq(200)
    end
  end

end
