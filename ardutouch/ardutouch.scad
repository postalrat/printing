
width = 100;
height = 81;
depth = 30;
wall_thickness = 2;
lip_height = 1.5;

battery_width = 48.5;
battery_height = 70;
battery_depth = 21;

speaker_depth = 19;
speaker_radius = 20;

speaker_height = depth - lip_height - speaker_depth + wall_thickness - 2;

speaker_x = 28;
speaker_y = 40;

difference() {
    union() {
        translate([-wall_thickness, -wall_thickness, 0])
        difference() {
            cube([width + wall_thickness * 2, height + wall_thickness * 2, depth + wall_thickness]);
            translate([wall_thickness, wall_thickness, depth + wall_thickness - lip_height]) cube([width, height, depth + 1]);
            translate([wall_thickness + 1, wall_thickness + 1, wall_thickness]) cube([width - 2, height - 2, depth + 1]);
        } 

        translate([96, 16, battery_depth + wall_thickness]) cylinder(4, 8.5 / 2, 8.5 / 2);
        translate([96, 74.3, battery_depth + wall_thickness]) cylinder(4, 8.5 / 2, 8.5 / 2);
        translate([7.3, 16,  wall_thickness]) cylinder(4, 8.5 / 2, 8.5 / 2);
        translate([3, 74.3, wall_thickness]) cylinder(4, 8.5 / 2, 8.5 / 2);
        
        translate([width - battery_width - wall_thickness * 2, height - battery_height - 4, 0])
        cube([battery_width + wall_thickness * 2, battery_height + wall_thickness * 2, battery_depth + wall_thickness]);

        intersection() {
            union() {
                hull() {
                    translate([speaker_x, speaker_y, 0 ])
                    cylinder(speaker_height, speaker_radius + 1, speaker_radius + 1);
                    
                    translate([speaker_x - (speaker_radius + 1), speaker_y + speaker_radius + 1 , 0])
                    cube([(speaker_radius + 1) * 2, .1, speaker_height + 2]);
                }

                hull() {
                    translate([speaker_x - (speaker_radius + 1), speaker_y + speaker_radius + 1 , 0])
                    cube([(speaker_radius + 1) * 2, .1, speaker_height + 2]);

                    translate([speaker_x - (speaker_radius + 1), 100, 0 ])
                    cube([(speaker_radius + 1) * 2, .1, 45]);
                }
            }
            
            cube([width + wall_thickness, height + wall_thickness, depth + wall_thickness]);
        }
        

        
        translate([speaker_x, speaker_y, speaker_height ])
        cylinder(6, speaker_radius + 1, speaker_radius + 1);
    }
    
    translate([96, 16, battery_depth + wall_thickness / 2]) cylinder(10, 5 / 2, 5 / 2);
    translate([96, 74.3, battery_depth + wall_thickness / 2]) cylinder(10, 5 / 2, 5 / 2);
    translate([7.3, 16, wall_thickness]) cylinder(10, 5 / 2, 5 / 2);
    translate([3, 74.3, wall_thickness]) cylinder(depth, 5 / 2, 5 / 2);

    translate([width - battery_width - wall_thickness / 2, height - battery_height - wall_thickness / 2, - 1])
    cube([battery_width, battery_height, battery_depth + 1]);



    union() {
        hull() {
            translate([speaker_x, speaker_y, wall_thickness ])
            cylinder(speaker_height - 4, speaker_radius - 2, speaker_radius - 2);
            
            translate([speaker_x - (speaker_radius - 2), speaker_y + speaker_radius - 1 , wall_thickness])
            cube([(speaker_radius - 2) * 2, .1, speaker_height - 4]);
        }

        hull() {
            translate([speaker_x - (speaker_radius - 2), speaker_y + speaker_radius - 1 , wall_thickness])
            cube([(speaker_radius - 2) * 2, .1, speaker_height - 4]);
            
            translate([speaker_x - (speaker_radius - 2), 100, 20 ])
            cube([(speaker_radius - 2) * 2, .1, 20]);
        }
    }

    translate([speaker_x, speaker_y, speaker_height + 1 ])
    cylinder(speaker_height, speaker_radius, speaker_radius);
     
    translate([speaker_x, speaker_y, speaker_height - 2.01 ])
    cylinder(speaker_height, speaker_radius - 2, speaker_radius - 2);
    
    translate([width - battery_width - wall_thickness / 2, height - battery_height - 6, (battery_depth - 6) / 2])
    cube(6);
}


    translate([speaker_x, speaker_y + speaker_radius - 2 , 0])
    cube([1, 1.1, speaker_height - 2]);

    translate([speaker_x - 10, speaker_y + speaker_radius - 4.7 , 0])
    cube([1, 3.8, speaker_height - 2]);

    translate([speaker_x + 10, speaker_y + speaker_radius - 5.5 , 0])
    cube([1, 4.7, speaker_height - 2]);


translate([width - .2 - wall_thickness / 2, height - battery_height - 2, 0])
cube([.2, battery_height, 3]);

translate([width -  battery_width - wall_thickness / 2, height - battery_height - 2, 0])
cube([.2, battery_height, 3]);





/*
color([1,0,0])
translate([25, 35, speaker_height ])
cylinder(speaker_depth, speaker_radius, speaker_radius);   
*/




