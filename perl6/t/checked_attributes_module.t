#!/usr/bin/env perl6
# -*- mode: perl; coding: utf-8-unix; -*-

use v6;
use Test;
need CheckAttributes;

class Person does CheckAttributes {
    Person.attr_checked('age', -> $v {
        $v >= 18;
    });
}

my $bob = Person.new;

#$bob.age = 18;
$bob.age(18);
is(18, $bob.age, 'normal setter/getter');

try {
    $bob.age(17);
}
is($!, 'Invalid attributes', 'exception match');

done;
