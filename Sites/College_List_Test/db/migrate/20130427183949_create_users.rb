class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.datetime :birthdate
      t.float :gpa
      t.integer :sat
      t.integer :phone
      t.boolean :allow_text
      t.boolean :allow_email

      t.timestamps
    end
  end
end
