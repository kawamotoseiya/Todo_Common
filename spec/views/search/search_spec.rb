require 'rails_helper'
describe 'ユーザーのテスト' do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }
  before do
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
    fill_in 'search[content]', with: group.id
    click_on '検索'
  end
  describe "グループ検索ページ" do
  	context 'グループ検索' do
  	  it "グループ検索ページへの遷移" do
  	  	expect(page).to have_content "検索結果"
  	  end
  	  it '検索したグループが表示される' do
  		expect(page).to have_content group.name
  	  end
  	  it 'グループ検索見つからない時' do
  	  	fill_in 'search[content]', with: '100'
  	  	click_on '検索'
  	  	expect(page).to have_content "一致するグループは見つかりませんでした。"
  	  end
  	end
  end
end