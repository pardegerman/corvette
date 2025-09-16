
module base_plate(radius) {
    cut = 0.77*radius;

    difference() {
        circle(radius);
        translate([(radius+cut),0,0]) square(2*radius, true);
    }
}

module mounting_spacer(radius, offset_angle = 0, num_holes = 3, width = 5) {
    difference() {
        base_plate(radius);
        offset(-width) base_plate(radius);
    }
}
