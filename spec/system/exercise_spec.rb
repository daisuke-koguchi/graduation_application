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
    context '運動一覧画面で戻るボタンを押すと' do
      it 'マイページに戻る' do
        click_on '戻る'
        expect(page).to have_content("#{@login_user.nick_name}さんのマイページ")
      end
    end
    context '運動一覧画面で運動方法を登録するボタンを押すと'do 
      it '運動方法の登録画面に遷移する' do 
        click_on '運動方法を登録する'
        expect(page).to have_content("運動方法の登録")
      end
    end
  end
  describe '運動登録機能' do
    let!(:login_user){build(:user)}
    before do
      @user = create(:login_user)
      visit new_user_session_path
      fill_in 'user[email]',with: @user.email
      fill_in 'user[password]', with: @user.password
      find('input[type="submit"]').click
      click_on '運動する・記録する'
      click_on '運動方法を登録する'
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
      click_on '登録する'
    end
    context '運動方法登録画面で方法を登録すると' do 
      it '運動が登録され、運動方法が登録されましたとメッセージが表示される' do
        expect(page).to have_content("運動方法を登録しました")
      end
    end
    context '検索した運動の文字を入力して、検索するボタンを押すと' do
      it '入力した文字が表示される' do
        fill_in 'q[name_cont]',with: "スクワット" 
        click_on '検索する'
        expect(page).to have_content("スクワット")
        end
      it '入力した文字以外を入れると文字が表記されない'do
        fill_in 'q[name_cont]',with: "腹筋" 
        click_on '検索する'
        expect(page).to_not have_content("腹筋")        
      end
    end
    context '運動項目のソートボタンを押す' do
      it '1回押すと運動を昇順で並び替え、もう一度押すともう一度押すと降順で並び替える' do
        click_on '運動方法を登録する'
        fill_in 'exercise[name]',with: "腹筋"
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
        click_on '登録する'

        expect(page).to have_link '運動の名前'
        click_link '運動の名前'
        sleep 0.5
        exercise_name = all("#exercise_name")
        expect(exercise_name[0]).to have_content "スクワット"
        expect(exercise_name[1]).to have_content "腹筋"
        sleep 0.5
        expect(page).to have_link '運動の名前'
        click_link '運動の名前'
        sleep 0.5
        exercise_name = all("#exercise_name")
        expect(exercise_name[0]).to have_content "腹筋"
        expect(exercise_name[1]).to have_content "スクワット"
      end
    end
    context '運動方法を確認するボタンを押すと' do
      it '運動方法確認画面に遷移する' do
        exercise = Exercise.find_by(name:"スクワット")
        expect(page).to have_link '運動方法を確認する', href: exercise_path(exercise)
        click_link '運動方法を確認する',href: exercise_path(exercise)
        expect(page).to have_content '運動の方法確認画面'
      end
    end
    context '運動一覧画面で編集するボタンを押すと' do 
      it '運動方法編集画面に遷移し、値を編集すると' do
        exercise = Exercise.find_by(name:"スクワット")
        expect(page).to have_link '編集する', href: edit_exercise_path(exercise)
        click_link '編集する',href: edit_exercise_path(exercise)
        expect(page).to have_content '運動方法の編集'
      end
    end
    context '運動方法の編集画面で運動の方法を変更すると' do
      it '運動方法が変更される。運動方法が更新しましたとメッセージが表示される' do
        exercise = Exercise.find_by(name:"スクワット")
        expect(page).to have_link '編集する', href: edit_exercise_path(exercise)
        click_link '編集する',href: edit_exercise_path(exercise)
        fill_in 'exercise[name]',with: "腹筋"
        fill_in 'exercise[description]',with: "頑張ってお腹に力を入れます"
        fill_in 'exercise[count]',with: 0
        fill_in 'exercise[set_count]',with: 1
        fill_in 'exercise[minute]',with: 0
        fill_in 'exercise[second]',with: 0
        fill_in 'exercise[schedules_attributes][1][fixed_day]',with: "002020/02/03"
        click_on '登録する'
        expect(page).to have_content '運動方法を更新しました'
      end
    end
    context '運動一覧画面で削除するボタンを押すと' do
        it '運動が削除される' do
          exercise = Exercise.find_by(name:"スクワット")
          expect(page).to have_link '削除する', href: exercise_path(exercise)
          click_link '削除する',href: exercise_path(exercise)
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content '運動方法を削除しました'
        end
      end
    context '他人の運動方法確認画面に移動としようとすると' do
      it '運動一覧画面に遷移する' do
        click_on '登録する'
        another_user_exercise = FactoryBot.create(:exercise)
        visit exercise_path(another_user_exercise)
        expect(page).to have_content 'アクセスできません'
      end
    end
  end
end
