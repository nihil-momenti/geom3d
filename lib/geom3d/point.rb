module Geom3d
  class Point
    attr_accessor :x, :y, :z
    def initialize(*args)
      @x, @y, @z = args.flatten
    end

    def [] index
      [@x, @y, @z][index]
    end
  end
end
