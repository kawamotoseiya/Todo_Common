require 'rails_helper'
RSpec.describe 'Userモデルのテスト', type: :model do
	describe 'バリデーションのテスト' do
		let(:user) { build(:user) }
		context 'nameカラム' do
			it '空欄でないこと' do
				user.name = ''
				expect(user.valid?).to eq false;
			end
		end
		context 'emailカラム' do
			it '空欄でないこと' do
				user.email = ''
				expect(user.valid?).to eq false;
			end
		end
	end
	describe 'アソシエーションのテスト' do
    context 'Groupモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:groups).macro).to eq :has_many
      end
    end
    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
  end
end
