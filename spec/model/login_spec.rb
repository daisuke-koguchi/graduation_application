require 'rails_helper'
RSpec.describe 'dvevise機能', type: :model do
  describe '新規会員登録機能' do
    context '姓、名、ニックネーム、インストラクションがある場合' do 
      it 'バリデーションに引っかからない' do
        user = FactoryBot.build(:model_user)
        expect(user).to be_valid
      end
    end
    context '姓が空欄の場合' do 
      it 'バリデーションに引っかかる' do 
        user = FactoryBot.build(:model_user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください", "は1文字以上で入力してください")
      end
    end
    context '姓が21文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:model_user, first_name: "a" * 21 )
        user.valid?
        expect(user.errors[:first_name]).to include("は20文字以内で入力してください")
      end
    end
    context '姓が20文字以内の場合' do
      it 'バリデーションにかからない' do
        user = FactoryBot.build(:model_user, first_name: "a" * 20 )
        expect(user).to be_valid
      end
    end
    context '名が空欄の場合' do 
      it 'バリデーションに引っかかる' do 
        user = FactoryBot.build(:model_user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include("を入力してください", "は1文字以上で入力してください")
      end
    end
    context '名が20文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:model_user, last_name: "a" * 21 )
        user.valid?
        expect(user.errors[:last_name]).to include("は20文字以内で入力してください")
      end
    end
    context '名が20文字以内の場合' do
      it 'バリデーションにかからない' do
        user = FactoryBot.build(:model_user, last_name: "a" * 20 )
        expect(user).to be_valid
      end
    end
    
    context 'ニックネームが空欄の場合' do 
      it 'バリデーションに引っかかる' do 
        user = FactoryBot.build(:model_user, nick_name: nil)
        user.valid?
        expect(user.errors[:nick_name]).to include("を入力してください", "は1文字以上で入力してください")
      end
    end
    context 'ニックネームが20文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:model_user, nick_name: "a" * 21 )
        user.valid?
        expect(user.errors[:nick_name]).to include("は20文字以内で入力してください")
      end
    end
    context '名が20文字以内の場合' do
      it 'バリデーションにかからない' do
        user = FactoryBot.build(:model_user, nick_name: "a" * 20 )
        expect(user).to be_valid
      end
    end

    context '自己紹介が2001字以上場合' do 
      it 'バリデーションに引っかかる' do 
        user = FactoryBot.build(:model_user, introduction: "a" * 2001 )
        user.valid?
        expect(user.errors[:introduction]).to include("は2000文字以内で入力してください")
      end
    end
    context '自己紹介が空欄の場合' do
      it 'バリデーションに引っかからない' do
        user = FactoryBot.build(:model_user, introduction: nil )
        expect(user).to be_valid
      end
    end
  end
end