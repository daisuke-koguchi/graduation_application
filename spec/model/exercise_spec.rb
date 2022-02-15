require 'rails_helper'
RSpec.describe '運動機能', type: :model do
  describe '運動機能のバリデーションテスト' do
    context '運動の名前と説明がある場合' do 
      it 'バリデーションに引っかからない' do
        user = FactoryBot.build(:user)
        exercise = FactoryBot.build(:exercise)
        expect(exercise).to be_valid
      end
    end
    context '運動の名前が空白の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user)
        exercise = FactoryBot.build(:exercise, name: nil)
        expect(exercise.valid?).to eq false;
      end
    end
    context '運動の名前が51文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user)
        exercise = FactoryBot.build(:exercise, name: "a" * 51)
        expect(exercise.valid?).to eq false;
      end
    end
    context '運動の説明が空白の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user)
        exercise = FactoryBot.build(:exercise, description: nil)
        expect(exercise.valid?).to eq false;
      end
    end
    context '運動の説明が1001文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user)
        exercise = FactoryBot.build(:exercise, description: "a" * 1001)
        expect(exercise.valid?).to eq false;
      end
    end
    context '運動の名前と説明が空白の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user)
        exercise = FactoryBot.build(:exercise, name: nil , description: nil)
        expect(exercise.valid?).to eq false;
      end
    end
  end
end