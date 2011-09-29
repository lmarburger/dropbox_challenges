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

  def width
    files.each_with_index.inject(0) do |width, (file, index)|
      file_width = @orientation[index] == :rotated ?
                      file.height :
                      file.width

      width + file_width
    end
  end

  def height
    files.each_with_index.inject(0) do |height, (file, index)|
      file_height = @orientation[index] == :rotated ?
                      file.width :
                      file.height

      height > file_height ? height : file_height
    end
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
