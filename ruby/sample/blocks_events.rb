# -*- coding: utf-8 -*-

event "空が落ちてくる" do
  @sky_height < 300
end

event "空が近づいてくる" do
  @sky_height < @mountains_height
end

setup do
  puts "空の高さを設定"
  @sky_height = 100
end

setup do
  puts "山の高さを設定"
  @mountains_height = 200
end

