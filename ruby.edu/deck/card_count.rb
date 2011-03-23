class CardCountError < StandardError
end

module CardCount
	def assert_full_hand
		raise CardCountError, "Incomplete Hand" unless @cards.size == @size
	end
end
