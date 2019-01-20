
board_spacing = 150;
face_thickness = 3;
board_offset = 10;
encoder_spacing = 132;
wall_thickness = 3;
board_radius = 5.5;

// 20, 3.5, 15.25


module encoder() {
    mirror([0, 0, 1]) {
        translate([-14 / 2, -16 / 2, -10]) cube([14, 16, 7.5 + 10]);
        translate([-14 / 2, -16 / 2 - 5, -10]) cube([14, 21, 1 + 10]);
        cylinder(35, 3.55, 3.55);
    }
}

module pot() {
    mirror([0, 0, 1]) {
        translate([-11 / 2, -13 / 2, -10]) cube([11.5, 14, 7.5 + 10]);
        cylinder(35, 3.55, 3.55);
    }
}


difference() {
    union() {
            height = 25 + face_thickness + board_offset;
        
            difference() {
            hull () {
                cylinder(height, 5 + wall_thickness, 5 + wall_thickness);
                translate([board_spacing, 0, 0]) cylinder(height, 5 + wall_thickness, 5 + wall_thickness);
                translate([board_spacing, board_spacing, 0]) cylinder(height, 5 + wall_thickness, 5 + wall_thickness);
                translate([0, board_spacing, 0]) cylinder(height, 5 + wall_thickness, 5 + wall_thickness);
            } 

            translate([0, 0, face_thickness])
            hull () {
                cylinder(height, board_radius, board_radius);
                translate([board_spacing, 0, 0]) cylinder(height, board_radius, board_radius);
                translate([board_spacing, board_spacing, 0]) cylinder(height, board_radius, board_radius);
                translate([0, board_spacing, 0]) cylinder(height, board_radius, board_radius);
            }
        }
        
        translate([(board_spacing / 2) - 98 / 2 , (board_spacing / 2) - 98 / 2, 0]) cube([98, 98, board_offset]);
        
        translate([58 - 5 / 2, board_spacing - 1 - 18 - 5 / 2, 0]) cube([33 + 5, 18 + 5, board_offset]);

        cylinder(board_offset, board_radius, board_radius);
        translate([board_spacing, 0, 0]) cylinder(board_offset, board_radius, board_radius);
        translate([board_spacing, board_spacing, 0]) cylinder(board_offset, board_radius, board_radius);
        translate([0, board_spacing, 0]) cylinder(board_offset, board_radius, board_radius);
        
    }

    translate([25 + 9 + 16 * 0, 9, board_offset]) pot();
    translate([25 + 9 + 16 * 1, 9, board_offset]) pot();
    translate([25 + 9 + 16 * 2, 9, board_offset]) pot();
    translate([25 + 9 + 16 * 3, 9, board_offset]) pot();
    translate([25 + 9 + 16 * 4, 9, board_offset]) pot();
    translate([25 + 9 + 16 * 5, 9, board_offset]) pot();
    
    translate([0, 0, 3]) cylinder(10, 2.5, 3);
    translate([board_spacing, 0, 3]) cylinder(10, 2.5, 2.5);
    translate([board_spacing, board_spacing, 3]) cylinder(10, 2.5, 2.5);
    translate([0, board_spacing, 3]) cylinder(10, 2.5, 2.5);

    translate([9, 9, board_offset]) encoder();
    translate([encoder_spacing + 9, 9, board_offset]) encoder();
    translate([encoder_spacing + 9, encoder_spacing + 9, board_offset]) encoder();
    translate([9, encoder_spacing + 9, board_offset]) encoder();
    
    translate([(board_spacing / 2) - 93 / 2 , (board_spacing / 2) - 93 / 2, -1]) cube(93);
            
    translate([58, board_spacing - 1 - 18, -1]) cube([33, 18, 20]);
    
    translate([board_spacing - 29, board_spacing + 10, board_offset + 12.5]) rotate([90, 0, 0]) cylinder(20, 17 / 2, 17 / 2);

    translate([38.5, board_spacing + 10, board_offset + 4.6]) rotate([90, 0, 0]) cylinder(20, 8 / 2, 8 / 2);
    
  translate([23.5, board_spacing + 10, board_offset + 2.5])  cube([10, 40, 6], true);

        
}

