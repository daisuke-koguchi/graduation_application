class AddFirstNameLastNameAvaterImageIntroductionToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.string :first_name,   null: false 
      t.string :last_name,    null: false 
      t.string :avatar_image, null: false 
      t.text   :introduction, null: false 
    end
  end
end
