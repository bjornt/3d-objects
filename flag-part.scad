$fn=64;

radius = 3;
length = 100;
width = 30;
height = 20;
feet_border = 7;
feet_radius = 5;
feet_offset = 2;

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


for (i = [0:2]) {
  translate([0, 0, height*i]) {
    flag_part();
  }
}

translate([feet_border, feet_border, height*3-feet_offset]) {
    sphere(r=feet_radius);
}
translate([length-feet_border, feet_border, height*3-feet_offset]) {
    sphere(r=feet_radius);
}
translate([feet_border, width-feet_border, height*3-feet_offset]) {
    sphere(r=feet_radius);
}
translate([length-feet_border, width-feet_border, height*3-feet_offset]) {
    sphere(r=feet_radius);
}