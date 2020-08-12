InnerDiameter = 23;
OuterDiameter = 51;
LipHeight = 5;
LipDiameter = OuterDiameter + 5;
Height = 40;

difference() {
  union() {
    cylinder(LipHeight, LipDiameter / 2, LipDiameter / 2);
    cylinder(Height + LipHeight, OuterDiameter / 2, OuterDiameter / 2);
  }
  cylinder(Height + LipHeight, InnerDiameter / 2, InnerDiameter / 2);
}
