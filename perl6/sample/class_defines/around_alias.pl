#!/usr/bin/env perl6

use v6;

use MONKEY_TYPING;

augment class Str {
    .^add_method('real_chars', &chars);

    method chars {
        .real_chars > 5 ?? 'long' !! 'short'
    }
}

say 'War and Peace'.chars;      # => 'long'
say 'War and Peace'.real_chars; # => 13
