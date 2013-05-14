class Step < ActiveRecord::Base
  attr_accessible :complete, :due_date, :name, :step_type_id

  belongs_to :colleges

  validates :due_date, :name, :presence => true
end
