# require 'rails_helper'
# RSpec.describe 'コミュニティ機能', type: :system do
#   describe 'プロフィール確認機能' do
#     let!(:login_user){build(:user)}
#     before do
#       @user = FactoryBot.create(:user)
#       @second_user = FactoryBot.create(:login_test_user)
#       @login_user = create(:login_user)
#       @conversation = Conversation.create(sender_id: @login_user.id, recipient_id: @user.id)
#       visit new_user_session_path
#       fill_in 'user[email]',with: @login_user.email
#       fill_in 'user[password]', with: @login_user.password
#       find('input[type="submit"]').click
#       click_on 'マイページへ移動する'
#       click_on '仲間と交流する'
#     end
#     context 'マイページから、仲間と交流するをクリックすると' do 
#       it 'コミュニティページで新規登録したユーザーが表示される' do 
#         expect(page).to have_content("#{@login_user.nick_name}さんのコミュニティ")
#       end
#     end
#     context 'コミュニティページでユーザーの検索フォームにてニックネーム検索を行うと' do
#       it '入力したニックネームに一致するユーザーが表示される' do 
#         fill_in 'q[nick_name_cont]', with: @login_user.nick_name
#         click_on '検索'
#         sleep 0.5
#         expect(page).to have_content("#{@login_user.nick_name}")
#       end
#     end
#     context 'コミュニティから任意のユーザーのプロフィールを確認するボタンを押すと' do 
#       it '他の会員のプロフィール画面にアクセス出来る' do
#         expect(page).to have_link 'プロフィールを確認する',href: user_path(@user)
#         click_link 'プロフィールを確認する',href: user_path(@user)
#         expect(page).to have_content("#{@user.nick_name}")
#       end
#     end
#     context 'コミュニティページでニックネームのソートボタンを押すと' do 
#       it 'ユーザーが昇順に並び替えられる' do 
#         expect(page).to have_link 'ニックネーム'
#         click_link 'ニックネーム'
#         sleep 0.5
#         user_nick_name = all('#user_nick_name')
#         expect(user_nick_name[0]).to have_content "#{@second_user.nick_name}"
#         expect(user_nick_name[1]).to have_content "#{@user.nick_name}"
#       end
#       it '2回ソートボタンを押すと降順で並び変えられる' do
#         click_link 'ニックネーム'
#         sleep 0.5
#         click_link 'ニックネーム'
#         sleep 0.5
#         user_nick_name = all('#user_nick_name')
#         expect(user_nick_name[0]).to have_content "#{@user.nick_name}"
#         expect(user_nick_name[1]).to have_content "#{@second_user.nick_name}"
#       end
#     end
#     context 'コミュニティページで戻るボタンを押すと' do
#       it 'マイページに戻ることが出来る' do
#         click_on '戻る'
#         expect(page).to have_content("#{@login_user.nick_name}さんのマイページ")
#       end
#     end
#     context 'コミュニティから任意のユーザーのメッセージを確認するボタンを押すと' do 
#       it '他の会員とのメッセージ画面に移動することができる' do
#         expect(page).to have_link 'メッセージを確認する',href: conversations_path(sender_id: @login_user.id, recipient_id: @user.id)
#         click_link 'メッセージを確認する',href: conversations_path(sender_id: @login_user.id, recipient_id: @user.id)
#         expect(page).to have_content("#{@user.nick_name}さんとのメッセージ画面")
#       end
#       it '他の会員ページに移動してメッセージを送信するボタンを押すと送信される' do 
#         click_link 'メッセージを確認する',href: conversations_path(sender_id: @login_user.id, recipient_id: @user.id)
#         fill_in 'message[body]',with: 'よろしくお願いします。'
#         click_on 'メッセージを送る'
#         expect(page).to have_content('よろしくお願いします。')
#       end
#       it '他の会員のページで戻るボタンを押すとコミュニティ画面に戻ることができる' do 
#         click_link 'メッセージを確認する',href: conversations_path(sender_id: @login_user.id, recipient_id: @user.id)
#         click_on '戻る'
#         expect(page).to have_content("#{@login_user.nick_name}さんのコミュニティ")
#       end
#     end
#   end
# end