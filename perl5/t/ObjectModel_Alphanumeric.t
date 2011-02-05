#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use FindBin;
use lib qq|$FindBin::Bin/../lib|;

use ObjectModel::Alphanumeric;
use autobox SCALAR => 'ObjectModel::Alphanumeric';

is(ObjectModel::Alphanumeric::to_alphanumeric('#3, the *Magic, Number*?'), '3 the Magic Number');
is('#3, the *Magic, Number*?'->to_alphanumeric(), '3 the Magic Number');

done_testing;
