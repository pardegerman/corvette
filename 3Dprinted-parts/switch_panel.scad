$fn = 50;

use <lib/shapes.scad>
use <lib/mounting_holes.scad>
use <lib/flip_switch.scad>

radius = 33.9;
rear_hole_radius = 20;

plate_thickness = 4;
spacer_thickness = 10;

module marking(text, depth = 1) {
    font_size = 6;
    font = "Corbel:style=Bold";
    translate([0, 0, -depth]) linear_extrude(depth) {
        text(text, size=font_size, halign="center", valign="center", font=font);
    }
}

module front_plate() {
    difference() {
        linear_extrude(plate_thickness) base_plate(radius);
        
        // Mounting holes
        mounting_holes(radius, plate_thickness, offset_angle = 45);

        // Holes for switches
        linear_extrude(plate_thickness) union() {
            translate([-10, 0, 0]) flip_switch_hole();
            translate([ 10, 0, 0]) flip_switch_hole();
        }

        // Inserts for switch tops
        union() {
            translate([-10, 0, plate_thickness]) flip_switch_base_plate();
            translate([ 10, 0, plate_thickness]) flip_switch_base_plate();
        }

        // Text
        union() {
            translate([-10, -20, plate_thickness]) marking("IGN");
            translate([ 10, -20, plate_thickness]) marking("FAN");
        }
    }
}

module rear_plate() {
    difference() {
        linear_extrude(plate_thickness) base_plate(radius);
        
        // Mounting_holes
        mounting_holes(rear_hole_radius, plate_thickness, offset_angle = 45);
        
        // Text
        translate([0, 0, plate_thickness]) marking("KEY");
    }
}

module spacer(radius) {
    difference() {
        union() {
            linear_extrude(spacer_thickness) mounting_spacer(radius);
            mounting_hole_reinforcements(radius, spacer_thickness, offset_angle = 45);
        }
        
        mounting_holes(radius, spacer_thickness, offset_angle = 45, recessed = false);
    }
}

// Front cup holder
translate([-40,-40, 0]) front_plate();
translate([-40, 40, 0]) spacer(radius);

// Rear cup holder
translate([ 40,-40, 0]) rear_plate();
translate([ 40, 40, 0]) spacer(rear_hole_radius);
