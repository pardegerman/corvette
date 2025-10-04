// thru hole leds 
// scruss, 2019-03

module _thru_hole_led(
    // default: 5mm LED
    //      sized from https://www.adafruit.com/product/1938
    //      no tolerances applied - will be to size or under
    //      *** INTERNAL USE ONLY ***
    //      *** don't call this, use thru_hole_led() ***
    diameter        =    5,
    height          =    8.7,
    base_diameter   =    5.8,
    flange_height   =    1      ) {
    union() {
        difference() {
            cylinder(d = base_diameter, h = flange_height, $fn = 32);
            translate([diameter, 0, 0])cube(diameter, center = true);
        }                       // flange

        cylinder(h = height - (diameter / 2),
            d=diameter, $fn = 32
        );                      // body
        
        translate([0, 0, height - (diameter / 2)])sphere(
            d=diameter, $fn = 32
        );                      // tip
    }
}

module thru_hole_led(
    diameter        =    5,
    height          =    8.7,
    base_diameter   =    5.8,
    flange_height   =    1,
    tolerance       =    0.2    ) {
    _thru_hole_led(diameter = diameter + 2 * tolerance, height = height + tolerance, base_diameter = base_diameter + 2 * tolerance, flange_height = flange_height + tolerance);
}    

module led3mm() {
    /* 3mm LED
    actual measurement from a https://www.adafruit.com/product/4202
    */    
    diameter        =    3;
    height          =    5.3;
    base_diameter   =    3.8;
    flange_height   =    1;
    tolerance       =    0.2;
    _thru_hole_led(diameter = diameter + 2 * tolerance, height = height + tolerance, base_diameter = base_diameter + 2 * tolerance, flange_height = flange_height + tolerance);
}

module led3mm_cutout() {
    // negative space to remove to allow a 3mm LED to fit
    diameter        =    3;
    height          =    5.3;
    base_diameter   =    3.8;
    flange_height   =    1;
    tolerance       =    0.2 + 0.2;
    _thru_hole_led(diameter = diameter + 2 * tolerance, height = height + tolerance, base_diameter = base_diameter + 2 * tolerance, flange_height = flange_height + tolerance);
}

module led5mm() {
    thru_hole_led();
}

module led5mm_cutout() {
    // negative space to remove to allow a 5mm LED to fit
    diameter        =    5;
    height          =    8.7;
    base_diameter   =    5.8;
    flange_height   =    1;
    tolerance       =    0.2 + 0.2;
    _thru_hole_led(diameter = diameter + 2 * tolerance, height = height + tolerance, base_diameter = base_diameter + 2 * tolerance, flange_height = flange_height + tolerance);
}

module led8mm() {
    /* 8mm LED
    actual measurement from a https://www.adafruit.com/product/1734
    */    
    diameter        =    8;
    height          =   11;
    base_diameter   =    9.2;
    flange_height   =    2;
    tolerance       =    0.2;
    _thru_hole_led(diameter = diameter + 2 * tolerance, height = height + tolerance, base_diameter = base_diameter + 2 * tolerance, flange_height = flange_height + tolerance);
}

module led8mm_cutout() {
    // negative space to remove to allow a 8mm LED to fit
    diameter        =    8;
    height          =   11;
    base_diameter   =    9.2;
    flange_height   =    2;
    tolerance       =    0.2 + 0.2;
    _thru_hole_led(diameter = diameter + 2 * tolerance, height = height + tolerance, base_diameter = base_diameter + 2 * tolerance, flange_height = flange_height + tolerance);
}
