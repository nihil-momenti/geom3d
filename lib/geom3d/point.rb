require 'geom3d/vector'

module Geom3d
  class Point
    attr_accessor :x, :y, :z

    def initialize *args
      @x, @y, @z = args.flatten
    end

    def [] index
      [@x, @y, @z][index]
    end

    def - other
      case other
      when Point
        Vector.new(@x - other.x, @y - other.y, @z - other.z)
      when Vector
        Point.new(@x - other.dx, @y - other.dy, @z - other.dz)
      else
        throw ArgumentError
      end
    end

    def + other
      Point.new(@x + other.dx, @y + other.dy, @z + other.dz)
    end

    def == other
      (@x - other.x) < EPS && (@y - other.y) < EPS && (@z - other.z) < EPS
    end

    def to_s
      "Point3(%.3f,%.3f,%.3f)" % [@x, @y, @z]
    end
  end
end
