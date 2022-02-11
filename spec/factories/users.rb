FactoryBot.define do 
  factory :user do 
    first_name {"テスト"}
    last_name {"ユーザー"}
    avater_image{Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.png'))}
    introduction{"テストを開始します。よろしくお願いします。"}
    email { |n| "test#{n}example.rb"}
    password {"password"}
    password_confirmation {"password"}
  end
end