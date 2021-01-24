include <Pulley_T-MXL-XL-HTD-GT2_N-tooth.scad>;

hole_size = 3.1;
hole_z_offset = 3;

difference() {
  generate_pulley();
  grub_screw_holes();
}

module grub_screw_holes() {
  rotate(90) 
    translate([12,0,hole_z_offset]) 
      rotate(a=[0,90,0])
        cylinder(r = hole_size/2, h = 6, $fn = 90);
  rotate(90+120) 
    translate([12,0,hole_z_offset]) 
      rotate(a=[0,90,0])
        cylinder(r = hole_size/2, h = 6, $fn = 90);
  rotate(90+120+120) 
    translate([12,0,hole_z_offset]) 
      rotate(a=[0,90,0])
        cylinder(r = hole_size/2, h = 6, $fn = 90);
  
}