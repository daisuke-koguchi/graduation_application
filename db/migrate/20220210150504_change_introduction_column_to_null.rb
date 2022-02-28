class ChangeIntroductionColumnToNull < ActiveRecord::Migration[6.0]
  def up 
    change_column_null :users, :introduction, true
  end

  def down 
    change_column_null :users, :introduction, false 
  end
end
