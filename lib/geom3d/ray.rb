require 'geom3d/point'
require 'geon3d/vector'

module Geom3d
  class Ray
    def initialize start, dir
      @start = Point.new(start)
      @dir = Vector.new(dir).norm
    end

    def pos t
      @start + t * @dir
    end

    def to_s
      "Ray(#{@start.to_s},#{@dir.to_s}"
    end
  end
end
