#!/usr/bin/env ruby19
# -*- coding: utf-8 -*-

class Lawyer; end

nick = Lawyer.new
#nick.talk_simple
#nick.send(:method_missing, :my_method)

class Lawyer
  def method_missing(method, *args)
    puts "#{method}(#{args.join(', ')})を呼び出した"
    puts "(ブロックを渡した)" if block_given?
  end
end

bob = Lawyer.new
bob.talk_simple('a', 'b') do
  # ブロック
end
