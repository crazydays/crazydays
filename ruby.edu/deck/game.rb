require 'ui_cmdln.rb'
require 'poker'

ui = CommandLineUI.new
poker = Poker.new(ui)
poker.shuffle
poker.deal
poker.discard
poker.redeal
poker.print
poker.winner
