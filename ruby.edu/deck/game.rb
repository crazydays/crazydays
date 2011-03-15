require 'poker'

poker = Poker.new
poker.shuffle
poker.deal
poker.discard
poker.redeal
poker.print
winner = poker.winner
puts winner.to_s
