require "rails_helper"

RSpec.describe LiveRecordsController do
  let(:user) { create(:user) }

  describe "GET /new" do
    before do
      sign_in user
      get new_live_record_path
    end

    it "レスポンスが正しく返されること" do
      expect(response).to have_http_status(:success)
    end

    it "情報が表示されること" do
      expect(response.body).to include('ライブ予定')
      expect(response.body).to include('name="live_record[name]"')
      expect(response.body).to include('name="live_record[date]"')
    end
  end
end
