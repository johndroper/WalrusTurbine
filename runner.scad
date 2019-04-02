//runner

include <constants.scad>;

runner();

module runner()
{
    translate([-25,22,-.01])
    mirror([1,1,0])
    scale(.35,,35,1)
    #linear_extrude(height=3)
    union()
    {
        text("Walrus Turbines LLC");
        
        translate([15,-20,0])
        text("Copyright 2018");

        translate([55,-20,0])
        text("Copyright 2018");
    }
    
    difference()
    {

        union()
        {
            for(i=[0:(360/blades):360])
            {
                //runner blade 
                rotate([0,0,i])
                linear_extrude(
                    height = core_height, 
                    convexity = 10, 
                    twist = blade_twist )
                translate([50, 0, 0])
                union()
                {
                    //scale([4,.25])            
                    resize([blade_length,2.5])
                    difference()
                    {
                        circle(r = 10, $fn=50);

                        translate([-10,0])
                        square(size=[20,10]);
                    }
                    resize([blade_length,7.5])         
                    difference()
                    {
                        circle(r = 10, $fn=50);

                        translate([-10,-10])
                        square(size=[20,10]);
                    }
                }
            }

            //runner core
            cylinder(
                r=core_radius,
                h=core_height,
                $fn=100);
      
            //Core threaded insert stands
            for(i=[0:360/blades:360])
            {
                //top cylinder
                rotate([0,0,i-(360/blades/2)])
                translate([
                    core_radius,
                    0,
                    core_height - 
                        threaded_insert_height - 
                        3])
                scale([1.5,1,1])
                cylinder(
                    r=(threaded_insert_diameter_top+5)/2,
                    h=threaded_insert_height+3, 
                    $fn=50);

                //top cone
                rotate([0,0,i-(360/blades/2)])
                translate([
                    core_radius,
                    0,
                    core_height - 
                        10 - 
                        threaded_insert_height - 3])
                scale([1.5,1,1])
                cylinder(
                    r1=0, 
                    r2=(threaded_insert_diameter_top + 5) / 2,
                    h=10, 
                    $fn=50);

                //bottom cylinder
                rotate([0,0,i-(360/blades/2)])
                translate([
                    core_radius,
                    0,
                    0])
                scale([1.5,1,1])
                cylinder(
                    r=(threaded_insert_diameter_top+5)/2,
                    h=threaded_insert_height+3, 
                    $fn=50);

                //bottom cone
                rotate([0,0,i-(360/blades/2)])
                translate([
                    core_radius,
                    0,
                    threaded_insert_height+3])
                scale([1.5,1,1])
                cylinder(
                    r2=0, 
                    r1=(threaded_insert_diameter_top + 5) / 2,
                    h=10, 
                    $fn=50);
                
            }
            
        }
            
        //core cutout
        translate([0,0,10])
        cylinder(
            r=core_cutout,
            h=core_height - 10 +.01, 
            $fn=100);
        
        //motor shaft hole
        translate([0,0,-.01])
        cylinder(
            d=6 + 2,
            h=10 + .02, 
            $fn=100);

      
        //motor hub holes
        for(i=[0:60:360])
        {
            rotate([0,0,i])
            translate([9.5,0,-.01])
            cylinder(
                d=2.8448 + 1,
                h=10 + .02,
                $fn=25);
        }
        
        //Top Core O-Ring Groove
        translate([0,0,-.01])
        difference()
        {
            cylinder(
                d=o_ring_od, 
                h=o_ring_groove_depth, $fn=100);

            translate([0,0,-.01])
            cylinder(
                d=o_ring_id, 
                h=o_ring_groove_depth+.02, 
                $fn=100);
        }
        
        //Bottom Core O-Ring Groove
        translate([0,0,core_height - o_ring_groove_depth])
        difference()
        {
            cylinder(
                d=o_ring_od, 
                h=o_ring_groove_depth + .01, $fn=100);

            translate([0,0,-.01])
            cylinder(
                d=o_ring_id, 
                h=o_ring_groove_depth+.02, 
                $fn=100);
        }
        
        //Core Threaded Insert Holes
        for(i=[0:(360/blades):360])
        {
            //bottom
            rotate([0,0,i - (360/blades/2)])
            translate([
                core_radius + (threaded_insert_diameter_top * .65),
                0,
                -.01])
            {
                cylinder(
                    r1=(threaded_insert_diameter_top/2),
                    r2=(threaded_insert_diameter_bottom/2),
                    h=6 +.02,
                    $fn=25);            }
            
            //top
            rotate([0,0,i - (360/blades/2)])
            translate([
                core_radius + (threaded_insert_diameter_top * .65),
                0,
                core_height - 6 + .01])
            {
                cylinder(
                    r2=(threaded_insert_diameter_top/2),
                    r1=(threaded_insert_diameter_bottom/2),
                    h=6 +.02,
                    $fn=25);
                
            }

            
        }
    }
}