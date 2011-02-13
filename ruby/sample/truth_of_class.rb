#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

class MyClass
    def my_method
        @v = 1
    end
end

puts "> methods"
p MyClass.new.methods
puts

puts "> instance_variables"
p MyClass.new.instance_variables
puts

obj = MyClass.new
obj.my_method
puts "> instance_variables (instance_variable は動的に生成される)"
p obj.instance_variables
puts

puts "> method 一覧も簡単に取れるよ"
p obj.methods.grep(/^my/)
puts

puts "> インスタンスメソッドとクラスメソッドがあるよ"
p String.instance_methods == "abc".methods #=> true
p String.methods == "abc".methods          #=> false
puts

puts "クラスはオブジェクト"
p "abc".class      #=> String
p String.class     #=> Class
puts

puts "継承関係 String < Object < BasicObject < nil"
inherited = false
p Class.instance_methods(inherited)
p String.superclass      #=> Object
p Object.superclass      #=> BasicObject
p BasicObject.superclass #=> nil
p Class.superclass       #=> Module
p Module.superclass      #=> Object  
puts

puts "問題"
p Object.class      #=> Class
p Module.superclass #=> Object
p Class.class       #=> Class
puts

puts "メソッド探索"
p MyClass.ancestors
puts
