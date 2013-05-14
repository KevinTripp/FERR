class AddStudentRankToColleges < ActiveRecord::Migration
  def change
    add_column :colleges, :student_rank, :integer
  end
end
