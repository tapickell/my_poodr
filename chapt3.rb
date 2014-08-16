class Gear
	attr_reader :chainring, :cog, :round_object

	def initialize(args)
		@chainring = args[:chainring]
		@cog = args[:cog]
		@round_object = args[:round_object]
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

	def initialize(args)
		@rim = args[:rim]
		@tire = args[:tire]
	end

	def diameter
		rim + (tire * 2)
	end

	def circumference
		diameter * Math::PI
	end
end

@wheel = Wheel.new(:rim => 26, :tire => 1.5)
@gear = Gear.new(:chainring => 52, :cog => 11, :round_object => @wheel)
puts @gear.gear_inches
