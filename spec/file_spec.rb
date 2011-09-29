require File.expand_path('../../file', __FILE__)

describe Dropbox::File do
  it 'has a width' do
    Dropbox::File.new(:width => 1).width.should eql(1)
  end

  it 'has a height' do
    Dropbox::File.new(:height => 1).height.should eql(1)
  end

  it 'has a width and height' do
    file = Dropbox::File.new(:width => 2, :height => 3)

    file.width.should  eql(2)
    file.height.should eql(3)
  end
end
