class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.integer :zip
      t.string :city
      t.string :state
      t.datetime :duedate
      t.integer :num_steps
      t.boolean :complete
      t.boolean :accepted
      t.integer :user_id
      t.integer :student_rank

      t.timestamps
    end
  end
end
