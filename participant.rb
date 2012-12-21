Class Participant

  attr_reader :name :hand

	def intialize(name, hand)
		@name = name
		@hand = hand
	end
end

Class Dealer < Participant

end

Class Player < Participant

end
