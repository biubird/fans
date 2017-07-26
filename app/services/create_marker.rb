class CreateMarker
	attr_reader :fans

	def initialize fans
		@fans = fans
	end

	def process
		append_markers
	end

	private

	def append_markers
		markers = []
		@fans.each do |fan|
			city = fan.city
			state = fan.state
			country = fan.country
			markers.push("%7C#{city}#{state}#{country}")
		end
		markers
	end
end
