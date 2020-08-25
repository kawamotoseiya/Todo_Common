require 'rails_helper'
RSpec.describe 'todolistモデルのテスト', type: :model do
	describe 'バリデーションのテスト' do
		let(:user) { create(:user) }
		let!(:group) { create(:group, user_id: user.id) }
		let!(:todolist) { build(:todolist, group_id: group.id) }
		context 'headカラム' do
			it '空欄でないこと' do
				todolist.head = ''
				expect(todolist.valid?).to eq false;
			end
		end
	end
	describe 'アソシエーションのテスト' do
    context 'コメントモデルとの関係' do
      it '1:Nとなっている' do
        expect(Todolist.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
    context 'Groupモデルとの関係' do
      it 'N:1となっている' do
        expect(Todolist.reflect_on_association(:group).macro).to eq :belongs_to
      end
    end
  end
end
