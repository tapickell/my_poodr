
class Sprocket
	attr_reader :chainring, :cog

	def initialize(args)
		@chainring = args[:chainring]
		@cog = args[:cog]
	end

	def ratio
		chainring / cog.to_f
  end

end
# changed gear to sprocket to better represent the domain
#  this may be a bit early but was buggin me
class Gear 
	attr_reader :ratio, :diameter

	def initialize(args)
		@ratio = args[:ratio]
		@diameter = args[:diameter]
	end

	def gear_inches
		ratio * diameter
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
@sprocket = Sprocket.new(:chainring => 52, :cog => 11)
@gear = Gear.new(:ratio => @sprocket.ratio, :diameter => @wheel.diameter)
puts @gear.gear_inches
