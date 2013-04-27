class College < ActiveRecord::Base
  attr_accessible :accepted, :address1, :address2, :city, :complete, :duedate, :name, :state, :steps, :zip
end
