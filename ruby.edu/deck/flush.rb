require 'suit.rb'
require 'card_count.rb'

module Flush
	include CardCount

	def flush?
		assert_full_hand

		suits = cards_by_suit()
		flush = find_flush(suits)
		find_flush_high_card(flush) unless flush == nil
	end

	def cards_by_suit
		suits = Hash.new{|h, k| h[k] = []}

		@cards.each do |card|
			suits[card.suit] << card
		end

		suits
	end

	def find_flush(suits)
		flush = nil

		suits.values.each do |cards|
			if cards.size >= 5
				flush = cards
			end
		end

		flush
	end

	def find_flush_high_card(flush)
		if flush[0].value == 1
			flush[0]
		else
			flush[flush.size - 1]
		end
	end
end
