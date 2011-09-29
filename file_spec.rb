require 'minitest/autorun'
require 'minitest/spec'

require_relative 'file'

describe Dropbox::File do
  it 'has a width' do
    Dropbox::File.new(:width => 1).width.must_equal 1
  end

  it 'has a height' do
    Dropbox::File.new(:height => 1).height.must_equal 1
  end

  it 'has a width and height' do
    file = Dropbox::File.new(:width => 2, :height => 3)

    file.width.must_equal  2
    file.height.must_equal 3
  end
end
