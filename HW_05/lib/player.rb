class Player
	attr_accessor :name
	#Initializes the name instance variable.
	def initialize(name = nil)
   		@name = name
  	end
  	def get_player_name
  		@name
  	end
end
