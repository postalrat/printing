

module lid() {
  width = 78.7;
  height = 86.7;
  corner_radius = 12;
  thickness = 1.6;
  hole_sx = 61.7;
  hole_sy = 66.5;
  hole_ox = 9;
  hole_oy = 10;
  hole_radius = 1.6;


  difference() {
    hull() {
      cube([width, 1, thickness]);

      translate([corner_radius, height - corner_radius, 0])
      cylinder(thickness, r = corner_radius);

      translate([width - corner_radius, height - corner_radius, 0])
      cylinder(thickness, r = corner_radius);
    }


    translate([hole_ox, hole_oy, -1])
    cylinder(thickness + 2, r = hole_radius);
    translate([hole_ox + hole_sx, hole_oy, -1])
    cylinder(thickness + 2, r = hole_radius);
    translate([hole_ox, hole_oy + hole_sy, -1])
    cylinder(thickness + 2, r = hole_radius);
    translate([hole_ox + hole_sx, hole_oy + hole_sy, -1])
    cylinder(thickness + 2, r = hole_radius);


    for (i = [0:3:20]) {
      translate([width / 2 + i - 13, height - 20, -1])
      cube([2, 12, thickness + 2]);
    }

    translate([width / 2 - 13, height - 20, 1.5])
    cube([20, 12, thickness]);

    translate([70, 55, 1])
    rotate([0, 0, 180])
    linear_extrude(height = 100) {
        scale(.6)
        import("gsa.svg");
    }
  }


}




logo(10);

lid();
