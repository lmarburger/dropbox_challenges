require 'minitest/autorun'
require 'minitest/spec'

def pack(files)
  files.inject(0) do |area, file|
    area += file[:height] * file[:width]
  end
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
end
