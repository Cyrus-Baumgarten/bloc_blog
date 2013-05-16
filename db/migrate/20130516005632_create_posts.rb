class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :name
      t.string :title
      t.integer :author_id

      t.timestamps
    end
  end
end
