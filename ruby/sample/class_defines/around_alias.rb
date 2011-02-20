#!/usr/bin/env ruby19

class String
  alias :real_length :length

  def length
    real_length > 5 ? 'long' : 'short'
  end
end

p 'War and Peace'.length      #=> 'long'
p 'War and Peace'.real_length #=> 13
