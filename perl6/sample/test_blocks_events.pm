# -*- mode: perl; coding: utf-8-unix; -*-

use v6;

event "空が落ちてくる", method {
    $.get('sky_height') < 300;
};

event "空が近づいてくる", method {
    $.get('sky_height') < $.get('mountains_height');
};

setup method {
    say "空の高さを設定";
    $.set('sky_height' => 100);
};

setup method {
    say "山の高さを設定";
    $.set('mountains_height' => 200);
};
