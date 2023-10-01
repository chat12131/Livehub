require 'rails_helper'

RSpec.describe "LiveSchedules" do
  describe "新規ライブ予定作成ページ" do
    let(:user) { create(:user) }

    before do
      sign_in user
      visit new_live_schedule_path
    end

    it "ページが正常に表示されること" do
      expect(page).to have_content("ライブ予定作成")
    end

    it "正常な情報でライブ予定を作成すると、予定が保存されること", :js do
      execute_script("document.querySelector('#live_schedule_date').value = '2023-10-30'")
      find_by_id('venue-name-display').set("新しい会場名")
      execute_script("window.scrollBy(0,10000)")
      click_button "登録"

      expect(page).to have_content("新規作成")
    end
  end
end
