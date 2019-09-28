hspd = lerp(hspd,0,fric+.3)

hspd = lengthdir_x(movespeed,Direction)

//movespeed = point_distance(0,0,hspd,vspd)
//Direction = point_direction(0,0,hspd,vspd)

grav = .6

vspd = clamp(vspd,-15,15)

vspd = vspd + grav

//Check for horizontal collisions
if place_meeting(x+hspd,y,block) {
	hspd = round(hspd)
	while !place_meeting(x+sign(hspd),y,block) {
		x = x + sign(hspd)	
	}
	hspd = 0
}

//Check for vertical collisions
if place_meeting(x,y+vspd,block) {
	vspd = round(vspd)
	while !place_meeting(x,y+sign(vspd),block) {
		y = y + sign(vspd)	
	}
	vspd = 0
	states = states.basic
	grav = .4
}

x += hspd
y += vspd

