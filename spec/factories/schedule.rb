FactoryBot.define do
  factory :schedule ,class: Schedule do
    is_done {true} 
    fixed_day {"2020-02-02"}
  end

  factory :second_schedule ,class: Schedule do
    is_done {true}
    fixed_day {"2020-02-02"}
    association :exercise
  end

  factory :third_shcedule ,class: Schedule do
    is_done {true}
    fixed_day { Date.today}
  end

  factory :fifth_shcedule ,class: Schedule do
    is_done {true}
    fixed_day { Date.today - 1 }
  end
end