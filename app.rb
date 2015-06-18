require 'opal'
require 'opal-jquery'
require 'promise'

module EventHandler
  def handle(event_type, selector, method_sym)
    Element[selector].on(event_type) {|event| send(method_sym, event) }
  end
end

class MyWidget
  include EventHandler
  

  def initialize
    @number_entrants = 0
    handle :click, '#add_entrant', :add_entrant
    handle :click, '#select_entrant', :select_entrant
  end

  def add_entrant(event)
    @number_entrants += 1
    entrant_field = "entrant_" + @number_entrants.to_s
    Element[".input_fields_wrap"].append('<div><input type="text" class="entrant" name="entrant[]"></input><a href="#" class="remove_field" id="' + entrant_field + '">Remove</a></div>')
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
    @entrants = []
    Element[".entrant"].each do |div|
      @entrants << div.value
    end
    puts result = @entrants.shuffle
    result_html = Element["#result"]
    result_html.effect(:fade_out, 0)
    # TODO Update the reveal to show the 'winners'
    # result_html.class_name = "winner"
    # for i in 0..(result.length - 2)
    #   result_html.text = "It could have been: " + result[i].to_s
    #   result_html.effect(:fade_in, 1000)
    #   result_html.effect(:fade_out, 100)
    # end
    result_html.class_name = "loser"
    result_html.text = "The unlucky one is..." + result.last.to_s
    result_html.effect(:fade_in, 5000)
  end
end

Document.ready? do
  my_widget = MyWidget.new
end