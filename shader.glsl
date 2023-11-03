vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords ){
        //return vec4(screen_coords[1],screen_coords[1],screen_coords[1],1);
        return vec4(255*texture_coords[0],0,0,1);
}