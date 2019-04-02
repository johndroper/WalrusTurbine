include<constants.scad>;

bearing_case_cover();

module bearing_case_cover()
{
    //bearing case cover
    difference()
    {
        union()
        {
            cylinder(
                r=core_cutout - 1, 
                h=seal_height + 3,
                $fn=75);

            translate([0,0,5])
            cylinder(
                d=thrust_bearing_od,
                h=spring_height/2 + 5,
                $fn=75);

            translate([0,0,5])
            cylinder(
                d=seal_diameter + 5,
                h=10,
                $fn=75);

        }
        
        //shaft hole
        translate([0,0,-.01])
        cylinder(
            d=shaft_diameter + 2, 
            h=seal_height + 10 + 8 + .02,
            $fn=50);
        
        //taper hole
        translate([0,0,seal_height-.02])
        cylinder(
            r2=(shaft_diameter / 2) + 1, 
            r1=(seal_diameter + .25) /2,
            h=10 + .02,
            $fn=50);
        
        //seal hole
        translate([0,0,-.01])
        cylinder(
            d=seal_diameter + .5, 
            h=seal_height,
            $fn=50);
        
        
        //O-Ring Groove
        translate([0,0,-.01])
        difference()
        {
            cylinder(
                d=small_oring_od, 
                h=o_ring_groove_depth, 
                $fn=100);

            translate([0,0,-.01])
            cylinder(
                d=small_oring_id, 
                h=o_ring_groove_depth+.02, 
                $fn=100);
        }

        //bolt holes 
        for(i=[0:60:360])
        {
            rotate([0,0,i])
            translate([
                (rotary_bearing_diameter / 2) + 10.5,
                0,
                -seal_height + 6])
            {
                cylinder(
                    d=bolt_diameter,
                    h=seal_height + 4,
                    $fn=25);
                
            }
        }
    }
}