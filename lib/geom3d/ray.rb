require 'geom3d/point'
require 'geom3d/vector'

module Geom3d
  class Ray
    attr_reader :start, :dir

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
