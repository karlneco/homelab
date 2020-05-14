
/*
 * Simple M3 Standoff. 
 * Easy to print, cheap and reduces weight compared
 * to the ones made of brass.
 *
 * Frederik Priede, 2019
 */
$fn=30;

INLET_WIDTH = 6;
INLET_HEIGHT = 3;
PILLAR_DIAMETER = 9;
PILLAR_HEIGHT = 60;



module create_nut_clipping(pos) {
   translate(pos) {
        union(){
            rotate([0,0,30]){
                cylinder(d=INLET_WIDTH,h = INLET_HEIGHT, $fn=6);
            }
            translate([0,-INLET_WIDTH / 2,0]){
                cube([15, INLET_WIDTH, INLET_HEIGHT]);
            }
        }
    }   
}


// create the spacer
module m3_spacer() {
    difference() {
        cylinder(d=PILLAR_DIAMETER, h=PILLAR_HEIGHT, $fn=6);
        translate([0, 0, -0.1]) {
            cylinder(d=3, h=PILLAR_HEIGHT + 2 * 0.1);    
        };
        create_nut_clipping([-0.3, 0, 3]);
        create_nut_clipping([-0.3, 0, PILLAR_HEIGHT -3 - INLET_HEIGHT]);
    }
}

// position everything to make printing easier.
rotate([-30, 0, 0]){
    rotate([0, -90, 0]){
        m3_spacer();
    };
};