class ChangeAvaterImageColumnToNull < ActiveRecord::Migration[6.0]
  def up 
    change_column_null :users, :avatar_image, true
  end

  def down 
    change_column_null :users, avatar_image, false 
  end
end
