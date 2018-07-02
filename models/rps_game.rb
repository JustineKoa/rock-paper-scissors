require 'sinatra'

class RPSGame
  @@valid_moves = ["ROCK", "PAPER", "SCISSORS"]

  def initialize(move)
    @move = move
    if !self.valid_play?(move)
      raise PlayTypeError
    end
  end

  def valid_play?(move)
    @@valid_moves.include? move
  end

  def computer_play
    random_int = rand(3)
    @computer_play = @@valid_moves[random_int]
    return @computer_play
  end

  def won?
    if self.tied? || (@move == "ROCK" && @computer_play == "PAPER") || (@move == "PAPER" && @computer_play == "SCISSORS") || (@move == "SCISSORS" && @computer_play == "rock")
      return false
    else
      return true
    end
  end

  def tied?
    if @move == @computer_play
      return true
    else
      return false
    end
  end

  def lost?
    return !self.won?
  end

  class PlayTypeError < StandardError
    # Don't be alarmed! This is a class set inside a class, but works just fine in Ruby
    # In this case, we're creating a custom error that should be raised if RPSGame.new receives an invalid move as an argument
  end

end