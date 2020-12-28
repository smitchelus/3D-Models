$fa = 1;
$fs = 0.4;
id_bottom = 82.6;
id_top = id_bottom + 10;
radius_bottom = id_bottom/2;
radius_top = id_top/2;
hood_thickness = 2;
hood_length = 15;
flange_height = 1.6;
flange_thickness = 1.5;
flange_length = 52.5;
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
    baffle_height = 2;
    radius_difference = radius_top - radius_bottom;
    echo(radius_difference=radius_difference);
    baffle_shape = [
        [0, 0], 
        [-baffle_height, baffle_height], 
        [-baffle_height - hood_thickness, baffle_height], 
        [-hood_thickness, 0]
    ];
    
    for (lp = [base_height : baffle_height : hood_length+1]) {
        echo("baffle translate: ", radius_bottom + (radius_difference * lp / hood_length));
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