class Image 
    attr_accessor :picture
  
    def initialize(blur)
    @blur = blur
  end

  def output_image
    @blur.each do |image|
      puts image.join
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image