class User < ActiveRecord::Base
  attr_accessible :allow_email, :allow_text, :birthdate, :email, :first_name, :gpa, :last_name, :password, :phone, :sat
end
