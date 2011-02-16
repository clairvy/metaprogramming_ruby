# -*- mode: perl; coding: utf-8-unix; -*-

use v6;
use MONKEY_TYPING;

class ObjectModel::Alphanumeric {
    method ^to_alphanumeric($self, Str $s is copy) {
        $s ~~ s:g/<-alnum-space>+//;
        $s;
    }
}

augment class Str {
    method to_alphanumeric() {
        my $s = self;
        $s ~~ s:g/<-alnum-space>+//;
        $s;
    }
}
