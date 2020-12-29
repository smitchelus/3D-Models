$fa = 2;
$fs = 0.6;
id_bottom = 82.6;
id_top = id_bottom + 10;
radius_bottom = id_bottom/2;
radius_top = id_top/2;
hood_thickness = 2;
hood_length = 50;
flange_height = 1.6;
flange_thickness = 1.5;
flange_length = 52.5;
flange_degree_length = 80;
base_height = flange_height * 4;

module hood_base() {
    difference() {
    cylinder(h=base_height, r=id_bottom/2 + hood_thickness);
    translate([0,0,-1])
        cylinder(h=hood_length+2, r=id_bottom/2);
    }
    flange();
    translate([0,0,flange_height * 2])
      rotate([0,0,90])
        flange();

}

module hood_body() {
    translate([0,0,base_height])
    difference() {
    cylinder(h=hood_length, r1=id_bottom/2 + hood_thickness, r2=id_top/2 + hood_thickness);
    translate([0,0,-1])
        cylinder(h=hood_length+2, r1=id_bottom/2, r2=id_top/2);
    }
}
module flange() {
    rotate_extrude(angle=flange_degree_length)
        translate([radius_bottom - flange_thickness,0,0])
            square([flange_thickness, flange_height]);

    rotate_extrude(angle=flange_degree_length)
        translate([(-1 * radius_bottom),0,0])
            square([flange_thickness, flange_height]);
}

module baffles() {
    // Baffles
    baffle_height = 2;
    radius_difference = radius_top - radius_bottom;
    baffle_shape = [
        [0, 0], 
        [-baffle_height, baffle_height], 
        [-baffle_height - hood_thickness, baffle_height], 
        [-hood_thickness, 0]
    ];
    
    // Note the base_height + x starting point to leave room for the lens cap
    for (lp = [base_height + 2 : baffle_height : hood_length+1]) {
        translate([0, 0, lp]) 
            rotate_extrude(angle = 360) 
                translate(
                    [radius_bottom + (radius_difference * (lp-baffle_height) / hood_length), 
                    0, 
                    0]) 
                    polygon(points = baffle_shape);
    }
}

hood_base();
hood_body();
baffles();