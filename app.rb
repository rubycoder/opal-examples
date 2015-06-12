require 'opal'
require 'opal-jquery'

module EventHandler
  def handle(event_type, selector, method_sym)
    Element[selector].on(event_type) {|event| send(method_sym, event) }
  end
end

class MyWidget
  include EventHandler

  def initialize
    @widget_type = "div tag"
    handle :click, '#clickme', :somemethod
  end

  def somemethod(event)
    event.current_target.html = "Clicked the #{@widget_type}!"
  end
end

Document.ready? do
  my_widget = MyWidget.new
end
