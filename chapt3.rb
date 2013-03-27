
class Gear
	attr_reader :chainring, :cog, :round_object

	def initialize(chainring, cog, round_object=nil)
		@chainring = chainring
		@cog = cog
		@round_object = round_object
	end

	def ratio
		chainring / cog.to_f
	end

	def gear_inches
		ratio * diameter
	end

	def diameter
		round_object.diameter
	end
	
end

class Wheel
	attr_reader :rim, :tire

	def initialize(rim, tire)
		@rim = rim
		@tire = tire
	end

	def diameter
		rim + (tire * 2)
	end

	def circumference
		diameter * Math::PI
	end
end

@wheel = Wheel.new(26, 1.5)
puts @wheel.circumference
puts Gear.new(52, 11, @wheel).gear_inches
puts Gear.new(30, 27).ratio
puts Gear.new(30, 27).gear_inches
