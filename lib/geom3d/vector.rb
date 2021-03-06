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

    def flatten
      to_ary.flatten
    end

    def coerce num
      case num
      when Numeric
        return Scalar.new(num), self
      else
        raise TypeError, "#{self.class} can't be coerced into #{num.class}"
      end
    end

    class Scalar
      def initialize num
        @num = num
      end

      def * other
        other * @num
      end
    end
  end
end
