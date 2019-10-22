W = 41.5;
H = 21.5;
T = 2;
L = 10;
R = 6;
BT = 3;

difference() {
    chamferCube(W + T + T, H + T + T, L + R);
    translate([T, T, L]) cube([W, H, L + R]);
    translate([T + BT, T + BT, T]) cube([W - BT * 2, H - BT * 2, L + R]);
}


module chamferCube(sizeX, sizeY, sizeZ, chamferHeight = 1.5, chamferX = [2, 2, 0, 0], chamferY = [2, 0, 0, 2], chamferZ = [1, 1, 1, 1]) {
    chamferCLength = sqrt(chamferHeight * chamferHeight * 2);
    difference() {
        cube([sizeX, sizeY, sizeZ]);
        for(x = [0 : 3]) {
            chamferSide1 = min(x, 1) - floor(x / 3); // 0 1 1 0
            chamferSide2 = floor(x / 2); // 0 0 1 1
            if(chamferX[x]) {
                translate([-0.1, chamferSide1 * sizeY, -chamferHeight + chamferSide2 * sizeZ])
                rotate([45, 0, 0])
                cube([sizeX + 0.2, chamferCLength, chamferCLength]);
            }
            if(chamferY[x]) {
                translate([-chamferHeight + chamferSide2 * sizeX, -0.1, chamferSide1 * sizeZ])
                rotate([0, 45, 0])
                cube([chamferCLength, sizeY + 0.2, chamferCLength]);
            }
            if(chamferZ[x]) {
                translate([chamferSide1 * sizeX, -chamferHeight + chamferSide2 * sizeY, -0.1])
                rotate([0, 0, 45])
                cube([chamferCLength, chamferCLength, sizeZ + 0.2]);
            }
        }
    }
}
