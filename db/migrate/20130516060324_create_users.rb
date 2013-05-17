class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirm
      t.string :image_url
      t.string :role, default: "user"
      t.boolean :subscribe, default: false
      t.boolean :anonymous, default: true

      t.timestamps
    end
  end
end
