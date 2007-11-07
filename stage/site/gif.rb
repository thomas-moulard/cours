require 'RMagick'
require 'mathn'

include Magick

gif = ImageList.new

for i in 0..12
  gif.new_image(640, 170) { self.background_color = "rgb(255,255,255,255)"}
end

#gif.animate

list = ImageList.new("img/vaucanson.jpg")
canard = list.flatten_images

theta = 0
for i in 0..6
  gif.scene = i
  gif.cur_image().composite!(canard, i * (640 / 12), (170 - 167) + Math.cos(theta) * 10, OverCompositeOp)
  theta = (theta + 1.57) % 3.14
end

gif.scene = 7
x = 6 * (640 / 12)
y = 170 - 164

d = Draw.new
gif.cur_image().annotate(d, 100, 25, x - 50, 170 - 25, "leroi_g - 18147")
gif.cur_image().composite!(canard, x, y, OverCompositeOp)

theta = 0
for i in 8..12
  gif.scene = i
  gif.cur_image().annotate(d, 100, 25, x - 50, 170 - 2, "leroi_g - 18147")
  gif.cur_image().composite!(canard, i * (640 / 12), (170 - 167) + Math.cos(theta) * 10, OverCompositeOp)
  theta = (theta + 1.57) % 3.14
end

gif.delay = 20
gif.animate
gif.write("img/vaucanson.gif")
