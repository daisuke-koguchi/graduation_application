FactoryBot.define do
  factory :schedule ,class: Schedule do
    is_done {true} 
    fixed_day {"2020-02-02"}
  end

  factory :second_schedule ,class: Schedule do
    is_done {true}
    fixed_day {nil}
  end
end