include <constants.scad>;

rotate([180,0,0])
motorMount();

module motorMount()
{
    difference()
    {
        union()
        {    
            cylinder(
                d=motor_mount_od, 
                h=motor_mount_height,
                $fn=75);
            
            //threaded insert stands
            for(i=[0:60:360])
            {
                rotate([0,0,i])
                translate([
                    motor_mount_od / 2 ,
                    0,
                    motor_mount_height - threaded_insert_height - 3])
                {
                    scale([1.50,1,1])
                    cylinder(
                        d=threaded_insert_diameter_top + 5,
                        h=threaded_insert_height + 3,
                        $fn=25);
                    
                }
            }
        }

        //motor cutout
        translate([0,0,motor_mount_height-motor_height])
        cylinder(
            d=motor_diameter + 2, 
            h=motor_height + .01,
            $fn=75);

        //threaded insert holes
        for(i=[0:60:360])
        {
            rotate([0,0,i])
            translate([
                motor_mount_od / 2 + (threaded_insert_diameter_top / 2) ,
                0,
                motor_mount_height - threaded_insert_height - 4 ])
            {
                cylinder(
                    r2=(threaded_insert_diameter_top/2),
                    r1=(threaded_insert_diameter_bottom/2),
                    h=threaded_insert_height + 4 +.01,
                    $fn=25);
                
            }
        }
        
        //thurst bearing cutout
        translate([0,0,-1])
        cylinder(
            d=thrust_bearing_od + 1, 
            h=thrust_bearing_height + (spring_height / 2),
            $fn=50);
        
        //spring cutout
        translate([0,0,thrust_bearing_height - .01])
        cylinder(
            d=21.463 + 1, 
            h=spring_height,
            $fn=50);

        //over-hang removal 
        translate([0,0,thrust_bearing_mount_height - 5])
        cylinder(
            r1=(shaft_diameter / 2) , 
            r2=(motor_diameter + 2) / 2 ,
            h=10+.01,
            $fn=50);

       //Shaft Hole
        translate([0,0,-1])
        cylinder(
            d=shaft_diameter + 1.5, 
            h=motor_mount_height,
            $fn=50);
        
        //pin hole
        //for 1/4" x 2" pin
        rotate([0,0,30])
        translate([
            0,
            25.4,
            thrust_bearing_height + spring_height + 8])
        rotate([90,0,0])
        cylinder(
            d=6.35 + 1.5,
            h=50.8,
            $fn=25);
            
        //vents
        for(i=[0:30:360])
        {
            rotate([0,0,i+30])
            translate([
                motor_mount_od/2 - 10,
                -1.5,
                65])
            cube(size=[10,3,motor_height - 20]);  
            //rotate([0,90,0])
//            resize([motor_height - 25,5,10])
//            difference()
//            {
//            cylinder(r=5, h=10, $fn=50);                        
        }
    }
}
