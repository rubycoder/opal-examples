require 'opal'
require 'opal-jquery'
require 'ostruct'
require 'native'

class MyWidget

  def initialize

    @canvas = Element.find('#myCanvas')
    @ctx  = Native(`this.canvas[0].getContext('2d')`)

    @canvas.attr :width, @canvas.width
    @canvas.attr :height, @canvas.height

    @num_eyes = 3

    @mouse_event = OpenStruct.new(page_x: 0, page_y: 0)

    @canvas.on :mousemove do |event|
      @mouse_event = event
      render_scene
    end


    @canvas.on :click do |event|
      @num_eyes = 1 + (@num_eyes) % 10
      render_scene
    end

  end

  def render_scene
    width = @canvas.width
    height = @canvas.height

    @ctx.clearRect(0, 0, width, height)
    @ctx.fillStyle = 'black'
    @ctx.fillRect(0, 0, width, height)

    (0..@num_eyes).each do |i|
      x = width * i / @num_eyes
      (0..@num_eyes).each do |j|
        y = height * j / @num_eyes

        render_eye_at(x, y, @mouse_event)
      end
    end

    @ctx.fillStyle = 'red'
    size = 10
    @ctx.fillRect(event.page_x - size/2, event.page_y - size/2, size, size)
  end

  def render_eye_at(center_x, center_y, event)
    eyeball_size = 50

    @ctx.fillStyle = 'white'
    @ctx.beginPath
    @ctx.arc(center_x, center_y, eyeball_size, 0, 6.29)
    @ctx.fill

    diff_x = event.page_x - center_x
    diff_y = event.page_y - center_y
    length = `Math.sqrt(diff_x * diff_x + diff_y * diff_y)`
    pupil_size = 25
    distance_outward = 1
    if length > (eyeball_size - pupil_size)
      distance_outward *= (eyeball_size - pupil_size)
    else
      distance_outward *= length
    end
    multiplier = `eyeball_size * (1 - Math.exp(-distance_outward / eyeball_size)) / length`
    new_x = center_x + multiplier * diff_x
    new_y = center_y + multiplier * diff_y

    @ctx.fillStyle = 'black'
    @ctx.beginPath
    @ctx.arc(new_x, new_y, pupil_size, 0, 6.29)
    @ctx.fill
  end
end

Document.ready? do
  MyWidget.new
end
