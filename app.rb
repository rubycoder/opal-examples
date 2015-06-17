require 'opal'
require 'opal-pixi'
require 'native'

class MyWidget
  include PIXI

  def initialize
    puts "hello"
    # stage = Stage.new 0x66FF99
    # renderer = WebGLRenderer.new 400, 300
    #
    # Native(`window.document.body`).appendChild renderer.view
    #
    # texture = Texture.from_image "bunny.png"
    # bunny = Sprite.new texture
    # bunny.anchor = Point.new(0.5, 0.5)
    # bunny.position = Point.new(300, 150)
    #
    # stage.add_child(bunny)
    #
    # animate = proc do
    #   `requestAnimFrame(animate)`
    #   bunny.rotation += 0.1
    #   renderer.render stage
    # end
    # `requestAnimFrame(animate)`
  end

end

Document.ready? do

end
