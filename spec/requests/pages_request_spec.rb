require 'rails_helper'

RSpec.describe "Pages", type: :request do

  describe "GET /" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
      expect(response.body).to match "Hello Tufts Code for Good!"
    end
  end

end
