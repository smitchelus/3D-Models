$fa = 1;
$fs = 0.4;

screw_shaft=3.5;
screw_head=5;
screw_shaft_hole=screw_shaft+0.2;
screw_head_hole=screw_head+0.2;

module focuser_knob_mount() {
  translate([0,50,0]) {
    cylinder(r = 13, h = 12);
    mount_holes(size = screw_shaft_hole/2);
    mount_holes(size = screw_head_hole/2, z_offset=3);
  }        
}

module mount_holes(size, z_offset=0) {
    rotate(90) 
      translate([16.25,0,z_offset]) 
        cylinder(r = size, h = 12);
    rotate(90+120) 
      translate([16.25,0,z_offset]) 
        cylinder(r = size, h = 12);
    rotate(90+240) 
      translate([16.25,0,z_offset]) 
        cylinder(r = size, h = 12);
}

difference() {

  union() {
    import("1_Angled_Base_Bracket.stl");
    translate([0,50,0])
      cylinder(r = 20, h = 6);    
  }
  focuser_knob_mount();
  
  //trim things down for now
//  translate([-100,-100,7])
//    cube(200,200,50);
}

