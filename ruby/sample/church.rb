#!/usr/bin/env ruby19
zero = lambda{|f|lambda{|x|x}}
addone = lambda{|m|lambda{|f|lambda{|x|f.call(m.call(f).call(x))}}}
one = addone.call(zero)
plus = lambda{|m,n|lambda{|f|lambda{|x|m.call(f).call(n.call(f).call(x))}}}
two = plus.call(one, one)
three = plus.call(one, two)

inc = lambda{|x|x+1}
puts 'zero  = ' + zero.call(inc).call(0).to_s
puts 'one   = ' + one.call(inc).call(0).to_s
puts 'two   = ' + two.call(inc).call(0).to_s
puts 'three = ' + three.call(inc).call(0).to_s
