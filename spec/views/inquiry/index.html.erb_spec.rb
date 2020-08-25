require 'rails_helper'
  describe 'ユーザーのテスト' do
  let(:user) { create(:user) }
  before do
    visit new_user_session_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      click_on 'お問い合わせ'
  end
  context 'お問い合わせの入力画面' do
    it "お問い合わせ入力画面への遷移" do
      expect(page).to have_content "お問い合わせ内容"
    end
    it "お問い合わせ入力成功" do
    fill_in 'inquiry[name]', with: user.name
    fill_in 'inquiry[email]', with: user.email
    fill_in 'inquiry[message]', with: 'メッセージ'
    click_on '確認'
    expect(page).to have_content 'お問い合わせ内容'
    end
    it "お問い合わせ入力失敗" do
    fill_in 'inquiry[name]', with: ''
    fill_in 'inquiry[email]', with: ''
    click_on '確認'
    expect(page).to have_content 'エラー'
    end
  end
end
