
rail_width = 16.6;
hole_spacing_x = 7;
hole_spacing_y = 5.08;
guide_width = 3;
depth = 6;

width = guide_width * 2 + rail_width;

difference() {
    cube([width, hole_spacing_y * 6, depth + guide_width]);
    
    translate([guide_width, -1, depth])
    cube([rail_width, hole_spacing_y * 6 + 2, depth + guide_width]);
    
    
    translate([width / 2 - (hole_spacing_x / 2), 12, -1]) {
        cylinder(depth + guide_width, 1.56, 1.56, $fn = 11);
       
        translate([0, hole_spacing_y, 0])
            cylinder(depth + guide_width, 1.56, 1.56, $fn = 11);
    }
    
    
    translate([width / 2 + (hole_spacing_x / 2), 12, -1]) {
        cylinder(depth + guide_width, 1.56, 1.56, $fn = 11);
        
        translate([0, hole_spacing_y, 0])
            cylinder(depth + guide_width, 1.56, 1.56, $fn = 11);
    }
    
}



