require 'opal'
require 'opal-jquery'

class MyWidget

  def initialize
    HTTP.get('/some/json').then do |response|
      process_json_data(response.json)
    end.fail do |response|
      handle_error(response.json[:error])
    end.always do
      hide_spinner!
    end
  end

  def process_json_data(json)

  end

  def handle_error(json)

  end

  def hide_spinner

  end
end

Document.ready? do
  my_widget = MyWidget.new
end
