if playerInput.key_right hspd += 1
if playerInput.key_left hspd -= 1

if !playerInput.key_right and !playerInput.key_left hspd = lerp(hspd,0,fric)

hspd = clamp(hspd,-max_movespeed,max_movespeed)

vspd = vspd + grav

//Check for horizontal collisions
if place_meeting(x+hspd,y,block) {
	while !place_meeting(x+sign(hspd),y,block) {
		x = x + sign(hspd)	
	}
	hspd = 0
}

//Check for vertical collisions
if place_meeting(x,y+vspd,block) {
	while !place_meeting(x,y+sign(vspd),block) {
		y = y + sign(vspd)	
	}
	vspd = 0
	states = states.basic
}

if mouse_check_button_pressed(mb_left) {
	movespeed = clamp(movespeed,point_distance(x,y,mouse_x,mouse_y),15)
	Direction = point_direction(x,y,mouse_x,mouse_y)
	vspd += lengthdir_y(movespeed,Direction)
	states = states.leap
}

x += hspd
y += vspd

