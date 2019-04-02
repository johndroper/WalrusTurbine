include <constants.scad>;

explode=0;

//todo:

use <shroud.scad>;
use <nose_cone.scad>;
use <runner.scad>;
use <end_cap.scad>;
use <bearing_case_cover.scad>;
use <motor_mount.scad>;
use <motor_cover.scad>;
use <wheel.scad>;
use <guard.scad>;

*translate([0,0,475 * explode])
rotate([180,0,0])
guard();

translate([0,0,475 * explode])
shroud();

translate([0,0,230 + (240 * explode)])
rotate([0,0,-5])
noseCone(false);

translate([0,0,230])
rotate([180,0,0])
runner();

//Shaft
*color("gray")
translate([0,0, (explode * -160)-20])
difference()
{
    cylinder(
        d=shaft_diameter,
        h=shaft_height,
        $fn=50);

    translate([0,0,-.01])
    cylinder(
        d=shaft_diameter- 4,
        h=shaft_height + .02,
        $fn=50);
    
}


end_cap_offset = -100;

//End Cap
translate([0,0,50 + -200 * explode ])   
rotate([0,0,30])
end_cap();

//rotary bearing
*color("silver")
translate([0,0,-82 + end_cap_offset])
difference()
{
    cylinder(
        d=rotary_bearing_diameter, 
        h=rotary_bearing_height,
        $fn=75);
    
    translate([0,0,-.01])
    cylinder(
        d=thrust_bearing_id, 
        h=thrust_bearing_height + .02,
        $fn=50);
}

*translate([0,0,-60 + end_cap_offset])
bearing_case_cover();

//thrust bearing
*color("silver")
translate([0,0,-51 + motor_offset])
difference()
{
    cylinder(
        d=thrust_bearing_od, 
        h=thrust_bearing_height,
        $fn=75);
    
    translate([0,0,-.01])
    cylinder(
        d=thrust_bearing_id, 
        h=thrust_bearing_height + .02,
        $fn=50);
}

//motor mount
echo(motor_mount_od=motor_mount_od);

*translate([0,0,-70 + motor_offset])
rotate([0,0,0])
motorMount();

//motor
*color("silver")
translate([0,0,-16 + motor_offset])
{
    cylinder(
        d=motor_diameter,
        h=motor_height,
        $fn=50);
    
    translate([0,0,motor_height])
    cylinder(
        d=12,
        h=5,
        $fn=50);

    translate([0,0,motor_height])
    cylinder(
        d=6,
        h=20,
        $fn=50);
}

//motor cover
*translate([0,0,44 + motor_offset])
motorCover();

//wheel
translate([0,0,-260 * explode])
rotate([0,0,0])
wheel();

// nose cone
translate([0,0,-200 * explode])
mirror([0,0,1])
noseCone(true);
