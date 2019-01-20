face_height = 4;
wall_height = 13;
wall_thickness = 2.5;
board_width = 121;
board_height = 61;
button_radius = 1;
button_size = 7.9;


difference() {
    hull() {
        cylinder(wall_height, wall_thickness, wall_thickness, $fn = 16);
        translate([board_width, 0, 0]) cylinder(wall_height, wall_thickness, wall_thickness, $fn = 16);
        translate([board_width, board_height, 0]) cylinder(wall_height, wall_thickness, wall_thickness, $fn = 16);
        translate([0, board_height, 0]) cylinder(wall_height, wall_thickness, wall_thickness, $fn = 16);
    }
    
    translate([0, 0, face_height]) cube([board_width, board_height, wall_height]);
    
    button_radius2 = button_radius + 1;
    
    for(i = [0:7])
    for(j = [0:3])
    translate([button_radius, button_radius, -1]) {
        x = i * 15 + (board_width - 120) / 2 + 2.5;
        y = j * 15 + (board_height - 60) / 2 + 2.5;
        
        hull() {
            translate([x, y, 0]) cylinder(10, button_radius, button_radius, $fn = 16);
            translate([x + button_size, y, 0]) cylinder(10, button_radius, button_radius, $fn = 16);
            translate([x, y + button_size, 0]) cylinder(10, button_radius, button_radius, $fn = 16);
            translate([x + button_size, y + button_size, 0]) cylinder(10, button_radius, button_radius, $fn = 16);
        }
        
        hull() {
            translate([x, y, face_height + 1 - 1.3]) cylinder(2, button_radius2, button_radius2, $fn = 16);
            translate([x + button_size, y, face_height + 1 - 1.3]) cylinder(2, button_radius2, button_radius2, $fn = 16);
            translate([x, y + button_size, face_height + 1 - 1.3]) cylinder(2, button_radius2, button_radius2, $fn = 16);
            translate([x + button_size, y + button_size, face_height + 1 - 1.3]) cylinder(2, button_radius2, button_radius2, $fn = 16);
        }
        
    }

    translate([(board_width - 42) / 2, -9.99, face_height + 3.5 / 2]) cube([42, 10, 16.5]);
}

bottom_offset = wall_height - face_height - 1 - 3;
wti = wall_thickness - 0.0;

translate([0, board_height + 10, 0])
union() {
    
    hull() {
        translate([0, 0, 0]) cylinder(wall_thickness, wall_thickness, wall_thickness, $fn = 16);
        translate([board_width, 0, 0]) cylinder(wall_thickness, wall_thickness, wall_thickness, $fn = 16);
        translate([board_width, board_height, 0]) cylinder(wall_thickness, wall_thickness, wall_thickness, $fn = 16);
        translate([0, board_height, 0]) cylinder(wall_thickness, wall_thickness, wall_thickness, $fn = 16);
    }
    
    translate([0, 0, wall_thickness]) {
        rwall(wall_thickness, wall_thickness, wall_thickness, board_height - wall_thickness, bottom_offset, wti);
        rwall(board_width - wall_thickness, board_height - wall_thickness, wall_thickness, board_height - wall_thickness, bottom_offset, wti);
        rwall(board_width - wall_thickness, wall_thickness, board_width - wall_thickness, board_height - wall_thickness, bottom_offset, wti);
        rwall(wall_thickness, wall_thickness, wall_thickness + 30, wall_thickness, bottom_offset, wti);
        rwall(board_width - wall_thickness - 30, wall_thickness, board_width - wall_thickness, wall_thickness, bottom_offset, wti);
    }
    
}


module rwall(x, y, x2, y2, height, thick) {
    hull() {
        translate([x, y, 0]) cylinder(height, thick, thick, $fn = 16);
        translate([x2, y2, 0]) cylinder(height, thick, thick, $fn = 16);
    }
}
