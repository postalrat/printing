difference() {

   translate([0,0, 0.00001])
    cube([14.5, 29.5, 2.7]);
    
   translate([14.5 / 2, 1.25 + 2.25, 0])
        cylinder(3, 2.25, 2.25, $fn = 12);
    
   translate([14.5 / 2 - 2.25, 6.5, 0])
        cube([4.5, 4.5, 2.9]);
    
   translate([14.5 / 2 - 2.25 - 4.6 / 2, 6.5, 0])
        cube([4.5 + 4.6, 4.5, 1.3]);
    
   translate([3.1, 11, 0])
        cube([9.25, 9.5, 1.65]);
 
    translate([3.75, 20.4, 0])
        cube([8.8, 8.5, 1.65]);
    
    translate([1, 23, 0])
        cube([2.8, 3.5, 1.65]);
        
    translate([7.8, 24, 0])
        cube([2.1, 10, 1]);
}
