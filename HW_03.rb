###############################################################################
#
# Introduction to Ruby on Rails
#
# Homework 03
#
# Purpose:
#
# Read the links below and complete the exercises in this file. This Lab
# is to help you better understand Arrays, Hashes and Loops that we
# learned in Lesson 03.
#
###############################################################################
#
# 1. Review your solution to Lab 02. Copy and Paste your solution to
#    this file.
#
# 2. Create a new Array variable called `set_of_numbers`, this will be
#    a range between 1 - 10 that our Player will guess from. Each value
#    in the Array should be an integer.
#
# 3. Change the variable `secret_number` (HW_02) so that instead of a hard-coded
#    Integer, it randomly chooses one of the options from `set_of_numbers`
#    ('secret_number' is the integer our Player will try to guess).
#
#      Hint: Look up Array#sample in the Ruby documentation.
#
# 4. Create a new Hash variable called `messages`. In this Hash will be
#    four Keys Value pairs:
#
#    1. :win - A String telling the Player that they have won.
#
#    2. :lose - A String telling the Player that they have lost and what
#       the correct number was.
#
#    3. :too_low - A String telling the Player that their guess was too
#       low.
#
#    4. :too_high - A String telling the Player that their guess was too
#       high.
#
# 5. Change the behavior of your program, so instead of hard coding, use the principles of DRY(don't repeat yourself). 
#    This means using a Loop to iterate over your code either until the Player has guessed the
#    correct number, or they have tried to guess 3 times.
#
# 6. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
#Put your solution below this line.
#
###############################################################################

secret_number = rand(1..10) # sets the secret number randomly
num_guesses = 3


messages = {
	:win => "You have won!",
	:lose => "You have lost!",
	:too_low => "Your number was too low.",
	:too_high => "Your number was to high.",
	:answer => "The secret number was #{secret_number}.",
	:error => "I don't understand what you are trying to do!  Please guess again"
}
# sets the messages that the program will be using

num_suffix = ["st", "nd", "rd", "th"]
# creates a list of number suffixes to be used when printing messages to the user

creator_first = "Kevin"
creator_last = "Tripp"
# Initializes who the creator is

puts "Welcome to the Secret Number Game, created by #{creator_first} #{creator_last}."
# Welcomes the user to the program

puts "Your objective is to guess the secret number that I have in my head!  You have #{num_guesses} tries to guess it."
# Initializes the objective to the user

def is_secret_num (guess, secret_number)
	# checks to see if the users guess is equal to the secret number
	if guess == secret_number
		return true
	
	else
		false
	end
end

num_guesses.times do |count|

	puts "What is your #{count + 1}#{num_suffix[count]} guess?"
	user_guess = gets.strip.to_i
	# gets the users guess
	puts "count:#{count}\nnum_guesses: #{num_guesses}"

	if count + 1 == num_guesses && !is_secret_num(user_guess, secret_number)
		# checks to see if the user has run out of guesses and they haven't guess the number this round.  The plus one is to account for count starting at 0.
		puts "#{messages[:lose]}#{messages[:answer]}"
		break

	elsif is_secret_num(user_guess, secret_number)
		# checks to see if the user guessed the secret number
		puts "#{messages[:win]} #{messages[:answer]}"
		break

	elsif user_guess > secret_number
		#checks to see if the users guess is to high
		puts "#{messages[:too_high]}"

	elsif user_guess < secret_number
		#checks to see if teh users guess is to low
		puts "#{messages[:too_low]}"

	else
		#checks to see if the input is invalid
		puts "#{messages[:error]}"
	end
end

puts "Thanks for playng!"



