class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :website
      t.string :twitter
      t.string :facebook
      t.string :github
      t.string :linkedin
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
