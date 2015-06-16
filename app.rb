require 'opal'
require 'opal-jquery'
require 'native'

class MyWidget

  def initialize

    @canvas = Element.find('#myCanvas').get(0)
    @ctx  = Native(`this.canvas.getContext('2d')`)
    @ctx.fillStyle='red'
    @ctx.fillRect(10,10,50,50)

    # game = Document.body #.querySelector('#game')
    # #
    # canvas = Document.createElement('canvas')
    # game.appendChild canvas
    # native_canvas = Native.new(canvas) #.to_n
    # native_canvas.width = Document.width
    # native_canvas.height = Document.height
    #
    # context = Native.new(canvas.getContext('2d')) #.to_n
    # context.beginPath
    # context.arc(200, 200, 70, 0, 2 * `Math.PI`, false)
    # context.fillStyle = '#65ACC2'
    # context.fill
    # context.lineWidth = 6
    # context.strokeStyle = '#2E5794'
    # context.stroke
    #
    # game

  end

end

Document.ready? do
  my_widget = MyWidget.new
end
