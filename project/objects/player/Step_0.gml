if playerInput.key_right hspd += 1
if playerInput.key_left hspd -= 1

if !playerInput.key_right and !playerInput.key_left hspd -= sign(hspd)

hspd = clamp(hspd,-max_movespeed,max_movespeed)

x += hspd

vspd = vspd + grav

//Jump
if place_meeting(x,y+1,block) and playerInput.key_jump {
	vspd = jumpspeed	
}

//Check for horizontal collisions
if place_meeting(x+hspd,y,block) {
	while !place_meeting(x+sign(hspd),y,block) {
		x = x + sign(hspd)	
	}
	hspd = 0
}
x = x + hspd

//Check for vertical collisions
if place_meeting(x,y+vspd,block) {
	while !place_meeting(x,y+sign(vspd),block) {
		y = y + sign(vspd)	
	}
	vspd = 0
}
y = y + vspd








