include <constants.scad>;

motorCover();

module motorCover()
{
    difference()
    {
        union()
        {
            cylinder(
                d=motor_mount_od, 
                h=5,
                $fn=100);

            //bolt stands
            for(i=[0:60:360])
            {
                rotate([0,0,i])
                translate([
                    motor_mount_od / 2 ,
                    0,
                    0])
                {
                    scale([1.5,1,1])
                    cylinder(
                        d=threaded_insert_diameter_top + 5,
                        h=5,
                        $fn=50);
                    
                }
            }
        }
        
        //motor shaft hole
        translate([0,0,-.01])
        cylinder(d=12 + .5,h=5 + .02,$fn=50);

        //motor mount holes  
        for(i=[30:60:390])
        {
            rotate([0,0,i])
            translate([
                15.5,
                0,
                -.01])
            {
                cylinder(
                    d=3 + 1.5,
                    h=5+.02,
                    $fn=25);
                
            }
        }

        //bolt holes
        for(i=[0:60:360])
        {
            rotate([0,0,i])
            translate([
                motor_mount_od / 2 + (threaded_insert_diameter_top / 2),
                0,
                -.01])
            {
                cylinder(
                    d=bolt_diameter,
                    h=5+.02,
                    $fn=25);
                
            }
        }
    }
}