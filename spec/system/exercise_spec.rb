require 'rails_helper'
RSpec.describe 'エクササイズ機能', type: :system do
  describe '運動内容登録機能' do
    context '運動一覧画面で運動内容を登録するボタンを押すと'do 
      it '運動内容の登録画面に遷移する' do 

      end
    end
    context '運動一覧画面で戻るボタンを押すと' do
      it 'マイページに戻る' do

      end
    end
    context '運動内容登録画面で内容を登録すると' do 
      it '運動が登録され、運動内容が登録されましたとメッセージが表示される' do

      end
    end
    context '運動内容/動画を確認するボタンを押すと' do
      it '運動内容確認画面に遷移する' do

      end
    end
    context '他人の運動内容確認画面に移動としようとすると' do
      it '運動一覧画面に遷移する' do
        
      end
    end
    context '運動一覧画面で編集するボタンを押すと' do 
      it '運動内容編集画面に遷移する' do

      end
    end

    context '運動内容の編集画面で運動の内容を変更すると' do
      it '運動内容が変更される。運動内容が更新しましたとメッセージが表示される' do

      end
    end
    context '他人の運動編集画面にアクセスしようとすると' do
      it '運動一覧画面にリダイレクトされる' do

      end
    end
    context '運動一覧画面で削除するボタンを押すと' do
      it '運動が削除される' do

      end
    end

  end
  describe '運動検索機能' do
    context '検索した運動を入力して、検索するボタンを押すと' do
      it '入力した運動が表示される' do

      end
    end
    context '運動項目のソートボタンを押す' do
      it '運動を昇順で並び替える' do

      end
      it 'もう一度押すと降順で並び替える' do

      end
    end
  end
end