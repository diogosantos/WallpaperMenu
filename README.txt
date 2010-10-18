*Wallpaper Menu* is an unofficial InterfaceLIFT.com client for the Mac. 
It is a menubar app that allows you to navigate through InterfaceLIFT's beautiful pictures and set them up as your wallpaper.

**Wallpaper Menu has non production code**
--
That means that you should not use it by now. 
However, if you decided give it a try, I'll appreciate your feedback.

Architecture (Developer Stuff)
--
1) HTML Parsing Isolation
I tried to isolate the interfaceLIFT.com accessing and HTML parsing in a separated class just to leave an open door for plugins creation. I have plans to create some plugins allowing people to navigate through other beautiful pictures websites.

2) Nokogiri with MacRuby
I've heard from the grape vines that now it's possible to use Nokogiri with MacRuby. If you know how to do that, please let me know or even better, send me your patch.