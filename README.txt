Wallpaper Menu.
-------------------
Wallpaper Menu is a menubar app that allows you to navigate through InterfaceLIFT's beautiful pictures and set them up as your wallpaper.
Wallpaper Menu is NOT an official InterfaceLIFT.com client for the Mac.

DISCLAIMER.
-------------------
Wallpaper Menu has non production code, it means that you should not use it by now. However, if you decided give it a try, I'll appreciate your feedback.

TODO.
-------------------
# Disable the "Next button" when displaying the last wallpaper. Same for the "Previous button"
# Implement the "Previous" button
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
