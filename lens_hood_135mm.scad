$fa = 1;
$fs = 0.4;
id_bottom = 82.5;
id_top = id_bottom + 10;
radius_bottom = id_bottom/2;
radius_top = id_top/2;
hood_thickness = 2;
hood_length = 16;
flange_height = 1.6;
flange_thickness = 1.5;
flange_length = 52.5;

module hood_body() {
    difference() {
    cylinder(h=hood_length, r1=id_bottom/2 + hood_thickness, r2=id_top/2 + hood_thickness);
    translate([0,0,-1])
        cylinder(h=hood_length+2, r=id_bottom/2);
    }
}
module flange() {
    difference() {
        cylinder(h=flange_height, 
                    r=id_bottom/2+0.5);
        translate([0,0,-1])
            cylinder(h=flange_height+2, 
                        r=id_bottom/2+0.5-
                            flange_thickness);
        translate([0,id_bottom/2*-1-1,-1])
            cube([id_bottom-flange_length,
                id_bottom+4, flange_height+2]);
        mirror([1,0,0]) 
            translate([0,id_bottom/2*-1-1,-1])
                cube([id_bottom-flange_length, 
                    id_bottom+4, flange_height+2]);
    }
}

module baffles() {
    // Baffles
    baffle_height = 3;
    baffle_expansion = radius_top / radius_bottom;
    radius_difference = radius_top - radius_bottom;
    baffle_shape = [
        [0, 0], 
        [-baffle_height, baffle_height], 
        [-baffle_height - hood_thickness, baffle_height], 
        [-hood_thickness, 0]
    ];
    
    for (lp = [baffle_height : baffle_height : hood_length]) {
        translate([0, 0, lp]) 
            rotate_extrude(angle = 360) 
                translate(
                    [radius_bottom + hood_thickness + (radius_difference * lp / hood_length), 
                    0, 
                    0]) 
                    polygon(points = baffle_shape);
    }
}

hood_body();
flange();
translate([0,0,3])
  rotate([0,0,90])
    flange();
baffles();