$fa = 1;
$fs = 0.4;

holder=0;
short_bar=0;
extended_bar=1;

nema14_width=35;
nema14_depth=30;
bar_height=5;
bar_length=140;
bar_width=50;
bar_slot_length=nema14_width+30;
bar_extension=80;
screw_size=4;
m3_hole = 3.2;
sled_width=nema14_width+10;

module short_bar() {
  difference() {
    cube([bar_width,bar_length,bar_height]);
    // slot
    translate([nema14_depth/2,5,0]) {
      minkowski() {
        cube([0.1,bar_slot_length,bar_height]);
        cylinder(r=2,h=5);
      }
    }
    // screw holes
    translate([bar_width-10,bar_length-12,bar_height])
      rotate([180,0,0])
        M6_bolt();

    translate([bar_width-10,bar_length-31,bar_height])
      rotate([180,0,0])
        M6_bolt();
  }
}

module extended_bar() {
  extended_bar_length = bar_length + bar_extension;
  difference() {
    cube([bar_width,extended_bar_length,bar_height]);
    // slot
    translate([nema14_depth/2,5,0]) {
      minkowski() {
        cube([0.1,bar_slot_length,bar_height]);
        cylinder(r=2,h=5);
      }
    }
    // screw holes
    translate([bar_width-10,extended_bar_length-92,bar_height])
      rotate([180,0,0])
        M6_bolt();

    translate([bar_width-10,extended_bar_length-111,bar_height])
      rotate([180,0,0])
        M6_bolt();
  }
}

module M4_bolt() {
  cylinder(r=2.1,h=25);
  cylinder(r=4.2,h=2.5,$fn=6);
}

module M6_bolt() {
  cylinder(r=3.1,h=25);
  cylinder(r=6,h=2.5,$fn=6);
}

module triangle_support(){
  difference(){
      cube([20,20,2]);
      rotate([0,0,45]) cube([50,50,50]);
  }
}

module nema14_face() {
  difference() {
    cube([4,40,50]);
    // 26 apart
    translate([0,7,4])
      minkowski() {
        cube([4,1,40]);
        rotate([0,90,0])
          cylinder(r=1,h=4);
      }

    translate([0,33,4])
      minkowski() {
        cube([4,1,40]);
        rotate([0,90,0])
          cylinder(r=1,h=4);
      }

    translate([0,18,5])
      minkowski() {
        cube([4,4,40]);
        rotate([0,90,0])
          cylinder(r=2,h=4);
      }
  }
}

module tab() {
  difference() {
    cylinder(r=10, h=4);
    translate([0,-4,5])
      rotate([180,0,0])
        M4_bolt();
  }
}

module nema14_holder() {
  cube([30,40,4]);
  translate([15,0,0])
    tab();
  translate([15,40,0])
    rotate([0,0,180])
      tab();

  translate([0,0,3])
    nema14_face();

  // supports
  translate([nema14_depth-6,0,4])
    rotate([90,0,180])
      triangle_support();
  translate([nema14_depth-6,38,4])
    rotate([90,0,180])
      triangle_support();
}


if ( holder == 1 ) {
  rotate([0,0,180])
    translate([-30,-30,20])
      nema14_holder();
}

if ( short_bar == 1 ) {
  short_bar();
}

if ( extended_bar == 1 ) {
  extended_bar();
}