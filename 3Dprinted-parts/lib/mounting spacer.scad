
module base_plate(radius, thickness = 10) {
    cut = 0.77*radius;

    difference() {
        circle(radius);
        translate([(radius+cut),0,0]) square(2*radius, true);
    }
}

module mounting_spacer(radius, offset_angle = 0, num_holes = 3, height = 10, width = 5) {
    linear_extrude(height) difference() {
        base_plate(radius);
        offset(-width) base_plate(radius);
    }
}
