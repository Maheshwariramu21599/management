require 'rails_helper'

RSpec.describe "Workers", type: :request do
  describe "GET /workers" do
    before do
      allow(controller).to receive(:authenticate_user!).and_return(true)
    end
    it "works! (now write some real specs)" do
      get workers_path
      expect(response).to have_http_status(302)
    end
  end
end
