require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :request do
  describe '会員表示機能' do
  let!(:user){build(:user)}
  let(:user_params){attributes_for(:user)}
  let!(:login_user){build(:user)}
    before do 
      sign_in login_user
    end
    context 'ログインせずに、マイページへ移動しようとすると' do 
      it 'ログイン画面にリダイレクトされる' do
        sign_out login_user
        get users_mypage_path login_user
        expect(response).to redirect_to new_user_session_path
      end
    end
    context 'ログインせずに、ユーザーの一覧画面へ移動しようとすると' do
        it 'ログイン画面にリダイレクトされる' do
        sign_out login_user
        get users_path 
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end