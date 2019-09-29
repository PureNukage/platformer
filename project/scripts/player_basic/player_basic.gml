if playerInput.key_right hspd += 1
if playerInput.key_left hspd -= 1

if !playerInput.key_right and !playerInput.key_left hspd = lerp(hspd,0,fric)

hspd = clamp(hspd,-max_movespeed,max_movespeed)

if !place_meeting(x,y+1,block) vspd = vspd + grav

//Jump
if place_meeting(x,y+1,block) and playerInput.key_jump {
	states = states.jump
	vspd = jumpspeed	
}

//Check for horizontal collisions
// Horizontal
repeat(abs(hspd)) {
	
    // Move up slope
    if (place_meeting(x + sign(hspd), y, block) && place_meeting(x + sign(hspd), y - 1, block) && !place_meeting(x + sign(hspd), y - 2, block))
        y -= 2;
    else if (place_meeting(x + sign(hspd), y, block) && !place_meeting(x + sign(hspd), y - 1, block))
        --y;
    
    // Move down slope
    if (!place_meeting(x + sign(hspd), y, block) && !place_meeting(x + sign(hspd), y + 1, block) && !place_meeting(x + sign(hspd), y + 2, block) && place_meeting(x + sign(hspd), y + 3, block))
        y += 2;
    else if (!place_meeting(x + sign(hspd), y, block) && !place_meeting(x + sign(hspd), y + 1, block) && place_meeting(x + sign(hspd), y + 2, block))
        ++y; 	
	
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

if keyboard_check_pressed(vk_up) jumpspeed -= 1
if keyboard_check_pressed(vk_down) jumpspeed += 1
if keyboard_check_pressed(vk_right) grav += .1
if keyboard_check_pressed(vk_left) grav -= .1