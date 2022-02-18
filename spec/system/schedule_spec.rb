require 'rails_helper'
RSpec.describe 'スケジュール機能', type: :system do
  describe '運動スケジュール表示機能' do
    before do
      @login_user = FactoryBot.create(:login_user)
      @exercise = FactoryBot.create(:third_exercise, user_id: @login_user.id)
      @second_exercise = FactoryBot.create(:forth_exercise, user_id: @login_user.id)
      @yesterday_exercise = FactoryBot.create(:fifth_exercise, user_id: @login_user.id)
      visit new_user_session_path
      fill_in 'user[email]',with: @login_user.email
      fill_in 'user[password]', with: @login_user.password
      find('input[type="submit"]').click
      click_on '運動する・記録する'
    end
  
    # context '当日の運動を登録すると' do
    #   it '運動内容が表示される' do
    #     click_on '運動内容を登録する'
    #     fill_in 'exercise[name]',with: "ストレッチ"
    #     fill_in 'exercise[description]',with: "ゆっくり膝を曲げてください"
    #     fill_in 'exercise[count]',with: 10
    #     fill_in 'exercise[set_count]',with: 10
    #     fill_in 'exercise[minute]',with: 5
    #     fill_in 'exercise[second]',with: 5
    #     image_path = Rails.root.join('spec/fixtures/test.png')
    #     video_path = Rails.root.join('spec/fixtures/test.mp4')
    #     attach_file('exercise[image]', image_path, make_visible: true)
    #     attach_file('exercise[video]', video_path, make_visible: true)
    #     fill_in 'exercise[schedules_attributes][0][fixed_day]',with: Date.today
    #     click_on '登録する'
    #     sleep 0.5
    #     schedule_exercise_name = all('#schedule_exercise_name')
    #     expect(schedule_exercise_name[2]).to have_content 'ストレッチ'
    #   end
    # end
    # context '運動の記録を見るボタンを押すと' do
    #   it '運動の記録画面に遷移する' do
    #     click_on '過去に実施した運動を確認する'
    #     expect(page).to have_content('運動の記録')
    #   end
    # end
    # context '過去に実施した運動を確認するボタンを押すと'do
    #   it '過去に実施した運動の一覧画面に遷移する' do
    #     click_on '過去に実施した運動を確認する'
    #     expect(page).to have_content('過去に実施した運動の一覧')
    #   end
    # end
    
    context '過去に実施した運動の一覧画面で運動を実施した日付で検索すると' do
      it '選択した日付の運動が一覧に出現する' do
        click_on '過去に実施した運動を確認する'
        @day = Date.today - 1
        fill_in 'q[fixed_day_gteq]', with: @day
        fill_in 'q[fixed_day_lteq_end_of_day]', with: @day
        click_on '検索する'
        expect(page).to have_content("#{@yesterday_exercise.name}")
        expect(page).to_not have_content("#{@yesterday_exercise.name}")
        expect(page).to_not have_content("#{@yesterday_exercise.name}")
      end
    end

  end
end
  #   context '過去に実施した運動の一覧画面で実施/未実施検索を行う' do
  #     it '実施を選択すると実施した運動が出現する' do

  #     end
  #     it '未実施を選択すると未実施の運動が出現する' do

  #     end
  #   end
  #   context '運動を実施した日付の検索と実施/未実施検索を行うと' do
  #     it '両方の条件に当てはまるものが表示される'
  #   end
  #   context '過去に実施した運動ボタンを押すと' do
  #     it '画面に遷移する' do

  #     end
#   #   end
#   end
#   describe 
# end