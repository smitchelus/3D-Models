$fa = 4;
$fs = 0.4;

render_ring=1;
render_dovetail=1;

dovetail_length=110;
dovetail_width=31;
dovetail_height=10;
dovetail_angle=70;

finder_ring_od=74;
finder_ring_id=finder_ring_od - 12;
finder_ring_height=15;

module finder_ring() {
  difference() {
    union() {
      cylinder(r=finder_ring_od/2, h=finder_ring_height);
      translate([-10,-(finder_ring_od/2)-3,0])
        cube([20,5,finder_ring_height+5]);
    }
    cylinder(r=finder_ring_id/2, h=finder_ring_height);
    // screw holes
    translate([0,13,finder_ring_height/2])
      rotate([-90,-90,0])
        M4_hex_bolt_and_hole();
    rotate([0,0,120])
      translate([0,13,finder_ring_height/2])
        rotate([-90,-90,0])
          M4_hex_bolt_and_hole();
    rotate([0,0,-120])
      translate([0,13,finder_ring_height/2])
        rotate([-90,-90,0])
          M4_hex_bolt_and_hole();
    translate([0,(-finder_ring_id/2)+1,finder_ring_height/2])
    rotate([90,0,0])
      M6_bolt();
  }
}


module dovetail() {
  difference() {
    union() {
      cube([dovetail_length,dovetail_width,dovetail_height]);
      translate([106,8,-6])
        cube([4,14,6]);
    }
  rotate([dovetail_angle,0,0])
    cube([dovetail_length, dovetail_height+dovetail_height, dovetail_height+dovetail_height]);
  
  translate([0,dovetail_width,0])
    rotate([90-dovetail_angle,0,0])
      cube([dovetail_length, dovetail_height+dovetail_height, dovetail_height+dovetail_height]);

  translate([25,dovetail_width/2,0])
    M6_flat_head_bolt();
  translate([75,dovetail_width/2,0])
    M6_flat_head_bolt();
  }
}

module M4_flat_head_bolt() {
  cylinder(r=2.1,h=25);
  cylinder(r1=5,r2=2.5,h=2.6);
}

module M4_hex_bolt_and_hole(){
 rv2=7.3;
 hm = 3.4;
 union(){  

   translate([0,0,-0.5 ]) cylinder(h=4.7, r=7.3/2, center=false, $fn=360);
   cylinder(h=35, r=4.2/2, center=false, $fn=360);
   translate([0,0,20.5 ])    union(){  
        cylinder(h=hm, r=rv2/1.732, $fn=6, center=true);
        translate([7.5,0,0 ])cube([15,rv2,hm], center=true);
    }
  }
}

module M6_flat_head_bolt() {
  cylinder(r=3.1,h=25);
  cylinder(r1=5.75,r2=3.2,h=6);
}

module M6_bolt() {
  cylinder(r=3.1,h=25);
  cylinder(r=5.75,h=6,$fn=6);
}

if (render_dovetail == 1) {
  difference() {
  translate([0,40,dovetail_length])
    rotate([0,90,0])
      dovetail();
  }
}

if (render_ring == 1) {
  finder_ring();
}
