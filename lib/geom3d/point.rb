module Geom3d
  class Point
    def initialize(*args)
      @coords = args.flatten.dup
    end

    def x; @coords[0]; end

    def y; @coords[1]; end

    def z; @coords[2]; end

    def [] index; @coords[index]; end
  end
end
