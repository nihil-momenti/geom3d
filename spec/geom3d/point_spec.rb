require_relative '../spec_helper.rb'

require 'geom3d/point'

module Geom3d
  describe Point do
    context 'when constructed with three parameters' do
      before :each do
        @x, @y, @z = rand, rand, rand
        @point = Point.new(@x, @y, @z)
      end

      [:x, :y, :z].each do |axis|
        it "allows accessing the #{axis} co-ordinate via the name" do
          eval "@point.#{axis}.should == @#{axis}"
        end
      end
    end

    context 'when constructed with an array' do
      before :each do
        @x, @y, @z = rand, rand, rand
        @point = Point.new([@x, @y, @z])
      end

      [:x, :y, :z].each do |axis|
        it "allows accessing the #{axis} co-ordinate via the name" do
          eval "@point.#{axis}.should == @#{axis}"
        end
      end
    end
    
    describe 'point - point' do
      before :each do
        @x1, @x2, @y1, @y2, @z1, @z2 = rand, rand, rand, rand, rand, rand
        @point1 = Point.new(@x1, @y1, @z1)
        @point2 = Point.new(@x2, @y2, @z2)
        @result = @point2 - @point1
      end

      it 'returns a difference vector' do
        @result.should == Vector.new(@x2 - @x1, @y2 - @y1, @z2 - @z1)
      end
    end

    describe 'point + vector' do
      before :each do
        @x, @y, @z, @dx, @dy, @dz = rand, rand, rand, rand, rand, rand
        @point = Point.new(@x, @y, @z)
        @vector = Vector.new(@dx, @dy, @dz)
        @result = @point + @vector
      end

      it 'returns a shifted point' do
        @result.should == Point.new(@x + @dx, @y + @dy, @z + @dz)
      end
    end
  end
end
