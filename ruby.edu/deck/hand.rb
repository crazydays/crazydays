require 'card.rb'
require 'card_count.rb'
require 'pair.rb'
require 'two_pair.rb'
require 'three_kind.rb'
require 'straight.rb'

class Hand
	include Pair, TwoPair, ThreeKind, Straight

	attr_accessor :cards, :size

	def initialize(size = 5)
		@size = size
		@cards = Array.new
	end

	def insert(card)
		raise CardCountError, "Too many cards" unless @cards.size < @size
		@cards.push(card)
		@cards = @cards.sort_by { |a| [a.value, a.suit.to_s] }
	end

	def discard(index)
		raise CardCountError, "Not enough cards" unless index < @cards.size
		@cards[index] = nil
		@cards.compact!
	end

	def to_s
		value = ''
		@cards.length.times do |i|
			if i > 0 then
				value << ', '
			end
			value << @cards[i].to_s
		end

		value
	end

	def score
		if card = straight_flush?
			score_card(card) + 800
		elsif card = four_of_kind?
			score_card(card) + 700
		elsif card = full_house?
			score_card(card) + 600
		elsif card = flush?
			score_card(card) + 500
		elsif card = straight?
			score_card(card) + 400
		elsif card = three_of_kind?
			score_card(card) + 300
		elsif card = two_pair?
			score_card(card) + 200
		elsif card = pair?
			score_card(card) + 100
		else
			score_card(high_card?)
		end
	end

	def score_card(card)
		card.value == 1 ? 14 : card.value
	end

	# Check hand as straight flush, return high card
	def straight_flush?
		if straight? && flush?
			high_card?
		end
	end

	# Check hand as four of kind, return card value
	def four_of_kind?
		raise CardCountError, "Not enough cards" unless @cards.size == @size
		if @cards[0].value == @cards[3].value
			@cards[3]
		elsif @cards[1].value == @cards[4].value
			@cards[4]
		end
	end

	def full_house?
		raise CardCountError, "Not enough cards" unless @cards.size == @size

		if @cards[0].value == @cards[2].value &&
		   @cards[3].value == @cards[4].value
			@cards[2]
		elsif @cards[0].value == @cards[1].value &&
		      @cards[2].value == @cards[4].value
			@cards[4]
		end
	end

	def flush?
		raise CardCountError, "Not enough cards" unless @cards.size == @size

		if @cards[0].suit == @cards[1].suit &&
		   @cards[2].suit == @cards[3].suit &&
		   @cards[1].suit == @cards[4].suit &&
		   @cards[3].suit == @cards[4].suit
			@cards[4]
		end
	end

	def high_card?
		if @cards[0].value == 1
			@cards[0]
		else
			@cards[4]
		end
	end
end

