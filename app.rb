require "opal"

class Person
  attr_accessor :name, :age
  def initialize
    yield self
  end
  def speak
    "Hi, I am #{name} and I'm #{age} years old"
  end
end


10.times do |i|
  c = Person.new do |p|
    p.name = "Person#{i}"
    p.age = i
  end
  puts "Wow, running in the browser opal! #{c.speak}"
end
