include<constants.scad>;

guard();

module guard()
{

    guard_radius = shroud_od/2 + 17;
    guard_height = guard_radius + 10;


    difference()
    {
        cylinder(
            r1=guard_radius,
            r2=20,
            h=guard_height,
            $fn=200);
       
       translate([0,0,-.01]) 
       difference()
        {
            cylinder(
                r=guard_radius,
                h=15,
                $fn=200);
            
            cylinder(
                r=guard_radius - 10,
                h=15,
                $fn=200);
        }
        
        
       translate([0,0,-10])
       cylinder(
            r1=guard_radius-18,
            r2=20,
            h=guard_height-20,
            $fn=200);
        
        cylinder(
            r=20,
            h=guard_height+.01,
            $fn=50);
        
        guard_slot_width = 73;
      
       
        for(i=[30:30:360])
        {
            translate([0,0,10])
            rotate([0,0,i])
            translate([-guard_slot_width/2,0,0])
            rotate([90,0,0])
            linear_extrude(height=guard_radius)
            polygon([
                [0,0],
                [
                    guard_slot_width * .475,
                    guard_height-25],
                [
                    guard_slot_width * .525,
                    guard_height-25],
                [
                    guard_slot_width,
                    0]
                ]);


//            polygon([
//                [0,0],
//                [
//                    guard_slot_width * .425,
//                    guard_height-25],
//                [
//                    guard_slot_width * .575,
//                    guard_height-25],
//                [
//                    guard_slot_width,
//                    0],
//                [
//                    guard_slot_width/2 + 10,
//                    0],
//                [
//                    guard_slot_width/2,
//                    guard_height /2 ],
//                [
//                    guard_slot_width/2 - 10,
//                    0]
//                ]);
    
            //cube(size=[shroud_od,shroud_od/4,40]);
        }
    }

    //tie points
    for(i=[90:180:270])
    {
        
        rotate([0,0,i])
        translate([
            shroud_od/2+shroud_width+5,
            0,
            0])
        difference()
        {
            cylinder(
                d=30,
                h=10,
                $fn=50);
            
            translate([0,0,-.01])
            cylinder(
                d=8,
                h=shaft_mount_height + 10 + .02,
                $fn=50);
        }
    }
}
