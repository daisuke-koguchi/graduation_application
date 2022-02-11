require 'rails_helper'
RSpec.describe 'dvevise機能', type: :system do
  describe '新規会員登録機能' do
    context '新規会員登録画面でユーザが入力した場合' do 
      it '確認画面にユーザーの登録情報が表示される' do
        visit new_user_registration_path
        fill_in 'user[first_name]', with: 'テスト'
        fill_in 'user[last_name]', with: 'ユーザー'
        attach_file 'user[avatar_image]', "#{Rails.root}/spec/fixtures/test.png"
        fill_in 'user[introduction]', with: 'テストを開始します。よろしくお願いします。'
        fill_in 'user[email]',with: 'test@example.rb'
        fill_in 'user[password]',with: 'password'
        fill_in 'user[password_confirmation]',with:'password'
        click_on 'アカウント登録'
      expect(page).to have_content('Confirm') #レイアウト変更時修正必要
      end
    end
    context '新規会員会員登録画面で登録画面を押した場合'do 

    it '登録完了画面に移動する' do
      end
    end

  end
  describe 'ログイン機能' do

  end
end