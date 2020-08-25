require 'rails_helper'
RSpec.describe 'Groupモデルのテスト', type: :model do
	describe 'バリデーションのテスト' do
		let(:user) { create(:user) }
		let!(:group) { build(:group, user_id: user.id) }
		context 'nameカラム' do
			it '空欄でないこと' do
				group.name = ''
				expect(group.valid?).to eq false;
			end
		end
	end
	describe 'アソシエーションのテスト' do
    context 'Groupモデルとの関係' do
      it '1:Nとなっている' do
        expect(Group.reflect_on_association(:todolists).macro).to eq :has_many
      end
    end
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Group.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
