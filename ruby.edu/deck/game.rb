require 'ui/command_line'
require 'poker'

poker = Poker.new(CommandLine.new)
poker.shuffle
poker.deal
poker.discard
poker.redeal
poker.print
poker.winner
