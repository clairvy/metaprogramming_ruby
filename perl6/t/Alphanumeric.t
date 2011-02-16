#!/usr/bin/env perl6
# -*- mode: perl; coding: utf-8-unix; -*-

use v6;
use Test;
need ObjectModel::Alphanumeric;

my $dat = '#3, the *Magic, Number*?';
my $exp = '3 the Magic Number';
is(ObjectModel::Alphanumeric.to_alphanumeric($dat), $exp);

# append method to open class.
my $str = $dat;
is($str.to_alphanumeric(), $exp);
is($str, $dat);

done();
