require 'rails_helper'
RSpec.describe 'スケジュール機能', type: :model do
  describe 'スケジュール機能のバリデーションテスト' do
    context '運動実施日がある場合' do 
      it 'バリデーションに引っかからない' do
        user = FactoryBot.build(:user)
        exercise = FactoryBot.build(:second_exercise)
        schedule =  FactoryBot.build(:second_schedule)
        expect(schedule).to be_valid
      end
    end
    context '運動実施日がない場合' do 
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user)
        exercise = FactoryBot.build(:second_exercise)
        schedule =  FactoryBot.build(:second_schedule, fixed_day: nil)
        expect(schedule.valid?).to eq false;
      end
    end
  end
end