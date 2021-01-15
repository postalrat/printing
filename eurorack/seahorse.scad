// https://intellijel.com/support/1u-technical-specifications/

HP = 5.08;
3U = 128.5;
1U = 39.65;

height = 330;
width = 20;
end_radius = 20;
depth = 2.5;

ho_x = 3;
ho_y = 5;

h1_x = 2;
h1_y = -1.5;

h2_x = -7;
h2_y = 76.5;

h3_x = -8;
h3_y = 160;

h4_x = -7;
h4_y = 243.5;

h5_x = 2;
h5_y = 320 + .5;

ho_margin = 3.5;



module side_inner_profile() {
  hull() {
    translate([end_radius, end_radius])
    circle(end_radius);

    translate([end_radius, height - end_radius])
    circle(end_radius);

    translate([ho_x + ho_margin, ho_y]) {
      translate([h2_x, h2_y])
      circle(2);

      translate([h3_x, h3_y])
      circle(2);

      translate([h4_x, h4_y])
      circle(2);
    }
  }
}

module side_inner_profile_with_cutout() {
  cutout_r = 4.5;

  difference() {
    side_inner_profile();

    translate([ho_x, ho_y, 0]) {
      translate([h1_x, h1_y])
      circle(cutout_r);

      translate([h2_x, h2_y])
      circle(cutout_r);

      translate([h3_x, h3_y])
      circle(cutout_r);

      translate([h4_x, h4_y])
      circle(cutout_r);

      translate([h5_x, h5_y])
      circle(cutout_r);
    }
  }
}

module chin() {
  tw = 24.5;
  shift = 5;
  lh = .7;

  difference() {
    union() {
      translate([0, shift, 9.5 - lh]) {
        difference() {
          linear_extrude(height = 5 + lh)
          hull() {
            square([424, tw - shift]);

            translate([45, tw - shift]) {
              translate([0, -2.5])
              circle(3);

              translate([83.5, 0])
              circle(3);

              translate([83.5 * 2, 0])
              circle(3);

              translate([83.5 * 3, 0])
              circle(3);

              translate([83.5 * 4, -2.5])
              circle(3);
            }
          }

          translate([45, tw - shift]) {
            translate([0, -2.5])
            cylinder(1000, 2, 2);

            translate([83.5, 0])
            cylinder(1000, 2, 2);

            translate([83.5 * 2, 0])
            cylinder(1000, 2, 2);

            translate([83.5 * 3, 0])
            cylinder(1000, 2, 2);

            translate([83.5 * 4, -2.5])
            cylinder(1000, 2, 2);
          }
        }
      }

      color("red")
      rail_core(424, true, false);
    }

    color("pink")
    translate([0, 12.6, 0])
    cube([424, max(tw - 17.5, 3), 12]);
  }

  // cube([14.5, 14.5, 14.5]);
}

module solid_cheek() {
  hole_r = 2;

  difference() {
    union() {
      linear_extrude(height = 20)
        side_inner_profile_with_cutout();

      linear_extrude(height = 5)
        offset(r = 7)
          side_inner_profile();
    }
      
    translate([width, -100, -1])
    cube([end_radius * 2, 1000, 1000]);

    translate([0, 0, -1])
    linear_extrude(height = 1000)
    translate([ho_x, ho_y, 0]) {
      translate([h1_x , h1_y])
      circle(hole_r);

      translate([h2_x, h2_y])
      circle(hole_r);

      translate([h3_x, h3_y])
      circle(hole_r);

      translate([h4_x, h4_y])
      circle(hole_r);

      translate([h5_x, h5_y])
      circle(hole_r);
    }
  }

}



module rail_stencil(Lr, Wr = 16.5) {
  Hr = 13.5;
  Tr = 2.5;

  difference() {
    cube([Lr, Wr, Hr]);
    
    translate([-1, Tr, -1])
    cube([Lr + 2, Wr - 2 * Tr, Hr - Tr + 1]);
  }
}

module rails() {
  Gh = 3.8;

  rail_stencil(8 * HP);

  translate([-5, 1U + Gh, 0])
  rail_stencil(8 * HP);


  translate([-5, 3U + Gh, 0])
  rail_stencil(8 * HP);

  translate([-5, 3U + Gh + 1U + Gh, 0])
  rail_stencil(8 * HP);


  translate([-5, 3U + Gh + 3U + Gh, 0])
  rail_stencil(8 * HP);

  translate([0, 3U + Gh + 3U + Gh + 1U + Gh, 0])
  rail_stencil(8 * HP);
}

module rail_core(Lc, B = true, T = true) {
    Wc = 12.6;
    Hc = 10.5;
    Dh = 50;
    Rh = 1.65;
    Go = 1.4;
    R = 1.65;
    Gh = 9.8;

    difference() {
        union() {
            cube([Lc, Wc, Hc]);
            
            translate([0, Wc / 2 - (Gh - 7) / 2, 0])
            cube([Lc, Gh - 7, Hc + 2]);
            
        }
        
        for (i = [HP / 2:HP:Lc + HP]) {
            if (B) {
              translate([i, Go, Hc - 6.999])
              cylinder(7, Rh-.15, R, $fn = 10);
            }

            if (T) {
              translate([i, Go + Gh, Hc - 6.999])
              cylinder(7, Rh-.15, R, $fn = 10);
            }
        }
    }
}


// difference() {
//   solid_cheek();

//   translate([10, 2.4, 3])
//   rails();
// }


// rail_core(41 * HP);

chin();
