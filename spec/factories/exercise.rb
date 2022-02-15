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
    name {"スクワット" }
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
end