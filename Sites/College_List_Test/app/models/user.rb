class User < ActiveRecord::Base
  attr_accessible :allow_email, :allow_text, :birthdate, :email, :first_name, :gpa, :last_name, :password, :phone, :sat

  has_many :colleges

  validates :email, :first_name, :last_name, :password, :phone, :presence => true
 
 def order_colleges_by_rank
 	colleges_ranked = []
  colleges = College.where("user_id = ?", :user_id)
  colleges.each do |college|
  	puts colleges.name
  	colleges_ranked = push(colleges.find_by_student_rank(college))
  end
    puts colleges_ranked
 end
end
