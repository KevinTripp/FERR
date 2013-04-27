class Step < ActiveRecord::Base
  attr_accessible :complete, :due_date, :name, :step_type_id
end
