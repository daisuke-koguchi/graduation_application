require 'rails_helper'
RSpec.describe 'dvevise機能', type: :system do
  describe '新規会員登録機能' do
    let!(:user){FactoryBot.build(:user)}
    before do 
      visit new_user_registration_path
        fill_in 'user[first_name]', with: user.first_name
        fill_in 'user[last_name]', with: user.last_name
        attach_file 'user[avatar_image]', "#{Rails.root}/spec/fixtures/test.png"
        fill_in 'user[introduction]', with: user.introduction
        fill_in 'user[email]',with: user.email
        fill_in 'user[password]',with: user.password
        fill_in 'user[password_confirmation]',with:user.password_confirmation
    end
    context '新規会員登録画面でユーザが入力した場合' do 
      it '確認画面にユーザーの登録情報が表示される' do
        click_on 'アカウント登録'
      expect(page).to have_content('Confirm') #レイアウト変更時修正必要
      end
    end
    context '新規会員登録確認画面で登録するを押した場合'do 
    it '登録完了画面に移動する' do
      click_on 'アカウント登録'
      click_on '登録する'
      expect(page).to have_content('登録が完了しました') #レイアウト変更時修正必要
      end
    end
    context '新規会員登録確認画面で修正するを押した場合' do
      it '新規登録画面に移動する' do 
        click_on 'アカウント登録'
        click_on '修正する'
        expect(page).to have_content('ログイン') #レイアウト変更時修正必要
        expect(page).to_not have_content('登録が完了しました')
      end
    end
    context '新規会員登録確認画面で登録するを押した場合' do 
      it '本人確認用のメールアドレスが送信される。' do
        click_on 'アカウント登録'
        expect {click_on '登録する'}.to change { ActionMailer::Base.deliveries.size }.by(1)
        expect(page).to have_content('本人確認用のメールを送信しました。メール内のリンクからアカウントを有効化させてください。')
      end
    end
    context '新規会員登録実施した後、アカウント確認メール再送画面で、アカウント確認メール再送ボタンを押すと' do 
      it 'アカウント確認メールが再送される' do 
        click_on 'アカウント登録'
        click_on '登録する'
        visit new_user_confirmation_path 
        fill_in 'user[email]',with: user.email
        expect { click_on 'アカウント確認メール再送'}.to change{ ActionMailer::Base.deliveries.size }.by(1)
        expect(page).to have_content('アカウントの有効化について数分以内にメールでご連絡します。')
      end
    end
    context '新規会員登録実施せずに、アカウント確認メール再送画面で、アカウント確認メール再送ボタンを押すと' do 
      it 'アカウント確認メールが再送されない' do 
        visit new_user_confirmation_path 
        fill_in 'user[email]',with: user.email
        expect { click_on 'アカウント確認メール再送'}.to change{ ActionMailer::Base.deliveries.size }.by(0)
        expect(page).to have_content('エラーが発生したため ユーザー は保存されませんでした。')
      end
    end
    context '新規会員登録実施した後、パスワード再設定ページへ移動し、パスワードの再設定を送信するを押すと' do 
      it 'パスワードの再設定のメールが送信される' do
        click_on 'アカウント登録'
        click_on '登録する'
        visit new_user_password_path 
        fill_in 'user[email]',with: user.email 
        expect { click_on 'パスワードの再設定方法を送信する'}.to change{ ActionMailer::Base.deliveries.size }.by(1)
        expect(page).to have_content('パスワードの再設定について数分以内にメールでご連絡いたします。')
      end
    end
  end
  describe 'ログイン機能' do
    let!(:user){FactoryBot.build(:login_user)}
    before do
      user = create(:login_user)
      visit new_user_session_path
    end
    context 'ログイン画面でメールアドレスとパスワードを入力して、ログインを押した場合' do
      it 'ログインすることができる'do
        fill_in 'user[email]',with: user.email
        fill_in 'user[password]', with: user.password
        find('input[type="submit"]').click
        expect(page).to have_content('ログインしました')
      end
    end
    context 'ログイン画面で何も入力せずに、ログインを押した場合' do
      it 'ログインできず、エラーメッセージが表示される' do
        find('input[type="submit"]').click
        expect(page).to have_content('Eメールまたはパスワードが違います。')
      end
    end
    context 'ログイン画面で誤ったパスワードを入力して、ログインを押した場合' do
      it 'ログインできず、エラーメッセージが表示される' do
        fill_in 'user[password]',with: '123456'
        find('input[type="submit"]').click
        expect(page).to have_content('Eメールまたはパスワードが違います。')
      end
    end
    context 'ログイン画面で誤ったメールアドレスを入力して、ログインを押した場合'do 
      it 'ログインできず、エラーメッセージが表示される' do  
        fill_in 'user[email]',with: 'test@example.com'
        find('input[type="submit"]').click
        expect(page).to have_content('Eメールまたはパスワードが違います。')
      end
    end
    context 'ログインした状態でログアウトボタンを押すと' do
      it 'ログアウトされる' do
        fill_in 'user[email]',with: user.email
        fill_in 'user[password]', with: user.password
        find('input[type="submit"]').click
        click_on 'ログアウト'
        expect(page).to have_content('ログアウトしました')
      end
    end
  end
  describe 'ゲストログイン機能' do
    context 'ゲストログイン（閲覧用）を押すと' do
      it 'ログインでき、その後ログアウトを押すとログアウトされる' do 
        visit root_path
        click_on 'ゲストログイン（閲覧用）'
        expect(page).to have_content('ログインしました')
        click_on 'ログアウト'
        expect(page).to have_content('ログアウトしました')
      end
    end
    context 'ゲスト管理者ログイン（閲覧用）を押すと' do
      it 'ログインでき、その後ログアウトを押すとログアウトされる' do 
        visit root_path
        click_on 'ゲスト管理者ログイン(閲覧用)'
        expect(page).to have_content('ログインしました')
        click_on 'ログアウト'
        expect(page).to have_content('ログアウトしました')
      end
    end
  end
end