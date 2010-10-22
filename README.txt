WallpaperMenu.
-------------------
WallpaperMenu is a Mac OS X menubar application that navigates through beautiful pictures on the web and set them up as your desktop image.
WallpaperMenu is NOT an official client of a website or a service.

DISCLAIMER.
-------------------
Wallpaper Menu has non production code, it means that you should not use it by now. However, if you decided give it a try, I'll appreciate your feedback.

TODO.
-------------------
# When a thumbnail was clicked twice, WallpaperMenu should download it only once
# Make the folder for downloaded wallpapers and the screen resolution configurable.
# Give the user some feedback while downloading the wallpaper.
# WallpaperNavigatorView needs to request more wallpapers to show.
# WallpaperView needs to display a loading image when not display wallpapers and not that placeholder.
# Call a designer to make the application look great

FOR DEVELOPERS.
-------------------
1) HTML Parsing Isolation.
I tried to isolate the interfaceLIFT.com accessing and HTML parsing in a separated class just to leave an open door for plugins creation. I have plans to create some plugins allowing people to navigate through other beautiful pictures websites.

2) Nokogiri with MacRuby.
I've heard that now it's possible to use Nokogiri with MacRuby. If you know how to do that, please let me know or even better, send me your patch.
