require 'minitest/autorun'
require 'minitest/spec'

def pack(files)
  width = files.inject(0) do |total_width, file|
    total_width + file[:width]
  end

  height = files.inject(0) do |max_height, file|
    max_height > file[:height] ? max_height : file[:height]
  end

  width * height
end

describe 'pack' do
  it 'calculates the area of a single file' do
    files = [{ :height => 3, :width => 3 }]

    pack(files).must_equal 9
  end

  it 'calculates the area of two equal square files' do
    files = [{ :height => 3, :width => 3 },
             { :height => 3, :width => 3 }]

    pack(files).must_equal 18
  end

  it 'calculates the area of two unequal square files' do
    files = [{ :height => 3, :width => 3 },
             { :height => 4, :width => 4 }]

    pack(files).must_equal 28
  end
end
