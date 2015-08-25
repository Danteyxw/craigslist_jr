class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :email
      t.decimal :price
      t.string :key
      t.timestamp null: false
    end
  end
end
