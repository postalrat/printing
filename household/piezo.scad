piezo_diameter = 50.5;
rim_thickness = 2;
cavity_height = 2.5;
rim_height = 3;
cutout_diameter = 328;

module outside() {
  base_height = 4;
  h = cavity_height + rim_height + base_height;

  difference() {
    hull() {
      cylinder(h, r = piezo_diameter / 2 + rim_thickness, $fa  = 5);

      translate([0, piezo_diameter / 2 + rim_thickness + 2, 0])
      cylinder(h, r = 5);

      translate([0, -(piezo_diameter / 2 + rim_thickness + 2), 0])
      cylinder(h, r = 5);
    }
      
    translate([0, 0, -1])
    cylinder(rim_height + 1, r = piezo_diameter / 2);
      
    translate([0, 0, -1])
    cylinder(rim_height + cavity_height + 1, r = piezo_diameter / 2 - 1);
      
    
    translate([-500, 0, cutout_diameter / 2 + cavity_height + rim_height + 1])
    rotate([0, 90, 0])
    cylinder(1000, r = cutout_diameter / 2, $fa  = 3);

    translate([0, piezo_diameter / 2 + rim_thickness + 2, -1])
    cylinder(h + 2, r = 2);

    translate([0, -(piezo_diameter / 2 + rim_thickness + 2), -1])
    cylinder(h + 2, r = 2);

    translate([0, 0, -50])
    cylinder(100, r = 2.2);
  }
}

module inside() {
  cavity_height = cavity_height + 1;
  base_height = 2;
  h = cavity_height + rim_height + base_height;

  intersection() {
    difference() {
      hull() {
        cylinder(h, r = piezo_diameter / 2 + rim_thickness, $fa  = 5);

        translate([0, piezo_diameter / 2 + rim_thickness + 2, 0])
        cylinder(h, r = 5);

        translate([0, -(piezo_diameter / 2 + rim_thickness + 2), 0])
        cylinder(h, r = 5);
      }
        
      translate([0, 0, -1])
      cylinder(rim_height + 1 + 1.5, r = piezo_diameter / 2, $fa = 5);
        
      translate([0, 0, -1])
      cylinder(rim_height + cavity_height + 1, r = piezo_diameter / 2 - 1);


      translate([0, piezo_diameter / 2 + rim_thickness + 2, -1])
      cylinder(h + 2, r = 1.5);

      translate([0, -(piezo_diameter / 2 + rim_thickness + 2), -1])
      cylinder(h + 2, r = 1.5);

      translate([0, 0, base_height + cavity_height - 102.5])
      cube([100, 2, 100]);

      rotate([0, 86, 0])
      translate([-cutout_diameter / 2 - 5.5, 0, -500])
      cylinder(1000, r = (cutout_diameter - 6) / 2, $fa  = 3);

    }

    translate([-500, 0, (cutout_diameter - 6) / 2])
    rotate([0, 90, 0])
    cylinder(1000, r = (cutout_diameter - 6) / 2, $fa  = 3);
  }
}






outside();

//inside();



