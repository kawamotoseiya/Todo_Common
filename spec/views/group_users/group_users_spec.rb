require 'rails_helper'
describe 'ユーザーのテスト' do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }
  before do
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
end