#!/usr/bin/env ruby19

class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new
obj.instance_eval do
  p self
  p @v
end

v = 2
obj.instance_eval { @v = v }
obj.instance_eval { p @v }
