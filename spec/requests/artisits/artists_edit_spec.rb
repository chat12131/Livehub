require "rails_helper"

RSpec.describe "Artists" do
  describe "PUT /artists/:id" do
    let(:user) { create(:user) }
    let(:artist) { create(:artist, user:) }

    before do
      sign_in user
      get edit_artist_path(artist)
    end

    it "レスポンスが正しく返されること" do
      expect(response).to be_successful
    end

    context "有効な属性を持つとき" do
      it "アーティスト情報が正しく更新されること" do
        put artist_path(artist), params: { artist: { name: "新しいアーティスト名", genre: "Jpop" } }
        expect(response).to redirect_to(artists_path(selected_artist_id: 1))
        artist.reload
        expect(artist.name).to eq("新しいアーティスト名")
        expect(artist.genre).to eq("Jpop")
      end
    end

    context "無効な属性を持つとき" do
      it "アーティスト情報が更新されないこと" do
        put artist_path(artist), params: { artist: { name: "", genre: "Jpop" } }
        expect(response).to render_template(:edit)
        artist.reload
        expect(artist.name).not_to eq("")
      end
    end

    it "メンバーフィールドが含まれること" do
      expect(response.body).to include "メンバーの名前"
    end

    it "「更に追加」ボタンが存在すること" do
      expect(response.body).to include "更に追加"
    end
  end
end
