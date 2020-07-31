U = 5.08;
H = 128.5;
W = 10.5*U;
R = 1.65;
Depth = 50;
P = 2.3;
SW = U / 2;

module vesa(space = 75, h = 100) {
  r = space / 2;

  translate([r, r, 0])
  cylinder(h, 3, 3);

  translate([-r, r, 0])
  cylinder(h, 3, 3);

  translate([r, -r, 0])
  cylinder(h, 3, 3);

  translate([-r, -r, 0])
  cylinder(h, 3, 3);
}

module box1() {
  difference() {
    union() {
      rotate([90, 0, 90])
      hull() {
        translate([0, 0, 0])
        cylinder(W, 4, 4);

        translate([2, Depth - 1, 0])
        cylinder(W, 2, 2);

        translate([H + 7 - 2, Depth - 1, 0])
        cylinder(W, 2, 2);

        translate([H + 7, 0, 0])
        cylinder(W, 4, 4);
      }
    }

    translate([-1, 3.5, Depth - 1.5])
    cube([W + 2, H, Depth - 1.5]);

    // translate([-1, 7, 6])
    // cube([W + 2, H - 7, Depth - 5]);

    union() {
      rotate([90, 0, 90])
      hull() {
        translate([6, 5, -1])
        cylinder(W + 2, 3, 3);

        translate([15, Depth + 10, -1])
        cylinder(W + 2, 3, 3);

        translate([H + 5 - 2 - 11, Depth + 10, -1])
        cylinder(W + 2, 3, 3);

        translate([H + 7 - 6, 5, -1])
        cylinder(W + 2, 3, 3);
      }
    }

    translate([SW, 3.5, 0])
    for (i = [U/2:U:W]) {
        translate([i, 3.5 + 1.3, Depth - 11])
        cylinder(100, 3, 3, $fn = 10);

        translate([i, H - 3.5 - 1.3, Depth - 11])
        cylinder(100, 3, 3, $fn = 10);
    }

    for ( i = [5 * U : 10 * U : W - U] ) {
      translate([i, -1, Depth - 13])
      rotate([270, 0, 0])
      cylinder(1000, 2, 2);
    }

    hull() {
      translate([-1, 6.2, 30])
      rotate([-7.2, 0, 0])
      cube([W + 2, 2, 19]);

      translate([-1, 127.27, 30])
      rotate([7.2, 0, 0])
      cube([W + 2, 2, 19]);
    }

    translate([0, (H + 7) / 2, -10])
    vesa(75);

    translate([W, (H + 7) / 2, -10])
    vesa(75);

    if (W > 100) {
      translate([W / 2, (H + 7) / 2, -10])
      vesa(75);
    }

  }

    if (SW > 0) {
      union() {
        rotate([90, 0, 90])
        hull() {
          translate([0, 0, 0])
          cylinder(SW, 4, 4);

          translate([2, Depth - 1, 0])
          cylinder(SW, 2, 2);

          translate([H + 7 - 2, Depth - 1, 0])
          cylinder(SW, 2, 2);

          translate([H + 7, 0, 0])
          cylinder(SW, 4, 4);
        }
      }
/*
      translate([W - SW, 0, 0])
      union() {
        rotate([90, 0, 90])
        hull() {
          translate([0, 0, 0])
          cylinder(SW, 4, 4);

          translate([2, Depth - 1, 0])
          cylinder(SW, 2, 2);

          translate([H + 7 - 2, Depth - 1, 0])
          cylinder(SW, 2, 2);

          translate([H + 7, 0, 0])
          cylinder(SW, 4, 4);
        }
      }
*/
    }
}



box1();

