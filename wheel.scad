//wheel

include <constants.scad>;

rotate([180,0,0])
wheel();

module wheel()
{
    //translate([0,0,-155 * explode])
    difference()
    {
        union()
        {
            
            difference()
            {
                cylinder(
                    r=core_radius, 
                    h=shaft_mount_height,
                    $fn=200);

                translate([0,0,-.01])
                cylinder(
                    d=70, 
                    h=shaft_mount_height-5,
                    $fn=200);
              
            }
            
            shaft_lock_height = shaft_mount_height + 15;
            
            //shaft lock
            translate([0,0,-15])
            cylinder(
                    d=30, 
                    h=shaft_lock_height,
                    $fn=50);       

            difference()
            {
                cylinder(
                    d=50,
                    h=shaft_mount_height,
                    $fn=50);
                                
                translate([0,0,5.5])
                rotate_extrude(convexity = 10)
                translate([24.5, 0, 0])
                resize([20,35])
                circle(d = 10, $fn = 100);
            }
            
            //shaft lock supports
            difference()
            {
                for(i=[30:60:360])
                {
                    rotate([0,0,i-2])
                    translate([10,-1.5,-15])
                    cube(size=[25,5,shaft_lock_height]);
                    
                }
                
                translate([0,0,-15])
                rotate_extrude(
                    convexity = 10, 
                    $fn = 100)
                translate([34, 0])
                scale([1,2])
                circle(r = 16, $fn = 100);
            }

            //threaded insert stands
            for(i=[35:60:390])
            {
                rotate([0,0,i])
                translate([
                    core_radius,
                    0,
                    0])
                scale([1.5,1,1])
                cylinder(
                    r=6,
                    h=shaft_mount_height, 
                    $fn=50);
            }
            
            
            //struts
            for(i=[0:(360/number_of_struts):360])
            {
                rotate([0,0,i])
                translate([
                    core_radius-3,
                    0,
                    shaft_mount_height/2 ])
                scale([1,1,2])
                rotate([0,90,0])
                cylinder(
                    d=shaft_mount_height/2,
                    h=(shroud_id/2) -
                        core_radius,
                    $fn=50);
            }
            
            //shroud mount ring
            difference()
            {
                cylinder(
                    d=shroud_od+spoke_bolt_head_height+12, 
                    h=shaft_mount_height,
                    $fn=200);
                
                translate([0,0,-.01])
                cylinder(
                    d=shroud_id - 10, 
                    h=shaft_mount_height+.02,
                    $fn=200);

            }


            //dome top - remove for use with guard.
            rotate_extrude(
                convexity = 10, 
                $fn = 200)
            translate([shroud_od/2 - 1, 0])
            difference()
            {
                circle(r=shroud_width-1);
                
                translate([-shroud_width,0])
                square(size=[shroud_width*2,shroud_width]);
            }

            //tie points
            for(i=[90:180:270])
            {
                rotate([0,0,i])
                translate([
                    shroud_od/2+shroud_width+5,
                    0,
                    0])
                    cylinder(
                        d=30,
                        h=shaft_mount_height,
                        $fn=50);
            }

        }

        //shroud cutout
        translate([0,0,3])
        difference()
        {
            cylinder(
                d=shroud_od + 3, 
                h=shaft_mount_height +.02,
                $fn=100);
            
            translate([0,0,-.01])
            cylinder(
                d=shroud_id - 3, 
                h=shaft_mount_height +.04,
                $fn=100);
        }

         
        //tie point holes
        for(i=[90:180:270])
        {
            rotate([0,0,i])
            translate([
                shroud_od/2+shroud_width+5,
                0,
                -10 - .01])
                cylinder(
                    d=8 + 1.5,
                    h=shaft_mount_height + 10 + .02,
                    $fn=50);
        }
        
        //pin hole
        //for 1/4" x 2" pin
        rotate([0,0,31.5]) 
        translate([0,50.8/2,-7])
        rotate([90,0,0])
        cylinder(d=6.35 + 1.5,h=50.8,$fn=50);

        //shaft hole
        translate([0,0,-15 - .01])
        cylinder(
            d=shaft_diameter + 1.5, 
            h=shaft_mount_height + 15 + .02,
            $fn=50);
        
        //threaded insert holes
        for(i=[35:60:390])
        {
            rotate([0,0,i])
            translate([
                core_radius + (threaded_insert_diameter_top * .65),
                0,
                -2.01])
            {
                cylinder(
                    r2=threaded_insert_diameter_top/2,
                    r1=threaded_insert_diameter_bottom/2,
                    h=threaded_insert_height + 3 +.01,
                    $fn=25);
                
            }

        }
        

        //spokes holes
        for(i=[(180/number_of_struts):(360/number_of_struts):360])
        {
            spoke_length = (shroud_od/2) - 18;
            
            rotate([0,0,i])
            translate([
                0,
                -22,
                shaft_mount_height/2 ])
            rotate([90,0,0])
            cylinder(
                d=6.35 + 1.5, 
                h=spoke_length,
                $fn=25);

            echo(spoke_length=spoke_length);

            //washer relief
            rotate([0,0,i-30])
            translate([
                70/2-2,
                0,
                shaft_mount_height/2 ])
            rotate([0,90,0])
            cylinder(d=15.875 + 1, h=2.5, $fn=50);

            //spoke head relief
           rotate([0,0,i])
            translate([
                0,
                -(shroud_od/2) - 7,
                shaft_mount_height/2])
            rotate([90,0,0])
            cylinder(
                d=15.0876 + 2,
                h=1,
                $fn=25);

            //head square part
            rotate([0,0,i])
            translate([
                -(6.604 + .5) / 2,
                -(shroud_od/2) - 7.1,
                shaft_mount_height/2 - (6.604 + .5) / 2])
            cube(size=[
                6.604 + 1.5,
                spoke_bolt_head_height + 1,
                6.604 + 1.5]);
        }

        
    }
}