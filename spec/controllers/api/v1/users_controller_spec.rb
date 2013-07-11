require 'spec_helper'

describe Api::V1::UsersController do

  before(:each) do
    @joe = FactoryGirl.create(:user)
    @joe_key = @joe.session_api_key
  end

  describe "index" do
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
      results['users'].should have(3).things
    end
  end

  describe "#show" do
    it "without token in header" do
      get 'show', { id: @joe.id }
      response.status.should eq(401)
    end

    it "with expired token" do
      @joe_key.update_attribute(:expired_at, 30.days.ago)
      ApiKey.active.map(&:id).should_not include @joe_key.id
      get 'show', { id: @joe.id }, { 'Authorization' => "Bearer #{@joe_key.access_token}" }
      response.status.should eq(401)
    end

    it "with valid token" do
      get 'show', { id: @joe.id }, { 'Authorization' => "Bearer #{@joe_key.access_token}" }
      results = JSON.parse(response.body)
      results['user']['id'].should == @joe.id
      results['user']['name'].should == @joe.name
    end
  end

  describe "#create" do
    it "with valid data" do
      post 'create', {
        user: {
          name: 'Billy Blowers',
          email: 'billy_blowers@example.com',
          password: 'secret',
          password_confirmation: 'secret'
        }
      }
      results = JSON.parse(response.body)
      assert results['api_key']['access_token'] =~ /\S{32}/
      assert results['api_key']['user_id'] > 0
    end

    it "with invalid data" do
      post 'create', {
        user: {
          name: '',
          email: 'foo',
          password: 'secret',
          password_confirmation: 'something_else'
        }
      }
      results = JSON.parse(response.body)
      assert results['errors'].size == 3
    end
  end

end
