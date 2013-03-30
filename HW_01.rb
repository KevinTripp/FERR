###############################################################################
#
# Introduction to Ruby on Rails
#
# HW 01
#
# Purpose:
#
# Read the taks below and complete the exercises in this file. We will start
# to write the beginnings of our "Secret Number Game" using what we've
# learned in Ruby Lesson 01.
#
###############################################################################
#
# 1. Read an Interview with the Creator of Ruby
# 	 http://linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
#
# 2. Read this Introduction to Programming
# 	 http://en.wikiversity.org/wiki/Introduction_to_Programming/About_Programming
#
# 3. In this file under "Student Solution," print the welcome text of your Secret 
#    Number Game
#
#	(i.e.) "Welcome to the Secret Number Game!"
#
# 4. Above your welcome message, write a comment to other coders introducing yourself.
#	 .
#
#
# 5. Create two new variables, one for your last name, one for your first name
#    and enter your first and last name as strings.
#
#    first_name = ""
#    last_name = ""
#
# 6. Print to the screen that your game was created by you by concating the
#    first and last name variables.
#
#    (i.e.) "Created by " + first_name + " " + last_name
#
# 7. Feel free to add more lines of text or add comments to remind you of what
#    you've learned.
#
###############################################################################
#
# Student Solution
#
###############################################################################

#Developer: Kevin Tripp
print "Weclome to my Secret Number Game!"

first_name = "Kevin"
last_name = "Tripp"

print "This awesome game was created by " + first_name + " " + last_name + ".\n"

puts "Who are you?\n"
userName = gets
userName = userName.chomp

print "Do you want to play a game, " + userName + "?\n"
puts "Yes or no?\n"
playGame = gets.chomp

def isCorrect(compterNum, userNum)
	if(compterNum == userNum)
		return true
	else
		return false
	end
end

if playGame.downcase == "yes"
	puts "Can you guess my number?\n"
	userChoice = 0
	secretNumber = rand(10..99)
	print secretNumber
	print userChoice

	while !isCorrect(secretNumber, userChoice)
		print "start while \n"
		userChoice = gets.to_i
		print secretNumber
		print userChoice

		if isCorrect(secretNumber, userChoice)
					print secretNumber
					print userChoice
					print "if statement\n"
					print "You guessed my number! It was #{secretNumber} Well done!\n"

		else
			print "else statement\n"
			print secretNumber
			print userChoice
			puts "Try again!\n"
		end
	end
else
	print "I'm sorry to see you go!  I hope you come back soon.\n"
end

