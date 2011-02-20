#!/usr/bin/env perl6
# -*- mode: perl; coding: utf-8-unix; -*-

use v6;

class A {
    multi method CANDO ($self: $type, $name, *%args) {
        say "autoload called";
    }
    {
        # my $name = 'd';
        # OUR::($name) = method {
        #     say "d";
        # }

    }
    # my $a  = '&d';
    # ::($a) := 1;
    # ::<&d> = sub { }

    method a {
        say "a";
        eval "say \"b\";";
    }
}

# our &A::d := method {
#     say "d";
# };

# {
#     $B::c = 42;
#     say B::c();
# }

say A.^methods.map({.name}).sort.perl;
A.a();
say A.^methods.map({.name}).sort.perl;
