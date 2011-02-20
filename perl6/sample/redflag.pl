#!/usr/bin/env perl6

use v6;

{
    my @setups = ();
    my %events = {};

    our sub event ($name, $block) { %events{$name} = $block };
    our sub setup ($block) { @setups.push($block) };

    my @fs = qx|echo *events.pm|;
    @fs = (@fs ==> map {$_=.chomp} ==> grep {.IO.f} ==> map {s/\.pm$//});
    for @fs -> $f {
        require $f;
        for %events.kv -> $name, $event {
            my %env;
            for @setups -> $setup {
                $setup(%env);
            }
            say "ALERT: $name" if $event(%env);
        }
    }
}
