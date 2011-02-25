#!/usr/bin/env perl6

use v6;

use MONKEY_TYPING;

class MyClass {
    has $.a is rw; # メソッドを刺してる，場所もオブジェクト毎に別
}

# 影響が大き過ぎる
augment class Any {
    my $b;
    # そんなに厳密にやらなくてもいいんじゃね？
#    method b ($self where {not $_.defined} :) { $b }
    method b { $b }
}

# open class
augment class MyClass {
    my $c;
#    method c ($self where {not $_.defined} :) { $c }
    method c { $c }
}

my $obj = MyClass.new;
$obj.a = 2;
say $obj.a; # => 2

say MyClass.new.a; # => Any()

MyClass.b = 42;
say MyClass.b; # => 42

say (class {}).b; # => 42
# say (class {}).a; # => error
# say (class {}).c; # => error

MyClass.c = 'It works!';
say MyClass.c; # => 'It works!'

#say MyClass.new.c; # => 'It works' クラスメソッドも同じように呼べる
