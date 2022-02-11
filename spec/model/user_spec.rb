require 'rails_helper'
RSpec.describe 'dvevise機能', type: :model do
  describe '新規会員登録機能' do
    context '姓名、インストラクションがある場合' do 
      it 'バリデーションに引っかからない' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end
    context '姓が空欄の場合' do 
      it 'バリデーションに引っかかる' do 
        user = FactoryBot.build(:user, first_name: nil)
        user.valid?
        binding.break
        expect(user.errors[:first_name]).to include()
      end
    end
    context '姓が21文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user, first_name: "a" * 21 )

      end
    end
    context '姓が20文字以内の場合' do
      it 'バリデーションにかからない' do

      end
    end
    context '名が空欄の場合' do 
      it 'バリデーションに引っかかる' do 

      end
    end
    context '名が20文字以上の場合' do
      it 'バリデーションに引っかかる' do

      end
    end
    context '名が20文字以内の場合' do
      it 'バリデーションにかからない' do

      end
    end

    context '自己紹介が2000字を超えた場合' do 
      it 'バリデーションに引っかかる' do 

      end
    end
    context '自己紹介が空欄の場合' do
      it 'バリデーションに引っかからない' do

      end
    end
  end
end