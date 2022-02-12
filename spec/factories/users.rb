FactoryBot.define do
  factory :model_user ,class: User do 
    first_name {"モデル"}
    last_name {"ユーザー"}
    avatar_image{Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.png'))}
    introduction{"テストを開始します。よろしくお願いします。"}
    email {"model@example.rb"}
    password {"password"}
    password_confirmation {"password"}
  end

  factory :user ,class: User do 
    first_name {"テスト1"}
    last_name {"ユーザー1"}
    avatar_image{Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.png'))}
    introduction{"テストを開始します。よろしくお願いします。"}
    email {"test@example.rb"}
    password {"password"}
    password_confirmation {"password"}
    confirmed_at {Date.today}
    after(:create){|user| user.confirm}
  end

  factory :login_user ,class: User do 
    first_name {"テスト2"}
    last_name {"ユーザー2"}
    avatar_image{Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.png'))}
    introduction{"テストを開始します。よろしくお願いします。"}
    email {"login@example.rb"}
    password {"password"}
    password_confirmation {"password"}
    confirmed_at {Date.today}
    after(:create){|user| user.confirm}
  end

  factory :login_test_user ,class: User do 
    first_name {"テスト3"}
    last_name {"ユーザー3"}
    avatar_image{Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.png'))}
    introduction{"テストを開始します。よろしくお願いします。"}
    email {"logintest@example.rb"}
    password {"password"}
    password_confirmation {"password"}
    confirmed_at {Date.today}
    after(:create){|user| user.confirm}
  end
end