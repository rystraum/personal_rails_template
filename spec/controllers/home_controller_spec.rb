require 'spec_helper'

describe HomeController do
  render_views

  describe "GET 'index'" do
    it do
      get 'index'
      response.should be_success
    end
  end
end
