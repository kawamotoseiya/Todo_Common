require 'rails_helper'
describe 'ユーザーのテスト' do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }
  before do
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
    find('#group-new-button').click
    fill_in 'group[name]', with: group.name
    choose "有効"
    click_on 'グループ新規作成'
    click_on '詳細'
    click_on 'メンバー一覧'
  end
  describe 'メンバー一覧ページ' do
  	context 'メンバー一覧' do
  		it 'メンバー一覧ページへの遷移' do
  			expect(page).to have_content 'メンバー一覧'
  		end
  		it 'メンバー一覧の名前表示' do
  			expect(page).to have_content user.name
  		end
  	end
  end
end