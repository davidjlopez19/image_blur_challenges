class Image

  def initialize (image)
    @image = image
  end

  def get_location_of_ones
    locations = []
    @image.each_with_index do |row, image_index|
      row.each_with_index do |item, row_index|
        if item == 1
          locations << [image_index, row_index]
        end
      end
    end
    locations
  end

  def spread_ones
    ones = get_location_of_ones
      @image.each_with_index do |row, image_index|
        row.each_with_index do |item, row_index|
          ones.each do |found_image_index, found_row_index|

            if image_index == found_image_index && row_index == found_row_index
              @image[image_index -1][row_index] = 1 unless image_index == 0 #up
              @image[image_index +1][row_index] = 1 unless image_index >= 0 #down
              @image[image_index][row_index -1] = 1 unless row_index == 0 #left
              @image[image_index][row_index +1] = 1 unless row_index >= 3 #right
            end
          end
        end
      end
  end

  def output_image
    @image.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

#original output
image.output_image
puts
image.spread_ones

#blurred output
image.output_image