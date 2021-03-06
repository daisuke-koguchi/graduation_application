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
    context 'ログインすると' do 
      it '自分のニックネームが表示されるマイページへ移動する' do 
        expect(page).to have_content("マイケルさんのマイページ")
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
        click_on 'プロフィールを編集する'
        fill_in 'user[first_name]', with: "テスト4"
        fill_in 'user[last_name]', with: "テスト４"
        click_on "更新"
        expect(page).to have_content("アカウント情報を変更しました。")
      end
    end 
    context 'プロフィールページから退会するをクリックすると'do 
      it '退会され、トップページにリダイレクトされる' do 
        click_on '退会する'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content("アカウントを削除しました。またのご利用をお待ちしております。")
      end
    end
  end
end