class CreateMarkerUrl
	attr_reader :markers

	def initialize markers
		@markers = markers
		@google_map_api = ENV['google_api_key']
	end

	def left_post_initialize
		left_map
	end

	def right_post_initialize
		right_map
	end

	def left_map
		"https://maps.googleapis.com/maps/api/staticmap?center=Mexico&zoom=2&size=800x600&markers=color:red#{format_markers}#{@google_map_api}"
	end

	def right_map
		"https://maps.googleapis.com/maps/api/staticmap?center=India&zoom=2&size=800x600&markers=color:red#{format_markers}#{@google_map_api}"
	end

	def format_markers
    marker_array = markers.join(',').gsub(/,/, ',' => '')
    marker_array.gsub(/\s+/, '')
	end
end