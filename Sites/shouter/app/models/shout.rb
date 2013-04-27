class Shout < ActiveRecord::Base
  attr_accessible :content, :user_id

  belongs_to :user

  validates :content, :presence => true, :length => { :maximum => 144, :too_long => "%{count} characters is the maximum allowed"}
end
