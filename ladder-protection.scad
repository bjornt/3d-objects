$fn = 64;

thickness = 1;
inner_length = 81;
inner_width = 40;
inner_height = 12;

support_radius = 3;
support_height = 6;
support_x_offset = 22;
support_y_offset = 39;

leg_width = 36;
leg_thickness = 16;
before_leg = 21;

round_radius = 1;

module ladder_protection() {
    difference () {
        union() {
            // Base plate
            cube([inner_width - round_radius,
                  inner_length + round_radius,
                  thickness]);
            // Side 1
            cube([inner_width - round_radius,
                  thickness,
                  inner_height + round_radius]);
            bottom_ledge_width = thickness + 5 - round_radius;
            translate([0, 0, inner_height]) {
                cube([inner_width - round_radius,
                      bottom_ledge_width,
                      thickness]);
            }
            // Side 2
            translate([0, inner_length, 0]) {
                cube([inner_width - round_radius,
                      thickness,
                      inner_height]);
            }
            translate([0, inner_length + thickness - bottom_ledge_width, inner_height]) {
                cube([inner_width - round_radius,
                      bottom_ledge_width,
                      thickness]);
            }

            // Edges
            translate([0 - thickness, 0, 0]) {
                cube([thickness, 15, inner_height + thickness]);
            }
            after_leg_cut = inner_length + thickness *2 - leg_width - before_leg;
            translate([0 - thickness, inner_length + thickness - after_leg_cut + 5 , 0]) {
                cube([thickness, after_leg_cut - 5, inner_height + thickness]);
            }
        }

        // Cut-out for leg
        translate([0, before_leg-round_radius, -1]) {
            cube([leg_thickness + round_radius, leg_width + round_radius, thickness + 2]);
        }
    }
}

union () {
    minkowski() {
        ladder_protection();
        sphere(r=round_radius);
    }
    translate([support_x_offset, support_y_offset, 0]) {
        cylinder(h=support_height+thickness, r=support_radius);
    }
}


