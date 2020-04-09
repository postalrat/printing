
module leg(h, d) {
    
    difference() {
        cylinder(h, 35 / 2, 35 / 2);
        translate([0, 0, d])
        cylinder(h, 22.5 / 2, 22.5 / 2);
    }
}

translate([0, 0, 0])
leg(40, 10);

translate([40, 0, 0])
leg(40, 10);

translate([0, 40, 0])
leg(60, 10 + 23);

translate([40, 40, 0])
leg(60, 10 + 23);
