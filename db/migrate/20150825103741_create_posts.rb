class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :email
      t.decimal :price
      t.string :key
      t.integer :category_id, null: false
      t.timestamp null: false
    end
  end
end
