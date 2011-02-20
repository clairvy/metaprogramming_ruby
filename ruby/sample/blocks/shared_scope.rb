#!/usr/bin/env ruby19

def define_methods
  shared = 0

  Kernel.send :define_method, :counter do
    shared
  end

  Kernel.send :define_method, :inc do |x|
    shared += x
  end
end

define_methods
p counter #=> 0
inc(4)
p counter #=> 4
