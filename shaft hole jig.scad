
difference()
{
    cube(size=[25,25,50]);
    
    translate([12.5,12.5,5])
    cylinder(d=15.875 + 1.5,h=50-5+.01,$fn=50);
    
    translate([12.5,25.01,12 + 5])
    rotate([90,0,0])
    cylinder(d=6.35 + 1,h=25+.02,$fn=50);
}

