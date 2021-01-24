$fa = 1;
$fs = 0.4;

//NEMA14 Specs
// knob = 22 dia
// holes 18mm off center
difference() {
  union() {
    import("3_Angled_Motor_Base_EAF.stl");
    translate([0,12,0])
      cylinder(r=13, h=5);
    // raise the motor to give space for the shaft
    translate([0,10,-10])
      cylinder(r=15, h=10);

  }

  translate([0,10,-11])
    cylinder(r=11.5, h=17);
  translate([0,10,0]) {
    rotate(45)
      translate([0,-18,0])
        cylinder(r=3.2/2, h=7);
    rotate(45+90)
      translate([0,18,0])
        cylinder(r=3.2/2, h=7);
    rotate(-45)
      translate([0,18,0])
        cylinder(r=3.2/2, h=7);
    rotate(-(90+45))
      translate([0,-18,0])
        cylinder(r=3.2/2, h=7);
  }
        
  }
  
        
