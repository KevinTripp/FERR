class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name

  has_many :shouts

  validates :email, :first_name, :last_name, :presence => true
end
