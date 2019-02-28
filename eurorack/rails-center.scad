U = 5.08;
W = 12*4*U;
H = 7;
T = 16;
O = 3.5;
R = 1.65;

difference() {
    cube([W, H, T]);
    
    for (i = [U/2:U:W]) {
        translate([i, O, -.01])
        cylinder(7, R, R-.2, $fn = 10);
    }
    
    for (i = [U * 2:U*4:W]) {
        translate([i, 10, 11.5])
        rotate([90, 0, 0])
        cylinder(20, 1.8, 1.8, $fn = 10);
    }
}




