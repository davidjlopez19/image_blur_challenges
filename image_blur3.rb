class Image 
    attr_accessor :picture
  
    def initialize(image)
      @image = image
    end

  def get_location_of_ones
    #store addresses of 1s in array
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

  def spread_ones(travel)
    ones = get_location_of_ones

    @image.each_with_index do |row, image_index|
      row.each_with_index do |item, row_index|
        ones.each do |find_image_index, find_row_index|

          if manhattan_distance(row_index, image_index, find_row_index, find_image_index) <= travel
            @image[image_index][row_index] = 1
          end

        end
      end
    end
  end

  def manhattan_distance(x1, y1, x2, y2)
    # x1 = 2
    # y1 = 4
    # x2 = 1
    # y2 = 3
    x_axis_distance = (x2 - x1).abs
    # x_axis_distance = 1
    y_axis_distance = (y2 - y1).abs
    # y_axis_distance = 1
    x_axis_distance + y_axis_distance
    # x_axis_distance + y_axis_distance = 2
  end

  def output_image
    @image.each do |transform|
      puts transform.join
    end
  end
end


image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1],
])

image.output_image
puts


image.spread_ones(2)
image.output_image
