require 'sinatra'
require 'sinatra/reloader'

SECRET = rand(100)
def check_guess(guess)
	if guess == SECRET
		message = "You got it right!"
	elsif guess < SECRET
		message = "Too low!"
		if guess < SECRET - 5
			message = "Way too low!"
		end
	elsif guess > SECRET
		message = "Too high!"
		if guess > SECRET + 5
			message = "Way too high!"
		end
	else
		message = "Please enter a number between 0 and 100"
	end

	message
end

get '/' do
	guess = params['guess'].to_i
	message = check_guess(guess)
	erb :index, :locals => {:secret => SECRET, :message => message}
end