
class Sprocket
	attr_reader :chainring, :cog

	def initialize(chainring, cog)
		@chainring = chainring
		@cog = cog
	end

	def ratio
		chainring / cog.to_f
  end

end
# changed gear to sprocket to better represent the domain
#  this may be a bit early but was buggin me
class Gear 
	attr_reader :ratio, :diameter

	def initialize(ratio, diameter)
		@ratio = ratio
		@diameter = diameter
	end

	def gear_inches
		ratio * diameter
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
@sprocket = Sprocket.new(52, 11)
puts Gear.new(@sprocket.ratio, @wheel.diameter).gear_inches
