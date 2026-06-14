iconutil -c iconset B.icns
cp B.iconset/icon_512x512@2x.png B.png
magick B.png -define icon:auto-resize=256,128,64,48,32,16 B.ico
