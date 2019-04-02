// nose cone
include <constants.scad>;

noseCone(false);

module noseCone(line_hole=true)
{
    difference()
    {
        union()
        {
            //cone
            difference()
            {
                translate([0,0,20])
                resize([
                    core_radius * 2,
                    core_radius * 2,
                    core_radius * 3])
                sphere(r=core_radius, $fn = 100);

                //remove cone bottom half
                translate([
                    0,
                    0,
                    -core_radius * 1.5 + .01])
                cylinder(
                    r=core_radius + 10, 
                    h=core_radius * 1.5);
            }
            
            //base
            difference()
            {
                cylinder(r=core_radius,h=20,$fn=75);
                
                translate([0,0,-.01])
                cylinder(
                    r=core_cutout,
                    h=20 + .02,
                    $fn=75);
            }
            
            
            //threaded insert stands
            for(i=[35:60:390])
            {
                difference()
                {
                    rotate([0,0,i])
                    translate([
                        core_radius,
                        0,
                        0])
                    scale([1.5,1,1])
                    cylinder(
                        d=threaded_insert_diameter_top + 5,
                        h=9, 
                        $fn=50);

                }
            }
        }
        
        //cone cutout
        translate([0,0,20])
        resize([
            core_radius * 2 - 20,
            core_radius * 2 - 20,
            core_radius * 3 - 10])
        sphere(r=core_radius, $fn = 100);

        //line hole
        if (line_hole == true)
        {
            cylinder(
                d=12.7,
                h=core_radius * 3,
                $fn=25);
        }
        
        //bolt holes
        for(i=[35:60:390])
        {
            rotate([0,0,i])
            translate([
                core_radius + (threaded_insert_diameter_top * .65),
                0,
                -.01])
            {
                cylinder(
                    d=bolt_diameter,
                    h=10 + .02,
                    $fn=25);
                
            }
            
        }
        
        //O-Ring Groove
        translate([0,0,-.01])
        difference()
        {
            cylinder(
                d=o_ring_od, 
                h=o_ring_groove_depth, 
                $fn=100);

            translate([0,0,-.01])
            cylinder(
                d=o_ring_id, 
                h=o_ring_groove_depth+.02, 
                $fn=100);
        }
    }
}