class Dropbox

  attr_reader :files

  def initialize(files)
    @files       = files
    @orientation = Array.new files.size
  end

  def area
    area_permutations.inject(nil) do |smallest, area_permutation|
      smallest && smallest < area_permutation ? smallest : area_permutation
    end
  end

private

  def height
    files.inject(0) do |height, file|
      file_height = height_for file

      height > file_height ? height : file_height
    end
  end

  def height_for(file)
    index = files.index file

    @orientation[index] == :rotated ?
      files[index].width :
      files[index].height
  end

  def width
    files.inject(0) do |width, file|
      width + width_for(file)
    end
  end

  def width_for(file)
    index = files.index file

    @orientation[index] == :rotated ?
      files[index].height :
      files[index].width
  end

  def area_permutations
    each_permutation do
      width * height
    end
  end

  def each_permutation
    (0...2 ** files.size).map do |permute|
      permute.
        to_s(2).
        rjust(files.size, '0').
        split(//).
        each_with_index do |rotate, index|
          @orientation[index] = rotate == '1' ? :rotated : nil
        end

      yield
    end
  end

end
