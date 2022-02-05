class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :image, null: false
      t.string :video, null: false
      t.string :minute, limit: 2 , null: false, default: 0
      t.string :second, limit: 2 , null: false, default: 0
      t.string :count, limit: 3 , null: false, default: 0
      t.string :set_count, limit: 3 , null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
