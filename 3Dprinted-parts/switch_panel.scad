$fn = 50;

module cup_holder(thickness = 4, height = 10, brim_width = 5, hole_angle = 45) {
    radius = 33.9;
    cut = 0.75*radius;
    
    // Mounting holes
    hole_diameter = 4; // M4 screw
    head_diameter = 7; // For countersinking the head
    head_height = 2;
    hole_position = [radius - head_diameter/2 - 2, 0, 0];
    num_holes = 3;
    
    module base_plate() {
        difference() {
            circle(radius);
            translate([(radius+cut),0,0]) square(2*radius, true);
        }
    }
    
    module hole_reinforcements() {
        rotate([0, 0, hole_angle]) union() {
            for (hole_num = [0: num_holes]) {
                rotate([0, 0, 360*hole_num/num_holes]) translate(hole_position) circle(d = head_diameter+2);
            }
        }
    }
    
    module brim() {
        union() {
            difference() {
                base_plate();
                offset(-brim_width) base_plate();
            }
            hole_reinforcements();
        }
    }
    
    module mounting_holes() {
        rotate([0, 0, hole_angle]) union() {
            for (hole_num = [0: num_holes]) {
                rotate([0, 0, 360*hole_num/num_holes]) translate(hole_position) union() {
                    translate([0, 0, -0.1]) cylinder(height+0.1, d = hole_diameter);
                    translate([0, 0, height-head_height]) cylinder(head_height+0.1, d = head_diameter);
                }
            }
        }
    }
    
    difference() {
        union() {
            translate([0, 0, height-thickness]) linear_extrude(thickness) base_plate();
            linear_extrude(height) brim();
        }
        mounting_holes();
    }
}

module switch_keyed_hole() {
    radius = 6.1;
    key_size = [1.5, 1.0];
    
    difference() {
        circle(radius);
        translate([-0.5*key_size[0], -radius, 0]) square(key_size);
    }
}

module markings(thickness = 1) {
    size = 6;
    font = "Corbel:style=Bold";
    
    translate([0, 0, -thickness]) linear_extrude(thickness+0.1) {
        translate([-9,0,0]) text("IGN", size=size, halign="center", valign="center", font=font);
        translate([ 9,0,0]) text("FAN", size=size, halign="center", valign="center", font=font);
    }
}

thickness = 4;
height = 10;

difference() { 
    cup_holder(thickness = thickness, height = height);

    // Holes for switches
    linear_extrude(height+0.1) union() {
        translate([-9, 0, 0]) switch_keyed_hole();
        translate([9, 0, 0]) switch_keyed_hole();
    }

    // Text
    translate([0, -20, height]) markings();
}


