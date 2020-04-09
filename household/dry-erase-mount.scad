screw_radius = 2.5;
hole_radius = 4.5;
height = 11;
flange_radius = 10;
flange_thickness = 3;

difference() {
    union() {
        cylinder(height, hole_radius, hole_radius);
        cylinder(flange_thickness, flange_radius, flange_radius);
        
        translate([2 + flange_radius * 2, 0, 0])
        cylinder(flange_thickness, flange_radius, flange_radius);
    }
    
    translate([0, 0, -1])
    cylinder(height + 2, screw_radius, screw_radius, $fn=12);
    
        translate([2 + flange_radius * 2, 0, -1])
    cylinder(height, hole_radius + .4, hole_radius + .4);
    
    translate([0, 0, -1])
    cylinder(4, screw_radius + 3.2, screw_radius);
}
