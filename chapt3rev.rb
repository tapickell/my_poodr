class Gear
  attr_reader :chainring, :cog

  def initialize(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
  end
end

class Ratio
  attr_reader :primary, :secondary

  def initialize(args)
    @primary = args[:primary]
    @secondary = args[:secondary]
  end

  def calculate
    primary / secondary.to_f
  end
end

class GainRatio
  attr_reader :gear_ratio, :radius_ratio

  def initialize(args)
    @gear_ratio = args[:gear_ratio]
    @radius_ratio = args[:radius_ratio]
  end

  def calculate
    radius_ratio * gear_ratio
  end
end

class GearInches
  attr_reader :gear_ratio, :diameter

  def initialize(args)
    @ratio = args[:gear_ratio]
    @diameter = args[:diameter]
  end

  def calculate
    gear_ratio * diameter
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(args)
    @rim = args[:rim]
    @tire = args[:tire]
  end

  def radius
    diameter / 2
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end
