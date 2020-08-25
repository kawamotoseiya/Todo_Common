require 'rails_helper'
	describe 'ユーザーのテスト' do
	let(:user) { create(:user) }
	before do
		visit new_user_session_path
    	fill_in 'user[name]', with: user.name
    	fill_in 'user[password]', with: user.password
    	click_button 'ログイン'
    	click_on 'お問い合わせ'
		fill_in 'inquiry[name]', with: user.name
		fill_in 'inquiry[email]', with: user.email
		fill_in 'inquiry[message]', with: 'メッセージ'
		click_on '確認'
		click_on '送信'
	end
	context 'お問い合わせサンクス画面' do
		it "お問い合わせサンクス画面への遷移" do
			expect(page).to have_content "お問い合わせいただきありがとうございました。"
		end
	end
end
