$fn=256;

main_radius = 8;
height = 190;
bottom_width = 6;
bottom_length = 35;
bottom_thickness = 5;
step_size = 30;
top_thickness = 5;
top_radius = 30;
top_cone_height = 6;

lamp_support_height = (bottom_length/2-main_radius)*1.20;


bottom_y_base = height+top_thickness-bottom_thickness;

plate_thickness = top_cone_height;
plate_roundness = 3;
plate_length = bottom_length + 10;
plate_width = bottom_length + 2;
plate_addition = 1;

translate([top_radius+20, 0, 0]) {
    difference() {
        plate();
        translate([plate_length/2, 0, 0]) {
            top_cone(0.1);
        }
    }
}

cylinder(h=height, r=main_radius);
for(i=[0:step_size:height-step_size]) {
    translate([0, 0, i]) {
        lamp_support();
    }
}
translate([0, 0, height]) {
    top_cone();
}


module top_cone(padding=0) {
    translate([0, 0, -padding]) {
        cylinder(h=top_cone_height+padding*2, r1=main_radius+padding, r2=main_radius*1.4+padding);
    }
}


module lamp_support() {
    hull() {
        translate([-main_radius+bottom_width/2, 0, 0]) {
            cylinder(h=lamp_support_height, d=bottom_width);
        }
        translate([main_radius-bottom_width/2, 0, 0]) {
            cylinder(h=lamp_support_height, d=bottom_width);
        }
        translate([0, 0, lamp_support_height]) {
            translate([-bottom_length/2+bottom_width/2, 0, 0]) {
                cylinder(h=bottom_thickness, d=bottom_width);
            }
            translate([bottom_length/2-bottom_width/2, 0, 0]) {
                cylinder(h=bottom_thickness, d=bottom_width);
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
