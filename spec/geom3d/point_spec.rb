require_relative '../spec_helper.rb'

require 'geom3d/point'

module Geom3d
  describe Point do
    context 'when constructed with three parameters' do
      before :each do
        @x, @y, @z = rand, rand, rand
        @point = Point.new(@x, @y, @z)
      end

      [[:x, 0], [:y, 1], [:z, 2]].each do |axis, index|
        it "allows accessing the #{axis} co-ordinate via the name" do
          eval "@point.#{axis}.should == @#{axis}"
        end

        it "allows accessing the #{axis} co-ordinate via the index" do
          eval "@point[#{index}].should == @#{axis}"
        end
      end
    end
    context 'when constructed with an array' do
      before :each do
        @x, @y, @z = rand, rand, rand
        @point = Point.new([@x, @y, @z])
      end

      [[:x, 0], [:y, 1], [:z, 2]].each do |axis, index|
        it "allows accessing the #{axis} co-ordinate via the name" do
          eval "@point.#{axis}.should == @#{axis}"
        end

        it "allows accessing the #{axis} co-ordinate via the index" do
          eval "@point[#{index}].should == @#{axis}"
        end
      end
    end
  end
end
