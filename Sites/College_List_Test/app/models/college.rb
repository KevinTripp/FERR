class College < ActiveRecord::Base
  attr_accessible :accepted, :address1, :address2, :city, :complete, :duedate, :name, :state, :num_steps, :zip, :steps, :user_id, :student_rank

  belongs_to :users
  has_many :steps

  validates :address1, :city, :duedate, :name, :state, :zip, :student_rank, :presence => true

end
