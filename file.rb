class Dropbox
  class File

    attr_accessor :width, :height

    def initialize(dimensions)
      @width  = dimensions[:width]
      @height = dimensions[:height]
    end
  end
end
