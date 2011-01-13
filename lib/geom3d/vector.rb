require 'geom3d/eps'

module Geom3d
  class Vector
    attr_accessor :dx, :dy, :dz

    def initialize *args
      @dx, @dy, @dz = args.flatten
    end

    def - other
      Vector.new(@dx - other.dx, @dy - other.dy, @dz - other.dz)
    end

    def + other
      Vector.new(@dx + other.dx, @dy + other.dy, @dz + other.dz)
    end

    def * scale
      Vector.new(@dx * scale, @dy * scale, @dz * scale)
    end

    def ** power
      Vector.new(@dx ** power, @dy ** power, @dz ** power)
    end

    def / scale
      self * (1.0/scale)
    end

    def +@
      self
    end

    def -@
      Vector.new(-@dx, -@dy, -@dz)
    end

    def == other
      (@dx - other.dx).abs < EPS && (@dy - other.dy).abs < EPS && (@dz -  other.dz).abs < EPS
    end

    def dot other
      @dx * other.dx + @dy * other.dy + @dz * other.dz
    end

    def cross other
      Vector.new(@dy * other.dz - @dz * other.dy,
                 @dz * other.dx - @dx * other.dz,
                 @dx * other.dy - @dy * other.dx)
    end

    def norm
      self / self.length
    end

    alias :unit :norm

    def length
      Math.sqrt(self.dot(self))
    end

    def to_s
      "Vector(%.3f,%.3f,%.3f)" % [@dx, @dy, @dz]
    end

    # Allows flatten and multiple assignment to work with this class
    def to_ary
      [@dx, @dy, @dz]
    end

    def to_hash
      { :dx => @dx, :dy => @dy, :dz => @dz }
    end

    def self.from_hash hash
      Vector.new(hash[:dx], hash[:dy], hash[:dz])
    end

    def flatten
      to_ary.flatten
    end
  end
end


class Fixnum
  alias :times_without_geom3d :'*'

  def * other
    case other
    when Geom3d::Vector
      Geom3d::Vector.new(self * other.dx, self * other.dy, self * other.dz)
    else
      self.times_without_geom3d(other)
    end
  end
end

class Bignum
  alias :times_without_geom3d :'*'

  def * other
    case other
    when Geom3d::Vector
      Geom3d::Vector.new(self * other.dx, self * other.dy, self * other.dz)
    else
      self.times_without_geom3d(other)
    end
  end
end

class Float
  alias :times_without_geom3d :'*'

  def * other
    case other
    when Geom3d::Vector
      Geom3d::Vector.new(self * other.dx, self * other.dy, self * other.dz)
    else
      self.times_without_geom3d(other)
    end
  end
end
