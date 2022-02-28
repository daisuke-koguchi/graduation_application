FactoryBot.define do
  factory :exercise, class: Exercise do
    name {"スクワット"}
    description {"ゆっくりと膝を曲げましょう"}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.png'))}
    video {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.mp4'))}
    minute {"1"}
    second {"1"}
    count {"10"}
    set_count {"2"}
    association :user 

    after(:build) do |exercise|
      exercise.schedules << FactoryBot.build(:schedule)
    end
  end

  factory :second_exercise, class: Exercise do
    name {"腹筋" }
    description {"ゆっくりと膝を曲げましょう"}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.png'))}
    video {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.mp4'))}
    minute {"1"}
    second {"1"}
    count {"10"}
    set_count {"2"}
    association :user, factory: :login_user 

    after(:build) do |exercise|
      exercise.schedules << FactoryBot.build(:schedule)
    end
  end

  factory :third_exercise, class: Exercise do
    name {"腹筋" }
    description {"ゆっくりと膝を曲げましょう"}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.png'))}
    video {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.mp4'))}
    minute {"1"}
    second {"1"}
    count {"10"}
    set_count {"2"}
    association :user, factory: :login_user 

    after(:build) do |exercise|
      exercise.schedules << FactoryBot.build(:third_shcedule)
    end
  end

  factory :forth_exercise, class: Exercise do
    name {"腕立て伏せ" }
    description {"ゆっくりと肘を曲げましょう"}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.png'))}
    video {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.mp4'))}
    minute {"1"}
    second {"1"}
    count {"10"}
    set_count {"2"}
    association :user, factory: :login_user 

    after(:build) do |exercise|
      exercise.schedules << FactoryBot.build(:third_shcedule)
    end
  end

  factory :fifth_exercise, class: Exercise do
    name {"ウォーキング" }
    description {"ゆっくりと歩きましょう"}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.png'))}
    video {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/test.mp4'))}
    minute {"1"}
    second {"1"}
    count {"10"}
    set_count {"2"}
    association :user, factory: :login_user 

    after(:build) do |exercise|
      exercise.schedules << FactoryBot.build(:fifth_shcedule)
    end
  end
end