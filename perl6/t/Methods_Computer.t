#!/usr/bin/env perl6
# -*- mode: perl; coding: utf-8-unix; -*-

use v6;

need Methods::Computer;
need Methods::DS;

use Test;

my $c = Methods::Computer.new(42, Methods::DS.new);
is $c.mouse, "Mouse: Dual Optical (40)", 'mouse';
is $c.cpu, "* Cpu: 2.16 GHz (150)", 'cpu';
is $c.keyboard, "Keyboard: no-brand (20)", 'keyboard';

done();
