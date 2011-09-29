require 'minitest/autorun'
require 'minitest/spec'

require_relative 'file'

describe Dropbox::File do
  it 'has a width' do
    Dropbox::File.new(:width => 1).width.must_equal 1
  end
end
