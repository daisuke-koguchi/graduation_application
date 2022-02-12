require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  describe '会員表示機能' do
    let!(:login_user){build(:user)}
    before do
      @login_user = create(:login_user)
      visit new_user_session_path
      fill_in 'user[email]',with: @login_user.email
      fill_in 'user[password]', with: @login_user.password
      find('input[type="submit"]').click
    end
    context 'トップページから、マイページへ移動するをクリックすると' do 
      it '自分の名前が表示されるマイページへ移動する' do 
        click_on 'マイページへ移動する'
        expect(page).to have_content("テスト2ユーザー2さんのマイページ")
      end
    end
    context 'マイページから、プロフィールの編集/確認するを押すと' do
      it '自分のプロフィールが表示される' do
        click_on 'マイページへ移動する'
        click_on 'プロフィールの編集/確認する'
        expect(page).to have_content("テスト2ユーザー2さんのプロフィール")
      end
    end
    context 'マイページから、他のユーザーのページにアクセスすると' do 
      it 'マイページにリダイレクトされ、アクセス権限がありませんと表示される' do
        click_on 'マイページへ移動する'
        @user = FactoryBot.create(:user, email:"testA@example.com")
        visit users_mypage_path(id: @user.id)
        expect(page).to have_content("アクセス権限がありません")
      end
    end
  end
  describe '会員一覧表示機能' do
    let!(:login_user){build(:user)}
    before do
      @user = FactoryBot.build(:user)
      @login_test_user = FactoryBot.build(:login_test_user)
      @login_user = create(:login_user)
      visit new_user_session_path
      fill_in 'user[email]',with: @login_user.email
      fill_in 'user[password]', with: @login_user.password
      find('input[type="submit"]').click
    end
    context 'マイページから、仲間と交流するをクリックすると' do 
      it '新規登録したユーザーが表示される' do 
        click_on 'マイページへ移動する'
        click_on '仲間と交流する'
        expect(page).to_not have_content("テスト2ユーザーさんのコミュニティ")
      end
    end
    context 'マイページでユーザーの検索フォームにて姓で検索を行うと' do
      it '入力した姓に一致するユーザーが表示される' do 
        click_on 'マイページへ移動する'
        click_on '仲間と交流する'
        fill_in 'q[first_name_or_last_name_cont]', with: @user.first_name
        click_on '検索'
        sleep 0.5
        expect(page).to have_content("テスト1")
        expect(page).to_not have_content("テスト3")
      end
    end
      context 'マイページでユーザーの検索フォームにて名で検索を行うと' do
        it '入力した姓に一致するユーザーが表示される' do 
          click_on 'マイページへ移動する'
          click_on '仲間と交流する'
          fill_in 'q[first_name_or_last_name_cont]', with: @user.last_name
          click_on '検索'
          expect(page).to have_content("ユーザー1")
          expect(page).to_not have_content("ユーザー3")
        end
      end
  end
  describe '会員編集・削除機能' do 
    before do
      @login_user = create(:login_user)
      visit new_user_session_path
      fill_in 'user[email]',with: @login_user.email
      fill_in 'user[password]', with: @login_user.password
      find('input[type="submit"]').click
    end
    context 'プロフィールページからプロフィールを編集するをクリックすると'do
      it '自分の名前が表示されるマイページへ移動する' do 
        click_on 'マイページへ移動する'
        click_on 'プロフィールの編集/確認する'
        click_on 'プロフィールを編集する'
        fill_in 'user[first_name]', with: "テスト4"
        fill_in 'user[last_name]', with: "テスト４"
        click_on "更新"
        expect(page).to have_content("アカウント情報を変更しました。")
      end
    end 
    context 'プロフィールページから退会するをクリックすると'do 
      it '退会され、トップページにリダイレクトされる' do 
        sleep 0.5
        click_on 'マイページへ移動する'
        click_on 'プロフィールの編集/確認する'
        click_on '退会する'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content("アカウントを削除しました。またのご利用をお待ちしております。")
      end
    end
  end
end