require 'rubygems'
require 'flickraw'
list   = flickr.photos.getRecent

id     = list[0].id
secret = list[0].secret
info = flickr.photos.getInfo :photo_id => id, :secret => secret

p info.title           # => "PICT986"
p info.dates.taken     # => "2006-07-06 15:16:18"

sizes = flickr.photos.getSizes :photo_id => id

original = sizes.find {|s| s.label == 'Original' }

list = flickr.interestingness.getList :per_page => 20
list.each {|photo| puts "'#{photo.title}' id=#{photo.id} secret=#{photo.secret}" }