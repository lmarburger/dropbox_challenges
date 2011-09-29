require 'minitest/autorun'
require 'minitest/spec'

require_relative 'dropbox'

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

  it 'rotates files to fit more efficiently' do
    files = [{ :height => 3, :width => 4 },
             { :height => 4, :width => 3 }]

    Dropbox.new(files).area.must_equal 24
  end
end