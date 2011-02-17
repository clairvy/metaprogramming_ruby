#!/usr/bin/env perl6
# -*- mode: perl; coding: utf-8-unix; -*-

use v6;

class Methods::DS {
    method get_mouse_info ($id) { "Dual Optical" }
    method get_mouse_price ($id) { 40 }
    method get_cpu_info ($id) { "2.16 GHz" }
    method get_cpu_price ($id) { 150 }
    method get_keyboard_info ($id) { "no-brand" }
    method get_keyboard_price ($id) { 20 }
}
