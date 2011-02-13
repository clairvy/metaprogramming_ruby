#!/usr/bin/env perl6
# -*- mode: perl; coding: utf-8-unix; -*-

use v6;
use Test;
need ObjectModel::Alphanumeric;

is(ObjectModel::Alphanumeric.to_alphanumeric('#3, the *Magic, Number*?'), '3 the Magic Number');
#is('#3, the *Magic, Number*?'.to_alphanumeric(), '3 the Magic Number');

done_testing();
