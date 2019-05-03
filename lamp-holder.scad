$fn=256;

main_radius = 8;
height = 190;
bottom_width = 6;
bottom_length = 35;
bottom_thickness = 5;
step_size = 30;
top_thickness = 5;
top_radius = 30;

bottom_y_base = height+top_thickness-bottom_thickness;

translate([-plate_length/2, 0, 0]) {
    plate();
}
cylinder(h=height+top_thickness, r=main_radius);
translate([-bottom_length/2+bottom_width/2, 0, bottom_y_base]) {
    cylinder(h=bottom_thickness, d=bottom_width);
}
translate([bottom_length/2-bottom_width/2, 0, bottom_y_base]) {
    cylinder(h=bottom_thickness, d=bottom_width);
}

translate([-bottom_length/2+bottom_width/2, -bottom_width/2, bottom_y_base] ) {
    cube([bottom_length-bottom_width, bottom_width, bottom_thickness]);
}


for(i=[height-step_size:-step_size:bottom_thickness+step_size/2]) {
    translate([0, -bottom_length/2+bottom_width/2, i]) {
        cylinder(h=bottom_thickness, d=bottom_width);
    }
    translate([0, bottom_length/2-bottom_width/2, i]) {
        cylinder(h=bottom_thickness, d=bottom_width);
    }

    translate([-bottom_width/2, -bottom_length/2+bottom_width/2, i] ) {
        cube([bottom_width, bottom_length-bottom_width, bottom_thickness]);
    }
}

plate_thickness = 4;
plate_roundness = 3;
plate_length = bottom_length + 10;
plate_width = bottom_length + 2;
plate_addition = 1;

translate([top_radius+20, 0, 0]) {
    difference() {
        plate();

    union () {
    translate([plate_length/2, 0, -plate_addition]) {
        hull() {
            translate([-bottom_length/2-plate_addition+bottom_width/2, 0, 0]) {
                cylinder(h=plate_thickness+plate_addition*2, d=bottom_width+plate_addition*2);
            }
            translate([bottom_length/2+plate_addition-bottom_width/2, 0, 0]) {
                cylinder(h=plate_thickness+plate_addition*2, d=bottom_width+plate_addition*2);
            }
        }
        cylinder(h=plate_thickness+plate_addition*2, r=main_radius+plate_addition);

    }
    }
    }
}



module plate() {
    hull() {
        translate([plate_roundness, plate_width/2-plate_roundness, 0]) {
            cylinder(h=plate_thickness, r=plate_roundness);
        }
        translate([plate_roundness, -plate_width/2+plate_roundness, 0]) {
            cylinder(h=plate_thickness, r=plate_roundness);
        }
        translate([plate_length-plate_roundness, plate_width/2-plate_roundness, 0]) {
            cylinder(h=plate_thickness, r=plate_roundness);
        }
        translate([plate_length-plate_roundness, -plate_width/2+plate_roundness, 0]) {
            cylinder(h=plate_thickness, r=plate_roundness);
        }
    }
}

module flag_part() {

  hull() {
    translate([radius, radius, radius]) {
      sphere(r=radius);
    }

    translate([radius, width-radius, radius]) {
      sphere(r=radius);
    }

    translate([radius, width-radius, height-radius]) {
      sphere(r=radius);
    }

    translate([radius, radius, height-radius]) {
      sphere(r=radius);
    }

    translate([length-radius, radius, radius]) {
      sphere(r=radius);
    }

    translate([length-radius, width-radius, radius]) {
      sphere(r=radius);
    }

    translate([length-radius, width-radius, height-radius]) {
      sphere(r=radius);
    }

    translate([length-radius, radius, height-radius]) {
      sphere(r=radius);
    }
  }
}

