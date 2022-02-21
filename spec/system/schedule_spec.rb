# require 'rails_helper'
# RSpec.describe 'スケジュール機能', type: :system do
#   describe '運動スケジュール表示機能' do
#     before do
#       @login_user = FactoryBot.create(:login_user)
#       @exercise = FactoryBot.create(:third_exercise, user_id: @login_user.id)
#       @second_exercise = FactoryBot.create(:forth_exercise, user_id: @login_user.id)
#       @yesterday_exercise = FactoryBot.create(:fifth_exercise, user_id: @login_user.id)
#       visit new_user_session_path
#       fill_in 'user[email]',with: @login_user.email
#       fill_in 'user[password]', with: @login_user.password
#       find('input[type="submit"]').click
#       click_on '運動する・記録する'
#     end
#     context '当日の運動を登録すると' do
#       it '運動内容が表示される' do
#         click_on '運動内容を登録する'
#         fill_in 'exercise[name]',with: "ストレッチ"
#         fill_in 'exercise[description]',with: "ゆっくり膝を曲げてください"
#         fill_in 'exercise[count]',with: 10
#         fill_in 'exercise[set_count]',with: 10
#         fill_in 'exercise[minute]',with: 5
#         fill_in 'exercise[second]',with: 5
#         image_path = Rails.root.join('spec/fixtures/test.png')
#         video_path = Rails.root.join('spec/fixtures/test.mp4')
#         attach_file('exercise[image]', image_path, make_visible: true)
#         attach_file('exercise[video]', video_path, make_visible: true)
#         fill_in 'exercise[schedules_attributes][0][fixed_day]',with: Date.today
#         click_on '登録する'
#         sleep 0.5
#         schedule_exercise_name = all('#schedule_exercise_name')
#         expect(schedule_exercise_name[2]).to have_content 'ストレッチ'
#       end
#     end
#     context '運動の記録を見るボタンを押すと' do
#       it '運動の記録画面に遷移する' do
#         click_on '過去に実施した運動を確認する'
#         expect(page).to have_content('運動の記録')
#       end
#     end
#     context '運動記録画面で戻るボタンを押すと' do
#       it '運動・記録ページに遷移する' do
#         click_on '過去に実施した運動を確認する'
#         click_on '戻る'
#         sleep 0.5
#         expect(page).to have_content("マイケルさんの運動・記録ページ")
#         end
#       end
#     context '過去に実施した運動を確認するボタンを押すと'do
#       it '過去に実施した運動の一覧画面に遷移する' do
#         click_on '過去に実施した運動を確認する'
#         expect(page).to have_content('過去に実施した運動の一覧')
#       end
#     end
#     context '過去に実施した運動を確認するボタンを押すと'do
#       it '過去に実施した運動の一覧画面に遷移する' do
#         click_on '過去に実施した運動を確認する'
#         click_on '戻る'
#         sleep 0.5
#         expect(page).to have_content("マイケルさんの運動・記録ページ")
#       end
#     end
#     context '過去に実施した運動の一覧画面で運動を実施した日付で検索すると' do
#       it '選択した日付の運動が一覧に出現する' do
#         click_on '過去に実施した運動を確認する'
#         @yesterday = Date.today - 1
#         fill_in 'q[fixed_day_gteq]', with: @yesterday
#         fill_in 'q[fixed_day_lteq_end_of_day]', with: @yesterday
#         click_on '検索する'
#         schedule_exercise_name = all('#schedule_exercise_name')
#         expect(schedule_exercise_name[0]).to have_content("#{@yesterday_exercise.name}")
#         expect(schedule_exercise_name[1]).to_not have_content("#{@exercise.name}")
#       end
#     end
#     context '過去に実施した運動の一覧画面でセレクトボックスで「実施」の検索を行うと' do
#       it '実施の運動が表示される' do
#         click_on '過去に実施した運動を確認する'
#         find('#q_is_done_eq').find('option[value="true"]').select_option
#         click_on '検索する'
#         expect(page).to have_content(@yesterday_exercise.name)
#       end
#     end
#     context '過去に実施した運動の一覧画面でセレクトボックスで「未実施」の検索を行うと' do
#       it '未実施の運動が表示される' do
#         click_on '過去に実施した運動を確認する'
#         find('#q_is_done_eq').find('option[value="false"]').select_option
#         click_on '検索する'
#         expect(page).to have_content(@exercise.name)
#         expect(page).to have_content(@second_exercise.name)
#       end
#     end
#     context '運動を実施した日付の検索と実施/未実施検索を行う' do
#       it '今日の日付と実施を選択すると何も表示されない' do 
#         click_on '過去に実施した運動を確認する'
#         @today = Date.today
#         fill_in 'q[fixed_day_gteq]', with: @today
#         fill_in 'q[fixed_day_lteq_end_of_day]', with: @today
#         find('#q_is_done_eq').find('option[value="true"]').select_option
#         click_on '検索する'
#         expect(page).to_not have_content(@yesterday_exercise.name)
#         expect(page).to_not have_content(@exercise.name)
#         expect(page).to_not have_content(@second_exercise.name)
#       end
#       it '昨日の日付と実施を選択すると@yesterday_exerciseが表示される'do
#         click_on '過去に実施した運動を確認する'
#         fill_in 'q[fixed_day_gteq]', with: @yesterday
#         fill_in 'q[fixed_day_lteq_end_of_day]', with: @yesterday
#         find('#q_is_done_eq').find('option[value="true"]').select_option
#         click_on '検索する'
#         expect(page).to have_content(@yesterday_exercise.name)
#         expect(page).to_not have_content(@exercise.name)
#         expect(page).to_not have_content(@second_exercise.name)
#       end
#       it '今日の日付と未実施を選択すると@exersise,@second_exerciseが表示される'do
#         click_on '過去に実施した運動を確認する'
#         @today = Date.today
#         fill_in 'q[fixed_day_gteq]', with: @today
#         fill_in 'q[fixed_day_lteq_end_of_day]', with: @today
#         find('#q_is_done_eq').find('option[value="false"]').select_option
#         click_on '検索する'
#         expect(page).to_not have_content(@yesterday_exercise.name)
#         expect(page).to have_content(@exercise.name)
#         expect(page).to have_content(@second_exercise.name)
#       end
#       it '昨日の日付と未実施を選択すると何も表示されない' do
#         click_on '過去に実施した運動を確認する'
#         sleep 0.5
#         @yesterday = Date.today - 1
#         fill_in 'q[fixed_day_gteq]', with: @yesterday
#         fill_in 'q[fixed_day_lteq_end_of_day]', with: @yesterday
#         find('#q_is_done_eq').find('option[value="false"]').select_option
#         click_on '検索する'
#         expect(page).to_not have_content(@yesterday_exercise.name)
#         expect(page).to_not have_content(@exercise.name)
#         expect(page).to_not have_content(@second_exercise.name)
#       end
#     end
#   end
# end