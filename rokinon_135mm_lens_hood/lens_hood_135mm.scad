$fa = 1;
$fs = 0.4;
id_bottom = 82.6;
id_top = id_bottom + 8;
radius_bottom = id_bottom/2;
radius_top = id_top/2;
hood_thickness = 2;
hood_length = 40;
ramp_height = 10;
flange_height = 1.6;
flange_thickness = 1.5;
flange_length = 52.5;
flange_degree_length = 80;
base_height = flange_height * 4;

module hood_mount() {
    difference() {
    cylinder(h=base_height, r=radius_bottom + hood_thickness);
    translate([0,0,-1])
        cylinder(h=hood_length+2, r=radius_bottom);
    }
    flange();
    translate([0,0,flange_height * 2])
      rotate([0,0,90])
        flange();
    
}

module hood_transition() {
        // open up to full hood width
    translate([0,0,base_height])
        difference() {
            cylinder(h=ramp_height, r1=radius_bottom + hood_thickness, r2=radius_top + hood_thickness);
            translate([0,0,-1])
                cylinder(h=ramp_height+2, r1=radius_bottom, r2=radius_top);
        }
}

module hood_body() {
    translate([0,0,base_height+ramp_height])
        difference() {
            cylinder(h=hood_length, r=radius_top + hood_thickness);
            translate([0,0,-1])
                cylinder(h=hood_length+2, r=radius_top);
        }
}

module flange() {
    rotate_extrude(angle=flange_degree_length)
        translate([radius_bottom - 1,0,0])
            square([flange_thickness, flange_height]);

    rotate_extrude(angle=flange_degree_length)
        translate([-1 * (radius_bottom + 0.5),0,0])
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
    
    for (lp = [base_height + ramp_height : baffle_height : base_height + ramp_height + hood_length - 1]) {
        translate([0, 0, lp]) 
            rotate_extrude(angle = 360) 
                translate(
                    [radius_top + 0.5, 
                    0, 
                    0]) 
                    polygon(points = baffle_shape);
    }
}
//flange();
hood_mount();
hood_transition();
hood_body();
baffles();