class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content, not_null: true
      t.integer :crap

      t.timestamps
    end
  end
end
