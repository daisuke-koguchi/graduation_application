# require 'rails_helper'
# RSpec.describe 'スケジュールのボタン機能', type: :system do
#   describe '運動一覧画面のボタンの機能' do
#     before do 
#       @login_user = FactoryBot.create(:login_user)
#       @exercise = FactoryBot.create(:exercise, user_id: @login_user.id)
#       @second_exercise = FactoryBot.create(:second_exercise, user_id: @login_user.id)
#       visit new_user_session_path
#       fill_in 'user[email]',with: @login_user.email
#       fill_in 'user[password]', with: @login_user.password
#       find('input[type="submit"]').click
#       click_on '運動する・記録する'
#     end
#     context '運動実施一覧画面で未実施ボタンを押すと' do
#       it '実施に切り替わる' do
#         click_on '未実施', match: :first
#         expect(page).to have_content('実施')
#       end
#     end
#     context '運動実施一覧画面で未実施ボタン2回押すと' do
#       it '実施ボタンを経て未実施ボタンに切り替わる' do
#         click_on '未実施', match: :first
#         click_on '実施', match: :first
#         expect(page).to have_content('未実施')
#       end
#     end
#     context '運動実施一覧画面で未実施ボタンを押すと' do
#       it '実施実施に切り替わる' do
#         click_on '過去に実施した運動を確認する'
#         click_on '未実施', match: :first
#         expect(page).to have_content('実施')
#       end
#     end
#     context '運動実施一覧画面で未実施ボタン2回押すと' do
#       it '未実施ボタンに切り替わる' do
#         click_on '過去に実施した運動を確認する'
#         click_on '未実施', match: :first
#         click_on '実施', match: :first
#         expect(page).to have_content('未実施')
#       end
#     end
#   end
# end