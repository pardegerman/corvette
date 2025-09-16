
module flip_switch_hole(keyed = true) {
    radius = 6.3;
    key_size = [1.5, 1.5];

    difference() {
        circle(radius);
        if (keyed) {
            translate([-0.5*key_size[0], -radius, 0]) square(key_size);
        }
    }
}

module flip_switch_base_plate(thickness = 0.2) {
    size = [18, 42];

    translate([-0.5*size[0], -15, -thickness]) linear_extrude(thickness) {
        square(size);
    }
}
