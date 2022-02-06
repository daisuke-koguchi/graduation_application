class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.date :scheduled_day, null:false 
      t.boolean :is_done, null:false, default: false 
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
