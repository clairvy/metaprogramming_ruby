#!/usr/bin/env ruby19

class MyClass
  attr_accessor :a
end

obj = MyClass.new
obj.a = 2
p obj.a #=> 2

class Class
  attr_accessor :b
end

MyClass.b = 42
p MyClass.b #=> 42

class MyClass
  class << self
    attr_accessor :c
  end
end

MyClass.c = 'It works!'
p MyClass.c #=> 'It works!'
