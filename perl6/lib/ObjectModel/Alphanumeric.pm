# -*- mode: perl; coding: utf-8-unix; -*-

use v6;

class ObjectModel::Alphanumeric {
    method ^to_alphanumeric($self, Str $s is copy) {
        $s ~~ s:g/<-alnum-space>+//;
        $s;
        }
}
