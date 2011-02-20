# -*- mode: perl; coding: utf-8-unix; -*-

use v6;

event "空が落ちてくる", -> %s {
    %s{'sky_height'} < 300;
};

event "空が近づいてくる", -> %s {
    %s{'sky_height'} < %s{'mountains_height'};
};

setup -> %s {
    say "空の高さを設定";
    %s{'sky_height'} = 100;
};

setup -> %s {
    say "山の高さを設定";
    %s{'mountains_height'} = 200;
};
