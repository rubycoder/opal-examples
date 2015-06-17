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
    @number_entrants = 1
    @entrants = []
    handle :click, '#add_entrant', :add_entrant
    handle :click, '#select_entrant', :select_entrant
  end

  def add_entrant(event)
    @number_entrants += 1
    entrant_field = "entrant_" + @number_entrants.to_s
    Element[".input_fields_wrap"].append('<div><input type="text" name="mytext[]"/><a href="#" class="remove_field" id="' + entrant_field + '">Remove</a></div>')
    handle :click, '#entrant_' + @number_entrants.to_s, :remove_entrant
    puts "Number of entrants: #{@number_entrants}"
  end
  def remove_entrant(event)
    entrant_field = "#entrant_" + @number_entrants.to_s
    Element[entrant_field].parent.remove
    @number_entrants -= 1
    puts "Number of entrants: #{@number_entrants}"
  end
  def select_entrant(event)
    Element[".input_fields_wrap"].each do |entrant, input_val|
      puts input_val
      @entrants << input_val.value
    end
  end
end

Document.ready? do
  my_widget = MyWidget.new
end