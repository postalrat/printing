U = 5.08;
H = 128.5;
W = 48*U;
R = 1.65;
Depth = 50;


difference() {
    cube([W + 6, H * 2 + 6, Depth]);
    
    translate([3, 3, 3])
    cube([W, H * 2, Depth]);
}

translate([3, 3, 0])
difference() {
    cube([W, 7, Depth - 2]);
    
    for (i = [U/2:U:W]) {
        translate([i, 3.5, Depth - 2 - 6.999])
        cylinder(7, R-.15, R, $fn = 10);
    }
}

translate([3, 3 + H, Depth - 22])
difference() {
    cube([W, 7, 20]);
    
    for (i = [U/2:U:W]) {
        translate([i, 3.5, 20 - 6.99])
        cylinder(7, R-.15, R, $fn = 10);
    }
}

translate([3, 3 + H - 7, Depth - 22])
difference() {
    cube([W, 7, 20]);
    
    for (i = [U/2:U:W]) {
        translate([i, 3.5, 20 - 6.99])
        cylinder(7, R-.15, R, $fn = 10);
    }
}

translate([3, 3 + H * 2 - 7, 0])
difference() {
    cube([W, 7, Depth - 2]);
    
    for (i = [U/2:U:W]) {
        translate([i, 3.5, Depth - 2 - 6.999])
        cylinder(7, R-.15, R, $fn = 10);
    }
}
