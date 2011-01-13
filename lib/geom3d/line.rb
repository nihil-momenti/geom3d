require 'geom3d/point'

module Geom3d
  class Line
    attr_reader :p1, :p2

    def initialize p1, p2
      @p1 = Point.new(p1)
      @p2 = Point.new(p2)
    end

    def pos t
      @p1 + t * (@p2 - @p1)
    end

    def to_s
      "Line(#{@p1.to_s}, #{@p2.to_s})"
    end

    def to_hash
      { :p1 => @p1.to_hash, :p2 => @ps.to_hash }
    end

    def self.from_hash hash
      p1 = Point.from_hash(hash[:p1])
      p2 = Point.from_hash(hash[:p2])
      Line.new(p1, p2)
    end
  end
end
