// dia - 26
$fa = 1;
$fs = 0.4;

module focuser_knob() {
  difference() {
    cylinder(r = 20, h = 1);
    cylinder(r = 13, h = 2);
    rotate(0) 
      translate([16.25,0,0]) 
        cylinder(r = 2, h = 2);
    rotate(120) 
      translate([16.25,0,0]) 
        cylinder(r = 2, h = 2);
    rotate(240) 
      translate([16.25,0,0]) 
        cylinder(r = 2, h = 2);
  }
  //translate([0,0,0])
  //  cylinder(r = 16, h = 2, $fn = 3);
}

module nema14() {
  difference() {
    translate([-17.5,-5,0])
      cube([35,35,2]);
    
    translate([0,12,-1])
      cylinder(r=11.5, h=7);
    translate([0,12,0]) {
      rotate(45)
        translate([0,-18,0])
          cylinder(r=3/2, h=7);
      rotate(45+90)
        translate([0,18,0])
          cylinder(r=3/2, h=7);
      rotate(-45)
        translate([0,18,0])
          cylinder(r=3/2, h=7);
      rotate(-(90+45))
        translate([0,-18,0])
          cylinder(r=3/2, h=7);
    }
  }
}

nema14();