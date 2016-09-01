require 'sinatra'
require 'sinatra/reloader'

secret = rand(100)

get '/' do
	erb :index, :locals => {:secret => secret}
end