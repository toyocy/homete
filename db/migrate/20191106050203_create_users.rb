class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, not_null: true 
      t.string :display_name, default: ''
      t.text :introduction, default: ''

      t.timestamps
    end
  end
end
