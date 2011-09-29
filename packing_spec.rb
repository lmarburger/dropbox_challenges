require 'minitest/autorun'
require 'minitest/spec'

def pack(files)
  9
end

describe 'pack' do
  it 'calculates the area of a single file' do
    files = [{ :height => 3, :width => 3 }]

    pack(files).must_equal 9
  end
end
