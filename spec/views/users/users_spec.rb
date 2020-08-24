require 'rails_helper'
describe 'ユーザーのテスト' do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:group) { create(:group, user: user) }
  before do
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
    click_on 'ユーザー情報編集'
  end
  describe 'ユーザー編集ページ' do
  	context 'グループ編集' do
  		it "グループ編集への遷移" do
        	expect(page).to have_content "ユーザー編集"
      	end
      	it "グループ編集の成功" do
      		click_on 'ユーザー情報更新'
      		expect(page).to have_content "ユーザーデータを更新しました！"
      	end
      	it "グループ編集の失敗" do
      		fill_in 'user[name]', with: ''
      		click_on 'ユーザー情報更新'
      		expect(page).to have_content "エラー"
      	end
    end
  end
end