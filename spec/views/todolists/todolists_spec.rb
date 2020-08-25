require 'rails_helper'
describe 'ユーザーのテスト' do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }
  let(:todolist) { create(:todolist, group: group) }
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
  end
  	context 'Todoリスト一覧' do
  		it "Todoリスト一覧ページへの遷移" do
  			expect(page).to have_content "新しいTODOリストを作成しましょう!"
  		end
  	end
  context 'Todoリスト新規作成' do
  		it "Todoリスト新規作成ページへの遷移" do
  			click_on '＋TODOリスト'
  			expect(page).to have_content "todolist作成"
  		end
  		it "Todoリスト新規作成の成功" do
  			click_on '＋TODOリスト'
  			fill_in 'todolist[head]', with: todolist.head
  			click_on '作成'
  			expect(page).to have_content "TODOリストを作成しました！"
  		end
  		it "Todoリスト新規作成の失敗" do
  			click_on '＋TODOリスト'
  			fill_in 'todolist[head]', with: ''
  			click_on '作成'
  			expect(page).to have_content "エラー"
  		end
  end
end
describe 'ユーザーのテスト' do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }
  let(:todolist) { create(:todolist, group: group) }
  let(:check) { create(:check, user: user, todolist: todolist) }
  let(:comment) { create(:comment, user: user, todolist: todolist) }
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
    click_on '＋TODOリスト'
    fill_in 'todolist[head]', with: todolist.head
    click_on '作成'
  end
  describe "Todoリスト一覧ページ" do
  	context 'Todoリスト一覧' do
  		it "Todoリストの表示確認" do
  			expect(page).to have_content todolist.head
  		end
  		it "Todoリストの協力の増加" do
        page.first(".interpreting-button").click
  			expect(page).to have_content "1人参加"
  		end
  		it "Todoリストの協力の減少" do
  			find(".interpreting-button").click
        find(".interpreting-button").click
  			expect(page).to have_content "0人参加"
  		end
      it "Todoリスト編集ページへの遷移" do
        click_on '編集'
        expect(page).to have_content "編集"
      end
      it "Todoリスト編集の成功" do
        click_on '編集'
        click_on '更新'
        expect(page).to have_content "TODOリストを更新しました！"
      end
      it "Todoリスト編集の失敗" do
        click_on '編集'
        fill_in 'todolist[head]', with: ''
        click_on '更新'
        expect(page).to have_content "エラー"
      end
      it "Todoリスト詳細ページへの遷移" do
        click_on '詳細'
        expect(page).to have_content todolist.head
      end
      it "Todoリスト詳細でのコメント投稿" do
        click_on '詳細'
        fill_in 'comment[comment]', with: comment.comment
        click_on 'コメントする'
        expect(page).to have_content comment.comment
      end
      it "Todoリストの削除" do
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(current_path).to eq('/groups/' + 2.to_s + '/todolists')
      end
  	end
  end
end