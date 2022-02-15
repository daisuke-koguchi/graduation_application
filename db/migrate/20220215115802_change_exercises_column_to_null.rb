class ChangeExercisesColumnToNull < ActiveRecord::Migration[6.0]
  def up
    change_column :exercises, :description, :text, null: true 
    change_column :exercises, :image, :string,  null: true 
    change_column :exercises, :video, :string, null: true 
  end

  def down
    change_column :exercises, :description, :text, null: false 
    change_column :exercises, :image, :string, null: false
    change_column :exercises, :video, :string, null: false 
  end
end
