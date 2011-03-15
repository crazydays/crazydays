require 'deck.rb'
require 'card.rb'
require 'hand.rb'

class Poker
	attr_accessor :players, :deck, :hands

	def initialize(players = 5)
		@players = players
	end

	def shuffle
		@deck = Deck.new
		@deck.shuffle!
	end

	def deal
		shuffle
		@hands = Array.new
		(1..@players).each { |i| @hands[i] = Hand.new }
		(1..5).each do
			(1..players).each do |i|
				@hands[i].insert(@deck.deal)
			end
		end
	end

	def discard
		(1..@players).each do |i|
			puts @hands[i].to_s
			puts 'Discard?'
			discard = gets.chomp.split(/, */).sort.reverse
			discard.each do |x|
				@hands[i].discard(x.to_i)
			end
		end
	end

	def redeal
		(1..@players).each do |i|
			until @hands[i].cards.size == 5
				@hands[i].insert(@deck.deal)
			end
		end
	end

	def print
		(1..@players).each { |i| puts @hands[i].to_s }
	end

	def winner
		winner = hands[1]
		(1..@players).each do |i|
			winner = winner.score < hands[i].score ? hands[i] : winner
		end

		winner
	end
end
