require 'rails_helper'
RSpec.describe 'Commentモデルのテスト', type: :model do
	describe 'バリデーションのテスト' do
		let(:user) { create(:user) }
		let!(:group) { create(:group, user_id: user.id) }
		let!(:todolist) { create(:todolist, group_id: group.id) }
		let!(:comment) { build(:comment, user_id: user.id, todolist_id: todolist.id) }
		context 'commentカラム' do
			it '空欄でないこと' do
				comment.comment = ''
				expect(comment.valid?).to eq false;
			end
		end
	end
	describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Todolistモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:todolist).macro).to eq :belongs_to
      end
    end
  end
end