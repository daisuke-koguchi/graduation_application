class AddColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nick_name, :string, null: false
  end
end
