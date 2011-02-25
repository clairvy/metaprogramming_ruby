# -*- mode: perl; coding: utf-8-unix; -*-

use v6;

role CheckAttributes {
    has %.store;
    our method attr_checked ($name, $block) {
        self.^add_method($name, method ($v?) {
            if $v {
                unless $block($v) {
                    die 'Invalid attributes';
                }
                %.store{$name} = $v;
            }
            %.store{$name};
        });
    }
}
