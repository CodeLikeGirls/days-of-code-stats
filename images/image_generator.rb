require 'rmagick'

module DaysOfCode
  class ImageGenerator
    def initialize(text, filename = 'stats.png')
      @text = Array(text)
      @filename = [image_directory, filename].join('/')
      Dir.mkdir(image_directory) unless Dir.exist?(image_directory)
    end

    def draw
      canvas = Magick::Image.new(width, height){ self.background_color = 'black' }
      gc = Magick::Draw.new

      gc.font_family = 'courier'
      gc.fill = 'white'
      gc.pointsize(15)
      text.each_with_index do |t, i|
        gc.text(15, 20 + i*20, t)
      end
      gc.draw(canvas)
      canvas.write(filename)
    end

    private

    attr_reader :text, :filename

    def image_directory
      'stats_images'
    end

    def width
      text.max_by(&:length).length*10
    end

    def height
      text.size*20 + 20
    end
  end
end