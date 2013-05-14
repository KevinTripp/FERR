class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.datetime :due_date
      t.integer :step_type_id
      t.boolean :complete
      t.integer :college_id

      t.timestamps
    end
  end
end
