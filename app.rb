require 'sinatra'
require_relative 'config/environment'
require_relative 'models/rps_game.rb'

get '/' do
    erb :index
end

post '/play' do
    @player_move = params["move"]
    @game = RPSGame.new(@player_move)
    @computer_move = @game.computer_play
    erb :rps_game
end

post '/back' do
    redirect '/'
end
