include <constants.scad>;

end_cap();

module end_cap()
{
    outer_cap_height = 10;
    
    difference()
    {
        union()
        {
            //outer cap
            translate([0,0,0])
            cylinder(
                r=core_radius,
                h=outer_cap_height, 
                $fn=100);
     
            //bearing case
            
            translate([0,0,outer_cap_height])
            cylinder(
                r=core_cutout - 1,
                h=end_cap_height - outer_cap_height, 
                $fn=100);

            //Cap bolt hole stands
            for(i=[0:60:360])
            {
                rotate([0,0,i])
                translate([
                    core_radius,
                    0,
                    0])
                scale([1.5,1,1])
                cylinder(
                    d=threaded_insert_diameter_top+5,
                    h=outer_cap_height, 
                    $fn=50);
            }

        }
        
        //Cap Bolt Holes
        for(i=[0:60:360])
        {
            rotate([0,0,i])
            translate([
                core_radius + (threaded_insert_diameter_top * .65),
                0,
                -.01])
            {
                cylinder(
                    d=bolt_diameter,
                    h=outer_cap_height + .02,
                    $fn=25);
            }
        }
            
        //bearing case Threaded Insert Holes
        for(i=[0:60:360])
        {
            rotate([0,0,i])
            translate([
                rotary_bearing_diameter / 2 + 10.5,
                0,
                end_cap_height - threaded_insert_height - 3])
            {
                cylinder(
                    r2=(threaded_insert_diameter_top/2),
                    r1=(threaded_insert_diameter_bottom/2),
                    h=threaded_insert_height + 3 +.01,
                    $fn=25);
                
            }
        }

        //seal cutout
        translate([0,0,5])
        cylinder(
            d=seal_diameter + .5,
            h=seal_height, 
            $fn=100);

        echo(rotary_bearing_diameter + 11);

        //Bearing case O-Ring Groove
        translate([0,0,end_cap_height-o_ring_groove_depth+.01])
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

       
        //rotary bearing cutout
        translate([0,0,seal_height + 5 - .01])
        cylinder(
            d=rotary_bearing_diameter + .5,
            h=end_cap_height - 5 - seal_height + .02, 
            $fn=100);
        
        //End cap O-Ring Groove
        translate([0,0,outer_cap_height-o_ring_groove_depth+.01])
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
        
        
        //Shaft Hole
        translate([0,0,-15])
        cylinder(
            d=shaft_diameter + 3, 
            h=50,
            $fn=50);
        
    }
}