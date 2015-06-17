require 'opal'
require 'opal-jquery'

module EventHandler
  def handle(event_type, selector, method_sym)
    Element[selector].on(event_type) {|event| send(method_sym, event) }
  end
end

class MyWidget
  include EventHandler
  
  @number_entrants = 1

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


# $(document).ready(function() {
#     var max_fields      = 10; //maximum input boxes allowed
#     var wrapper         = $(".input_fields_wrap"); //Fields wrapper
#     var add_button      = $(".add_field_button"); //Add button ID
#
#     var x = 1; //initlal text box count
#     $(add_button).click(function(e){ //on add input button click
#         e.preventDefault();
#         if(x < max_fields){ //max input box allowed
#             x++; //text box increment
#             $(wrapper).append('<div><input type="text" name="mytext[]"/><a href="#" class="remove_field">Remove</a></div>'); //add input box
#         }
#     });
#
#     $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
#         e.preventDefault(); $(this).parent('div').remove(); x--;
#     })
# });