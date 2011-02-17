#!/usr/bin/env perl6
# -*- mode: perl; coding: utf-8-unix; -*-

use v6;

class Methods::Computer {
    has $!id;
    has $!data_source;
    submethod BUILD ($!id, $!data_source) {}
    method new ($id, $data_source) {
        self.Mu::new(id => $id, data_source => $data_source);
    }
    method mouse {
        my $info = $!data_source.get_mouse_info($!id);
        my $price = $!data_source.get_mouse_price($!id);
        my $result = "Mouse: $info ($price)";
        if ($price > 100) {
            $result = "* " ~ $result;
        }
        $result;
    }
    method cpu {
        my $info = $!data_source.get_cpu_info($!id);
        my $price = $!data_source.get_cpu_price($!id);
        my $result = "Cpu: $info ($price)";
        if ($price > 100) {
            $result = "* " ~ $result;
        }
        $result;
    }
    method keyboard {
        my $info = $!data_source.get_keyboard_info($!id);
        my $price = $!data_source.get_keyboard_price($!id);
        my $result = "Keyboard: $info ($price)";
        if ($price > 100) {
            $result = "* " ~ $result;
        }
        $result;
    }
}
