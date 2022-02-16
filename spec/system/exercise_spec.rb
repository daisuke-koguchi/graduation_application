require 'rails_helper'
RSpec.describe 'エクササイズ機能', type: :system do
  describe '画面遷移機能' do
    let!(:login_user){build(:user)}
    before do 
      @login_user = create(:login_user)
      visit new_user_session_path
      fill_in 'user[email]',with: @login_user.email
      fill_in 'user[password]', with: @login_user.password
      find('input[type="submit"]').click
      click_on '運動する・記録する'
    end
    # context '運動一覧画面で戻るボタンを押すと' do
    #   it 'マイページに戻る' do
    #     click_on '戻る'
    #     expect(page).to have_content("#{@login_user.nick_name}さんのマイページ")
    #   end
    # end
    # context '運動一覧画面で運動内容を登録するボタンを押すと'do 
    #   it '運動内容の登録画面に遷移する' do 
    #     click_on '運動内容を登録する'
    #     expect(page).to have_content("運動内容の登録")
    #   end
    # end
    describe '運動内容登録機能' do
      let!(:login_user){build(:user)}
    before do 
      @login_user = create(:login_user)
      visit new_user_session_path
      fill_in 'user[email]',with: @login_user.email
      fill_in 'user[password]', with: @login_user.password
      find('input[type="submit"]').click
      click_on '運動する・記録する'
      click_on '運動内容を登録する'
      fill_in 'exercise[name]',with: "スクワット"
      fill_in 'exercise[description]',with: "ゆっくり膝を曲げてください"
      fill_in 'exercise[count]',with: 10
      fill_in 'exercise[set_count]',with: 10
      fill_in 'exercise[minute]',with: 5
      fill_in 'exercise[second]',with: 5
      image_path = Rails.root.join('spec/fixtures/test.png')
      video_path = Rails.root.join('spec/fixtures/test.mp4')
      attach_file('exercise[image]', image_path, make_visible: true)
      attach_file('exercise[video]', video_path, make_visible: true)
      fill_in 'exercise[schedules_attributes][0][fixed_day]',with: "002020/02/02"
    end
    # context '運動内容登録画面で内容を登録すると' do 
    #   it '運動が登録され、運動内容が登録されましたとメッセージが表示される' do
    #     click_on '登録する'
    #     expect(page).to have_content("運動内容を登録しました")
    #   end
    # end
    context '運動方法を確認するボタンを押すと' do
      it '運動内容確認画面に遷移する' do
        click_on '登録する'
        exercise = Exercise.find_by(name:"スクワット")
        expect(page).to have_link = '運動方法を確認する', href: exercise_path(exercise)
        click_link '運動方法を確認する',href: exercise_path(exercise)
        
      end
    end
    context '他人の運動内容確認画面に移動としようとすると' do
      it '運動一覧画面に遷移する' do
        click_on '登録する'
        another_user_exercise = FactoryBot.creat(:exercise)

      end
    end
  #   context '運動一覧画面で編集するボタンを押すと' do 
  #     it '運動内容編集画面に遷移する' do

  #     end
  #   end

  #   context '運動内容の編集画面で運動の内容を変更すると' do
  #     it '運動内容が変更される。運動内容が更新しましたとメッセージが表示される' do

  #     end
  #   end
  #   context '他人の運動編集画面にアクセスしようとすると' do
  #     it '運動一覧画面にリダイレクトされる' do

  #     end
  #   end
  #   context '運動一覧画面で削除するボタンを押すと' do
  #     it '運動が削除される' do

  #     end
  #   end

  # end
  # describe '運動検索機能' do
  #   context '検索した運動を入力して、検索するボタンを押すと' do
  #     it '入力した運動が表示される' do

  #     end
  #   end
  #   context '運動項目のソートボタンを押す' do
  #     it '運動を昇順で並び替える' do

  #     end
  #     it 'もう一度押すと降順で並び替える' do

  #     end
  #   end
  end
end