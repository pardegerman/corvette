
// Mounting holes
hole_diameter = 4; // M4 screw
head_diameter = 7; // For countersinking the head


module mounting_holes(radius, height, offset_angle= 0, num_holes = 3, recessed = true) {
    head_height = 2;
    hole_position = [radius - head_diameter/2 - 2, 0, 0];

    rotate([0, 0, offset_angle]) union() {
        for (hole_num = [0: num_holes]) {
            rotate([0, 0, 360*hole_num/num_holes]) translate(hole_position) union() {
                translate([0, 0, -0.1]) cylinder(height+0.2, d = hole_diameter);
                if (recessed) {
                    translate([0, 0, height-head_height]) cylinder(head_height+0.1, d = head_diameter);
                }
            }
        }
    }
}

module mounting_hole_reinforcements(radius, height, offset_angle = 0, num_holes = 3) {
    hole_position = [radius - head_diameter/2 - 2, 0, 0];

    rotate([0, 0, offset_angle]) linear_extrude(height) union() {
        for (hole_num = [0: num_holes]) {
            rotate([0, 0, 360*hole_num/num_holes]) translate(hole_position) circle(d = head_diameter+2);
        }
    }
}
