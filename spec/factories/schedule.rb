FactoryBot.define do
  factory :schedule ,class: Schedule do
    is_done {false} 
    fixed_day {Date.today}
  end

  factory :second_schedule ,class: Schedule do
    is_done {true}
    fixed_day {Date.today}
    association :exercise
  end

  factory :third_shcedule ,class: Schedule do
    is_done {false}
    fixed_day { Date.today}
  end

  factory :fifth_shcedule ,class: Schedule do
    is_done {true}
    fixed_day { Date.today - 1 }
  end
end