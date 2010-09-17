# Wallpaper.rb
# WallpaperMenu
#
# Created by Diogo on 9/16/10.
# Copyright 2010 __MyCompanyName__. All rights reserved.


class Wallpaper < NSWindowController
	attr_writer :button
	
	def clicked(sender)
	  puts "Button clicked!"
	end
	
end