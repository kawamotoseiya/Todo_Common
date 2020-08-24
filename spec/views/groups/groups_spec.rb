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
  describe "グループ一覧ページ" do
    context 'グループ一覧' do
      it "グループ一覧への遷移" do
        expect(page).to have_content "グループ一覧"
      end
      it "新規投稿成功" do
        find('#group-new-button').click
        fill_in 'group[name]', with: group.name
        choose "有効"
        click_on 'グループ新規作成'
        expect(page).to have_content "新たなグループを作成しました！"
      end
        it "新規投稿エラー" do
        find('#group-new-button').click
        click_on 'グループ新規作成'
        find('#group-new-button').click
        expect(page).to have_content 'エラー'
      end
    end
  end
end
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
    click_on 'グループ編集'
  end
  describe "グループ編集ページ" do
    context 'グループ編集' do
      it "グループ編集への遷移" do
        expect(page).to have_content 'グループ編集'
      end
      it "グループ編集成功" do
        click_on '更新'
        expect(page).to have_content 'グループを更新しました！'
      end
      it "グループ編集失敗" do
        fill_in 'group[name]', with: ''
        click_on '更新'
        expect(page).to have_content 'エラー'
      end
    end
  end
end