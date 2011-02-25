#!/usr/bin/env perl6

use v6;

my $zero = ->$f{->$x{$x}};
my $addone = ->$n{->$f{->$x{$f($n($f)($x))}}};
my $one = $addone($zero);
my $add = ->$m,$n{->$f{->$x{$n($f)($m($f)($x))}}};
my $two = $add($one, $one);
my $three = $add($two, $one);

my $inc = {$^n+1};
say 'zero  = ', $zero($inc)(0);
say 'one   = ', $one($inc)(0);
say 'two   = ', $two($inc)(0);
say 'three = ', $three($inc)(0);
