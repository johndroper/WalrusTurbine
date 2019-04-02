include <constants.scad>

//Shroud
shroud();


module shroud()
{
    difference()
    {
        cylinder(
            d=shroud_od, 
            h=runner_height + shaft_mount_height, 
            $fn=200);

        translate([0,0,-.01])
        cylinder(
            d=shroud_id, 
            h=runner_height + shaft_mount_height +.02, 
            $fn=200);
        
        //spoke holes
        for(i=[(180/number_of_struts):(360/number_of_struts):360])
        {
            rotate([0,0,i])
            translate([
                0,
                -shroud_od/2+(shroud_od - shroud_id),
                (shaft_mount_height / 2) - 3 ])
            rotate([90,0,0])
            cylinder(
                d=6.35 + .5, 
                h=shroud_od - shroud_id + 3,
                $fn=25);
        }
        
    }
}