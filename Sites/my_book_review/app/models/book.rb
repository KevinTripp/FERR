class Book < ActiveRecord::Base
  attr_accessible :author, :title, :year

  has_many :reviews
end
