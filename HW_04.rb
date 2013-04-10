###############################################################################
#
# Introduction to Ruby on Rails
#
# Lab 04
#
# Purpose:
#
# Read the steps below and complete the exercises in this file. This Lab
# will help you to review the basics of Object-Oriented Programming that
# we learned in Lesson 04.
#
###############################################################################
#
# 1. Review your solution to Lab 03. Copy and Paste your solution to
#    this file.
#
# 2. Create a new method called `increment_guess_count` that takes
#    an integer parameter and increments it by 1.
#
# 3. Create a new method called `guesses_left` that calculates how many guesses 
#	 out of 3 the Player has left. The method should take one parameter that is the 
#	 number of guesses the player has guessed so far. Use this new method in your 
#	 code to tell the user how many guesses they have remaining. 
#
# 4. Make sure to remove your local variable `guesses_left` and use the
#    new method instead.
#
# 5. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
# Student's Solution
#
###############################################################################

def increment_guess_count (guess_count)
	return guess_count += 1
end

def guesses_left (num_tries, num_guesses)
	return num_guesses - num_tries
end

def is_secret_num (guess, secret_number)
	# checks to see if the users guess is equal to the secret number
	if guess == secret_number
		return true
	else
		false
	end
end

def get_num_suffex(num_tries)
	num_suffix = ["st", "nd", "rd", "th"]
	# creates a list of number suffixes to be used when printing messages to the user

	if (num_tries % 10) < 4
		return num_suffix[(num_tries % 10)-1]
	else
		return num_suffix[3]
	end
end

def messaging(message, messages, num_tries, num_guesses)
	#this figures out what message to send to the user after they guess.
	if num_tries == 1
		try = "tries"
	else
		try = "try"
	end

	guess_count = guesses_left(num_tries, num_guesses)

	if message == :win || message == :lose
		puts "#{messages[message]} #{messages[:answer]}"
	else
		puts "#{messages[message]} You have #{guess_count} #{try} left."
	end
end
 
# initializes core variables
secret_number = rand(1..10) # sets the secret number randomly
num_guesses = 3 # sets the max numner of guesses a user gets
num_tries = 1 # this is the count of how many times the user has guessed

messages = {
	:win => "You have won!",
	:lose => "You have lost!",
	:too_low => "Your number was too low.",
	:too_high => "Your number was too high.",
	:answer => "The secret number was #{secret_number}.",
	:error => "I don't understand what you are trying to do!  Please guess again"
}
# sets the messages that the program will be using

creator_first = "Kevin"
creator_last = "Tripp"
# Initializes who the creator is

puts "Welcome to the Secret Number Game, created by #{creator_first} #{creator_last}."
# Welcomes the user to the program

puts "Your objective is to guess the secret number that I have in my head!  You have #{num_guesses} tries to guess it."
# Initializes the objective to the user

while guesses_left(num_tries, num_guesses) >= 0 do
	# lopps through for the amount of guesses that the user has to try to guess the number

	puts "What is your #{num_tries}#{get_num_suffex(num_tries)} guess?"
	# get_num_suffx is used to add the suffix of st, nd, rd, th to the number of guesses
	user_guess = $stdin.gets.strip.to_i
	# gets the users guess
	puts "You have #{guesses_left(num_tries, num_guesses)} tries left."

	if guesses_left(num_tries, num_guesses) <= 0 && !is_secret_num(user_guess, secret_number)
		# checks to see if the user has run out of guesses and they haven't guess the number this round.  If the user runs out of guesses it breaks out of the loop
		messaging(:lose, messages, num_tries, num_guesses)
		break

	elsif is_secret_num(user_guess, secret_number)
		# checks to see if the user guessed the secret number, if they won it breaks the loop.
		messaging(:win, messages, num_tries, num_guesses)
		break

	elsif user_guess > secret_number
		#checks to see if the users guess is to high
		messaging(:too_high, messages, num_tries, num_guesses)

	elsif user_guess < secret_number
		#checks to see if teh users guess is to low
		messaging(:too_low, messages, num_tries, num_guesses)

	else
		#checks to see if the input is invalid
		messaging(:error, messages, num_tries, num_guesses)
	end

	num_tries = increment_guess_count(num_tries)

end


puts "Thanks for playng!"




