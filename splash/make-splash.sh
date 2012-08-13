#!/bin/bash
convert Archive_team-white.png \
  -resize 280x \
  -repage 640x400+150+40 \
  -background "#cccccc" \
  -flatten +matte \
  -pointsize 14 -font DejaVu-Sans-Book \
  -annotate +70+375 "Point your web browser to http://localhost:8001/ to manage your warrior." \
  at-splash.png
python png2fb at-splash.png at-splash.fb

