require 'minitest/autorun'
require 'minitest/spec'

class Dropbox < Struct.new(:files)

  def area
    width * height
  end

private

  def width
    files.inject(0) do |width, file|
      width + file[:width]
    end
  end

  def height
    files.inject(0) do |height, file|
      height > file[:height] ? height : file[:height]
    end
  end

end


describe Dropbox do
  it 'calculates the area of a single file' do
    files = [{ :height => 3, :width => 3 }]

    Dropbox.new(files).area.must_equal 9
  end

  it 'calculates the area of two equal square files' do
    files = [{ :height => 3, :width => 3 },
             { :height => 3, :width => 3 }]

    Dropbox.new(files).area.must_equal 18
  end

  it 'calculates the area of two unequal square files' do
    files = [{ :height => 3, :width => 3 },
             { :height => 4, :width => 4 }]

    Dropbox.new(files).area.must_equal 28
  end
end
