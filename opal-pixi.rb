require 'opal'

module PIXI
  class Stage
    %x{
      #{self}._proto = window.PIXI.Stage.prototype, def = #{self}._proto;
      window.PIXI.Stage.prototype._klass = #{self};
    }

    def self.new(color)
      `new window.PIXI.Stage(color)`
    end

    def add_child(child)
      `#{self}.addChild(child)`
    end
  end

  class WebGLRenderer
    %x{
       #{self}._proto = window.PIXI.WebGLRenderer.prototype, def = #{self}._proto;
      window.PIXI.WebGLRenderer.prototype._klass = #{self};
    }
    def self.new(width, height)
      `new window.PIXI.WebGLRenderer(width, height)`
    end

    def render(stage)
      `self.render(stage)`
    end

    def view
      `self.view`
    end
  end
  class Texture
    %x{
       #{self}._proto = window.PIXI.Texture.prototype, def = #{self}._proto;
      window.PIXI.Texture.prototype._klass = #{self};
    }
    def self.from_image(name)
      `window.PIXI.Texture.fromImage(name)`
    end
  end
  class Sprite
    %x{
       #{self}._proto = window.PIXI.Sprite.prototype, def = #{self}._proto;
      window.PIXI.Sprite.prototype._klass = #{self};
    }
    def self.new(texture)
      `new window.PIXI.Sprite(texture)`
    end
    def anchor
      Point.new `#{self}.anchor.x`,`#{self}.anchor.y`
    end
    def rotation
      `self.rotation`
    end
    def rotation=(r)
      `self.rotation = r`
    end
    def anchor=(a)
      `self.anchor = a`
    end
    def position=(p)
      `self.position = p`
    end
  end
  class Point
    %x{
       #{self}._proto = window.PIXI.Point.prototype, def = #{self}._proto;
      window.PIXI.Point.prototype._klass = #{self};
    }
    def self.new(x,y)
      `new window.PIXI.Point(x,y)`
    end
  end
end
