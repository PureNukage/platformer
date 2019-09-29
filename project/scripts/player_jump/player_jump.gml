if playerInput.key_right hspd += 1
if playerInput.key_left hspd -= 1

if !playerInput.key_right and !playerInput.key_left hspd = lerp(hspd,0,fric)

hspd = clamp(hspd,-max_movespeed,max_movespeed)

vspd = vspd + grav

if place_meeting(x,y+1,block) {
	states = states.basic		
}

//Check for horizontal collisions
repeat(abs(hspd)) {
    if (!place_meeting(x+sign(hspd),y+sign(vspd),block))
        x += sign(hspd); 
    else {
        hspd = 0;
        break;
    }		
}

//Check for vertical collisions
repeat(abs(vspd)) {
    if (!place_meeting(x+sign(hspd),y+sign(vspd),block))
        y += sign(vspd); 
    else {
        vspd = 0;
        break;
    }
}

if mouse_check_button_pressed(mb_left) {
	movespeed = clamp(movespeed,point_distance(x,y,mouse_x,mouse_y),7)
	Direction = point_direction(x,y,mouse_x,mouse_y)
	vspd += lengthdir_y(movespeed,Direction)
	states = states.leap
}

//x += hspd
//y += vspd

