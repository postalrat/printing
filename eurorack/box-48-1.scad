U = 5.08;
H = 128.5;
W = 20*U;
R = 1.65;
Depth = 50;
P = 2.3;


module box1() {

  difference() {
    union() {
      difference() {
          cube([W + 6, H + 6, Depth]);
          
          translate([3, 3, 3])
          cube([W, H, Depth]);
      }

      translate([3, 3 + H - 7, 0])
      difference() {
          translate([0, P, 0])
          cube([W, 7 - P, Depth - 2]);
          
          for (i = [U/2:U:W]) {
              translate([i, 3.5, Depth - 2 - 6.999])
              cylinder(7, R-.15, R, $fn = 10);
          }
      }

      translate([3, 3, 0])
      difference() {
          cube([W, 7- P, Depth - 2]);
          
          for (i = [U/2:U:W]) {
              translate([i, 3.5, Depth - 2 - 6.999])
              cylinder(7, R-.15, R, $fn = 10);
          }
      }
    }

    for ( i = [23 : 60 : W] ) {
      translate([i, -1, Depth - 13])
      rotate([270, 0, 0])
      cylinder(1000, 2, 2);
    }

  
  }


}


box1();

