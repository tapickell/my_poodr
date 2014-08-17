require_relative "test_helper"
require_relative "chapt3rev"

describe "Calculator Interface" do
  let(:subjects)     { [gear_ratio, radius_ratio, gain_ratio, gear_inches] }
  let(:gear_ratio)   { Ratio.new(primary: 40, secondary: 11) }
  let(:radius_ratio) { Ratio.new(primary: 40, secondary: 11) }
  let(:gain_ratio)   { GainRatio.new(gear_ratio: 3.6, radius_ratio: 2.0) }
  let(:gear_inches)  { GearInches.new(gear_ratio: 3.6, diameter: 27.4) }

  describe "implements the calculator interface" do
    it { subjects.each { |subject| subject.must_respond_to :calculate } }
  end
end

describe Ratio do
  subject { Ratio.new(primary: 40, secondary: 11) }

  describe "it can give you the correct ratio" do
    it { subject.calculate.must_be_close_to 3.6, 0.1 }
  end
end

describe GainRatio do
  subject { GainRatio.new(gear_ratio: 3.6, radius_ratio: 2.0) }

  describe "can give the correct gain ratio" do
    it { subject.calculate.must_be_close_to 7.3, 0.1 }
  end
end

describe Wheel do
  subject { Wheel.new(rim: 26, tire: 0.7) }

  describe "can return the correct diameter" do
    it { subject.diameter.must_equal 27.4 }
  end

  describe "can return the correct radius" do
    it { subject.radius.must_equal 13.7 }
  end

  describe "can return the correct circumference" do
    it { subject.circumference.must_be_close_to 86.1, 0.1 }
  end
end

