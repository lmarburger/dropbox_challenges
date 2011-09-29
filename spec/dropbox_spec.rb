require File.expand_path('../../dropbox', __FILE__)
require File.expand_path('../../file', __FILE__)

describe Dropbox do
  it 'calculates the area of a single file' do
    files = [ stub(height: 3, width: 3) ]

    Dropbox.new(files).area.should eql(9)
  end

  it 'calculates the area of two equal square files' do
    files = [ stub(height: 3, width: 3),
              stub(height: 3, width: 3) ]

    Dropbox.new(files).area.should eql(18)
  end

  it 'calculates the area of two unequal square files' do
    files = [ stub(height: 3, width: 3),
              stub(height: 4, width: 4) ]

    Dropbox.new(files).area.should eql(28)
  end

  it 'rotates files to fit more efficiently' do
    files = [ stub(height: 2, width: 2),
              stub(height: 1, width: 3) ]

    Dropbox.new(files).area.should eql(9)
  end

  it 'integrates with Dropbox::File' do
    files = [ Dropbox::File.new(height: 3, width: 3) ]

    Dropbox.new(files).area.should eql(9)
  end
end
