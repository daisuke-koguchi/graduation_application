FactoryBot.define do 
  factory :user ,class: User do 
    first_name {"テスト"}
    last_name {"ユーザー"}
    avatar_image{Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.png'))}
    introduction{"テストを開始します。よろしくお願いします。"}
    email {"test@example.rb"}
    password {"password"}
    password_confirmation {"password"}
  end
  factory :login_user ,class: User do 
    first_name {"テスト"}
    last_name {"ユーザー"}
    avatar_image{Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.png'))}
    introduction{"テストを開始します。よろしくお願いします。"}
    email {"login@example.rb"}
    password {"password"}
    password_confirmation {"password"}
    confirmed_at {Date.today}
    after(:create){|user| user.confirm}
  end
end