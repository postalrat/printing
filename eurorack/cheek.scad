// https://intellijel.com/support/1u-technical-specifications/

HP = 5.08;
4U = 128.5;
1U = 39.65;

Gh = 9.8;
    

module rail_stencil(L) {
    Wr = 16.5;
    Hr = 13.5;
    Lr = L * HP;
    Tr = 2.5;

    translate([0, -Wr / 2, 0]) {
        difference() {
            cube([Lr, Wr, Hr]);
            
            translate([-1, Tr, -1])
            cube([Lr + 2, Wr - 2 * Tr, Hr - Tr + 1]);
        }
    }

}

//rail_stencil(48);


module cheek() {
    width = 312;
    radius = 19;
    height = 18;
    
    difference() {
        hull() {
            translate([radius, 0, 0])
            cylinder(height, radius, radius);
            
            translate([width - radius, 0, 0])
            cylinder(height, radius, radius);
            
            cube([width, 10, height]);
        }
        
        translate([-2, -2, -height])
        cube([width + 4, 40, height * 3]);
        
        Rp = 24;
        
        translate([Rp, -15, height - 2]) {
            rotate([180, 0, 90])
            rail_stencil(8);
            
            translate([0, 6.5, -height]) {
                cylinder(height * 2, 1.9, 1.9, $fn = 9);
                
                translate([0, 0, height - 1.5])
                cylinder(height * 2, 3.3, 3.3);
            }

        }
  

        translate([Rp + 4U + Gh - 6, -15, height - 2]) {
                    
        rotate([180, 0, 90])
        rail_stencil(8);
            
                    translate([0, 6.5, -height]) {
                cylinder(height * 2, 1.9, 1.9, $fn = 9);
                
                translate([0, 0, height - 1.5])
                cylinder(height * 2, 3.3, 3.3);
            }    
        }

        
        translate([Rp + (4U + Gh - 6) * 2, -15, height - 2]) {
                    rotate([180, 0, 90])
        rail_stencil(8);
                        translate([0, 6.5, -height]) {
                cylinder(height * 2, 1.9, 1.9, $fn = 9);
                
                translate([0, 0, height - 1.5])
                cylinder(height * 2, 3.3, 3.3);
            }
        }
        
        rotate([90, 0, 0])
        translate([89, 4, 0]) {
                    cylinder(height * 2, 1.9, 1.9, $fn = 9);
            
            translate([0, 0, -(height * 2) + 10])
            cylinder(height * 2, 3.3, 3.3, $fn = 6);
        }

        rotate([90, 0, 0])
        translate([313 - 93, 4, 0]) {
                    cylinder(height * 2, 1.9, 1.9, $fn = 9);
            
            translate([0, 0, -(height * 2) + 10])
            cylinder(height * 2, 3.3, 3.3, $fn = 6);
        }

    }


}



module rail_core(L) {
    Wc = 12.6;
    Hc = 10.5;
    Lc = L * HP;
    Dh = 50;
    Rh = 1.65;
    Go = 1.4;
    R = 1.65;
    
    difference() {
        union() {
            cube([Lc, Wc, Hc]);
            
            translate([0, Wc / 2 - (Gh - 7) / 2, 0])
            cube([Lc, Gh - 7, Hc + 2]);
            
        }
        
        for (i = [HP / 2:HP:Lc + HP]) {
            translate([i, Go, Hc - 6.999])
            cylinder(7, Rh-.15, R, $fn = 10);
            
            translate([i, Go + Gh, Hc - 6.999])
            cylinder(7, Rh-.15, R, $fn = 10);
        }
    }

}

rail_core(39.8);

//cheek();
