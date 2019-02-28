U = 5.08;
H = 128.5;
D = 50;
W = 2;


difference() {

    cube([48 * U + 2 * W, H + 2 * W, D + W]);
  
    translate([W, W, W])
    cube([48 * U, H, D + W]);
    
    
    translate([-sqrt(8 * 8 * U * 2) - 2 * W, -1, 0])
    rotate([0, 45, 0])
    cube([8 * U, H + 2 * W + 2, 8 * U]);
}