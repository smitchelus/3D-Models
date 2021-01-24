$fa = 1;
$fs = 0.4;

//NEMA14 Specs
// knob = 22 dia
// holes 18mm off center
// M3 holes
// - head width 5.35 (5.5 enough?)
// - head height 3 
// - shaft 3
m3_hole = 3.3;
m3_head_width = 5.5;
m3_head_height = 3.2;
difference() {
  union() {
    import("3_Angled_Motor_Base_EAF.stl");
    translate([0,12,0])
      cylinder(r=13, h=5);
    // raise the motor to give space for the shaft
    translate([0,10,-10])
      cylinder(r=15, h=10);
  }

  nema14_hole();
  nema14_screw_holes();
  wipe_out_back_support();
}

module nema14_screw_holes() {
  translate([0,10,0]) {
    rotate(45)
      translate([0,-18,0]) {
        cylinder(r=m3_hole/2, h=7);
        translate([0,0,2])
          cylinder(r=m3_head_width/2, h=m3_head_height);
      }
    rotate(45+90)
      translate([0,18,0]) {
        cylinder(r=m3_hole/2, h=7);
        translate([0,0,2])
          cylinder(r=m3_head_width/2, h=m3_head_height);
      }
    rotate(-(90+45))
      translate([0,-18,0]) {
        cylinder(r=m3_hole/2, h=7);
        translate([0,0,2])
          cylinder(r=m3_head_width/2, h=m3_head_height);
      }
  }
        
}
  
module nema14_hole() {
  translate([0,10,-11])
    cylinder(r=11.5, h=17);
}

module wipe_out_back_support() {
  translate([0,-30,-26])
    cube(size = [80,20,40], center = true);
}

