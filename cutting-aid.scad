hand_support_width=50;
hand_support_length=90;
hand_support_height=4;
saw_support_length=60;
saw_support_width=50;
saw_support_height=4;
material_guide_length=4;
material_guide_height=10;
saw_guide_length=saw_support_length+hand_support_length-material_guide_length;
saw_guide_width=5;
saw_guide_height=10;
material_guide_width=hand_support_width+saw_guide_width+saw_support_width;
saw_support_incline=60;


difference() {
    union () {
        cube([saw_guide_length, saw_guide_width, saw_guide_height]);
        translate([0, -hand_support_width, 0]) {
            cube([hand_support_length, hand_support_width, hand_support_height]);
        }
        translate([hand_support_length-material_guide_length, 0, -saw_support_height]) {
            cube([saw_support_length, saw_support_width+saw_guide_width, saw_support_height]);
        }
        translate([hand_support_length-material_guide_length, -hand_support_width, -material_guide_height]) {
            cube([material_guide_length, material_guide_width, material_guide_height]);
        }
    }

    translate([hand_support_length-material_guide_length-1, saw_support_width+saw_guide_width, 0]) {
        mirror([0, 0, 1])
        rotate([saw_support_incline, 0, 0])
        cube([saw_support_length+2, material_guide_height*2, material_guide_height*3]);
    }
}
