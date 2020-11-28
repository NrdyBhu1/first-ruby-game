require 'ruby2d'

set title: 'Sprite Sheet Animations', background:'black', icon: 'assets/4.png', width: 500, height: 500

Text.new(
	'Use WASDC',
	x: 130, y: 10,
	size: 50,
	color: 'blue',
	rotate: 0,
	z: 10
)

Text.new(
	'for player',
	x: 130, y: 60,
	size: 50,
	color: 'blue',
	rotate: 0,
	z: 10
)

Text.new(
	'Hover over',
	x: 230, y: 260,
	size: 50,
	color: 'yellow',
	rotate: 0,
	z: 10
)

Text.new(
	'the coin',
	x: 230, y: 320,
	size: 50,
	color: 'yellow',
	rotate: 0,
	z: 10
)

Text.new(
	'Click anywhere',
	x: 10, y: 180,
	size: 50,
	color: 'teal',
	rotate: 0,
	z: 10
)


coin = Sprite.new(
	'assets/coin.png',
	x: 406, y: 406,
	clip_width: 84,
	time: 150,
	z: 10
)

coinbox = Square.new(
	x: coin.x, y: coin.y,
	size: 84,
	color: 'black',
	z: 1
)

boom = Sprite.new(
	'assets/boom.png',
	x: 150, y: 200,
	clip_width: 127,
	time: 90,
	z: 5
)

hero = Sprite.new(
	'assets/hero.png',
	width: 117,
	height: 148.5,
	clip_width: 78,
	time: 250,
	animations: {
	  walk: 1..2,
	  climb: 3..4,
	  cheer: 5..6
	}
)

on :key_down do |event|
	case event.key
	  when 'a'
		hero.play animation: :walk, loop: true, flip: :horizontal
	  when 'd'
		hero.play animation: :walk, loop: true
	  when 'w'
		hero.play animation: :climb, loop: true
	  when 's'
		hero.play animation: :climb, loop: true, flip: :vertical
	  when 'c'
		hero.play animation: :cheer
	end
end

on :mouse_move do |event|
	if coinbox.contains? event.x, event.y
		coin.play loop:true
	else
		coin.stop
	end
end

on :mouse_down do |event|
	boom.x = event.x - 63.5
	boom.y = event.y - 63.5
	boom.play
end

show