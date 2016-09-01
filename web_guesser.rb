require 'sinatra'
require 'sinatra/reloader'

SECRET = rand(100)
color = 'white'

def check_guess(guess)
	if guess == SECRET
		message = "You got it right!"
		color = 'green'
	elsif guess < SECRET
		message = "Too low!"
		color = '#FF8F91'
		if guess < SECRET - 5
			message = "Way too low!"
			color = 'red'
		end
	elsif guess > SECRET
		message = "Too high!"
		color = '#FF8F91'
		if guess > SECRET + 5
			message = "Way too high!"
			color = 'red'
		end
	else
		message = "Please enter a number between 0 and 100"
	end

	return [message,color]
end

get '/' do
	guess = params['guess'].to_i
	mc = check_guess(guess)
	erb :index, :locals => {:secret => SECRET, :message => mc[0], :color => mc[1]}
end