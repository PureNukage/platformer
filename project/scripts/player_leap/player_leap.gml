hspd = lerp(hspd,0,fric+.3)

hspd = lengthdir_x(movespeed,Direction)

//movespeed = point_distance(0,0,hspd,vspd)
//Direction = point_direction(0,0,hspd,vspd)

vspd = clamp(vspd,-12,12)

vspd = vspd + grav

if place_meeting(x,y+1,block) states = states.basic

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