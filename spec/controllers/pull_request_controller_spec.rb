require "rails_helper"
require "ostruct"

describe PullRequestsController do

  describe "requires authorization" do

    before do
      set_up_faked_github_oauth
    end

    it "to get the form to submit a pr" do
      get :new
      expect(response).to redirect_to(@github_auth_url)
    end

    it "to submit a pr" do
      post :create
      expect(response).to redirect_to(@github_auth_url)
    end

    it "to take a pr" do
      post :take, pull_request_id: 1
      expect(response).to redirect_to(@github_auth_url)
    end

  end

end