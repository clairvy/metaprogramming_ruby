#!/usr/bin/env perl6
# -*- mode: perl; coding: utf-8-unix; -*-

use v6;

class MyClass {
    has $!v;
    method my_method {
        $!v = 1;
    }
}

my $obj = MyClass.new;
say $obj.WHAT; # like class
say $obj.^attributes; # like instance_variables
say $obj.^methods.grep({.name ~~ /my/}).join(', '); # like methods

say $obj.^parents.join(', '); # like ancestors
say $obj.^parents(:local).join(', '); # like superclass

say "MyClass < Any < Mu";
say MyClass.WHAT; # like class
say Any.WHAT; # like class
say Mu.WHAT; # like class

say "レキシカルなの(use oo, use open)が実装されてないかも";
{
    use MONKEY_TYPING;

    augment class Str {
        our method a {
            say "a";
        }
    }

    "a".a;
}
"a".a;

#{
#  class A is open {
#      method a {
#
#      }
#  }
#}
