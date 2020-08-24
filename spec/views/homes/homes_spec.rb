require 'rails_helper'
describe 'ユーザーのテスト' do
	before do
		visit root_path
	end
	context 'TOPページ' do
		it "TOPページへの遷移" do
			expect(page).to have_content "welcome to TodoCommon"
		end
		it "ログインページへの遷移" do
			click_on 'Log in'
			expect(current_path).to eq('/users/sign_in')
		end
		it "ユーザー新規作成画面への遷移" do
			click_on 'Sign up'
			expect(current_path).to eq('/users/sign_up')
		end
	end
end