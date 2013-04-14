require_relative "player"
require_relative "secret_number"

class Game
#	Make sure that all the instance variables in this class may only be READ and not WRITTEN to. 
  attr_reader :guesses_allowed, :current_guess_count, :current_guess

  @@messages = { :win => "You won!",
                 :lose =>  "You lost! :-(",
                 :too_low => "Your guess was too low!",
                 :too_high => "Your guess was too high!",
 }


	# Initializes The number of guesses (or tries) a player is allowed before the game ends.
	# You should default number of guesses to 3 if the parameter is null.
	# Sets a guess counter to zero.
	# Creates a new instance of the Player class. 
	# Creates a new instance of the SecretNumber class and assigns it to the secret_number. Don't forget to pass along the
	# necessary parameters.
  # initializes the current guess to nil
  def initialize(guesses_allowed = 3, set_of_numbers)
      @guesses_allowed = guesses_allowed

      @current_guess_count = 0
      @current_guess = nil
      
      @secret_numb = SecretNumber.new(set_of_numbers)
      @player = Player.new()
  end
  

  # Print who made this wonderful program :-)
  def print_created_by
    return "This game was created by Kevin Tripp."
  end
  

	# Calls `print_created_by` so that your players knows you created the game.
	# Asks the player to enter his/her name. Save it to @player.name.
	# Print out the number of guesses the players gets and the range of numbers they can choose from.
	# Asks the player for his/her guess. Use the `guess_correct?` method to verify the guess.
	# Continue to ask the user to guess the number so long as they have not maximized the number of guesses allowed 
	# and they did not guess correctly. 
  # Each time tell the player how many guesses left they have.
	# If at the end of the loop they still did not guess correctly, tell the player that they have lost using the
	# `@@messages` class variable and tell them the secret number.
  def start_game
    puts print_created_by

    puts "What is your name?"
    @player.name = $stdin.gets.chomp
    puts "secret_numb: #{@secret_numb.secret_number}"
    puts "Welcome to my game, #{@player.name}."
    puts "You have #{guesses_allowed} tries to guess a number between 1 and #{@secret_numb.set_of_numbers.length}."


    puts "What is your #{current_guess_count + 1}st guess?"
    @current_guess = $stdin.gets.strip.to_i
    increment_guess_count


    while @current_guess_count <= @guesses_allowed && guess_correct?(@current_guess) do
      increment_guess_count
      puts "What is your #{current_guess_count}#{get_num_suffex(@current_guess_count)} guess?"
      @current_guess = $stdin.gets.strip.to_i
    end
  end
	# This method checks if the player guessed the correct secret number. 
  # It should print out if they guessed correctly or guessed too high or too low.
	# Use the `@@messages` Hash to display this feedback.
	# Also let the player know how many guesses they have left.
	# If the guess is correct, make sure to return true, otherwise return false.
  def guess_correct?(guess)
    if guesses_left <= 0 && !(guess == @secret_numb.secret_number)
        messaging(:lose, @current_guess_count)
        false
    elsif guess == @secret_numb.secret_number
        messaging(:win, @current_guess_count)
        false
    elsif guess > @secret_numb.secret_number
        messaging(:too_high, @current_guess_count)
        true
    elsif guess < @secret_numb.secret_number
        messaging(:too_low, @current_guess_count)
        true
    else
        messaging(:error, @current_guess_count)  
      false
    end
  end


  # This method should increment every time the player guesses incorrectly.
  def increment_guess_count
    @current_guess_count += 1
  end
  

  # Calculates the guesses the player has left.
  def guesses_left
    @guesses_allowed - @current_guess_count
  end

  def messaging(message, current_guess_count)
  #this figures out what message to send to the user after they guess.

    if guesses_left < 2
      try = "try"
    else
      try = "tries"
    end 

    if message == :win || message == :lose
      puts "#{@@messages[message]} The secret number was #{@secret_numb.secret_number}"
    else
      puts "#{@@messages[message]} You have #{guesses_left} #{try} left."
    end
  end
end

def get_num_suffex(current_guess_count)
  num_suffix = ["st", "nd", "rd", "th"]
  # creates a list of number suffixes to be used when printing messages to the user

  if (current_guess_count % 10) < 4
    return num_suffix[(current_guess_count % 10)-1]
  else
    return num_suffix[3]
  end
end