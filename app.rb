require 'opal'
require 'opal-jquery'

$current_target = nil

Document.ready? do
  menu = Element.find '#menu'
  ['One','Two','Three'].each do |item_name|
    menu.append "<li>#{item_name}</li>"
  end
  Element.find('#menu li').on :click do |evt|
    $current_target.remove_class 'blue' unless $current_target.nil?
    evt.current_target.add_class 'blue'
    $current_target = evt.current_target
  end
end
