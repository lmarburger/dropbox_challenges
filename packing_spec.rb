require 'minitest/autorun'
require 'minitest/spec'

class Dropbox < Struct.new(:files)

  def area
    original_files = files.dup

    permutations = (0...2 ** files.size).map do |permute|
      permute.to_s(2).split(//).each_with_index do |rotate, index|
        rotate_file index if rotate == '1'
      end

      area  = width * height
      files = original_files

      area
    end

    permutations.inject(nil) do |smallest, permute|
      smallest && smallest < permute ? smallest : permute
    end
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

  def rotate_file(index)
    files[index].tap do |file|
      new_width = file[:height]

      file[:height] = file[:width]
      file[:width]  = new_width
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

  it 'rotates files to fit more efficiently' do
    files = [{ :height => 3, :width => 4 },
             { :height => 4, :width => 3 }]

    Dropbox.new(files).area.must_equal 24
  end
end
