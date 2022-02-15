require 'rails_helper'
RSpec.describe '運動機能', type: :model do
  describe '運動機能のバリデーションテスト' do
    context '名前がある場合' do 
      it 'バリデーションに引っかからない' do
        user = FactoryBot.build(:user)
        exercise = FactoryBot.build(:exercise)
        expect(exercise).to be_valid
      end
    end
    context '名前が空白の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user)
        binding.pry
        exercise = FactoryBot.build(:exercise, name: nil)
        expect(exercise.valid?).to eq false;
      end
    end
  end
end