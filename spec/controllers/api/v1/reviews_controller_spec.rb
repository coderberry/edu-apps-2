require 'spec_helper'

describe Api::V1::ReviewsController do
  before(:each) do
    @lti_app = FactoryGirl.create(:lti_app)
    @organization = FactoryGirl.create(:organization)
    @api_key = @organization.regenerate_api_key
  end

  describe "contributing a review" do
    before(:each) do
      @data = {
        lti_app_id: @lti_app.short_name,
        access_token: @api_key.access_token,
        rating: 3,
        user_name: 'Joe Blow',
        user_email: 'joe.blow@example.com',
        user_id: '123456',
        user_url: 'http://example.com/joe.blow',
        user_avatar_url: 'http://example.com/joe-blow.png',
        comments: 'This test code is really helpful!'
      }

      @user = FactoryGirl.create(:user, email: 'something@blah.com')
      @user_api_key = @user.api_keys.active.api.create
    end

    it "with missing token" do
      post 'create', @data.merge({ access_token: nil })
      response.status.should == 422
    end

    it "with invalid token" do
      post 'create', @data.merge({ access_token: 'abcde' })
      response.status.should == 422
    end

    it "with user token instead of organization" do
      @user.reviews.count.should == 0
      post 'create', @data.merge({ access_token: @user_api_key.access_token })
      @user.reviews.count.should == 1
    end

    it "with existing user" do
      @user.reviews.count.should == 0
      @user.is_member?(@organization).should be_false
      post 'create', @data.merge({ user_email: @user.email })
      @user.reviews.count.should == 1
      @user.is_member?(@organization).should be_true
    end

    it "with new user" do
      User.where(email: @data[:user_email]).should_not exist
      post 'create', @data
      json = JSON.parse(response.body)
      puts json
      user = User.where(email: @data[:user_email]).first
      user.reviews.count.should == 1
      user.is_member?(@organization).should be_true
      user.is_activated?.should be_false
    end
  end

  describe "getting all reviews" do
  end

  describe "getting a specific review" do
  end
end
