require 'opal/pixi'
require 'native'

class Game
  def initialize
    stage = PIXI::Stage.new 0x1099BB
    renderer = PIXI::WebGLRenderer.new 800, 600

    # opal-jquery would clean this up
    body = Native(`window.document.body`)
    body.appendChild renderer.view


    texture = PIXI::Texture.from_image "bunny.png"
    bunny = PIXI::Sprite.new texture
    bunny.anchor = PIXI::Point.new(0.5, 0.5)
    bunny.position = PIXI::Point.new(300, 150)

    stage.add_child(bunny)

    animate = Proc.new do
      `requestAnimFrame(animate)`
      bunny.rotation += 0.1
      renderer.render stage
    end
    `requestAnimFrame(animate)`
  end
end
