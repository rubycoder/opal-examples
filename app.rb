require 'opal'
require 'opal-jquery'

class MyWidget

  @comments

  def initialize
    @comments = []
    HTTP.get('http://www.reddit.com/user/brain_poop/comments/.json').then do |response|
      process_json_data(response.json)
    end.fail do |response|
      handle_error(response.json[:error])
    end.always do
      hide_spinner!
    end
  end

  def process_json_data(json)
    alert('Data loaded successfully. Click ok to see the results!')

    json['data']['children'].each do |child|
      data = child['data']
      div = Element.parse "
      <div>
        <h1>#{data['link_title']}</h1>
        <p>#{data['body']}</p>
      </div>
      "
      @comments << div
    end

    render_comments
  end

  def handle_error(json)
    alert('handle_error')
  end

  def hide_spinner!
    Element['#spinner'].fade_toggle(800)
  end

  def render_comments
    @comments.each do |comment|
      Document.body << comment
    end
  end
end

Document.ready? do
  my_widget = MyWidget.new
end
