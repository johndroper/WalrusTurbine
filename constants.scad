shaft_height = 152.4;
shaft_diameter = 15.875;
spring_height = 25.4;
thrust_bearing_od = 28.575;
thrust_bearing_id = 15.9512;
thrust_bearing_height = 8.6868;
motor_offset = 0;
motor_diameter = 37;
motor_height = 75; //60;
motor_mount_od = 47; 
thrust_bearing_mount_height = thrust_bearing_height + 20 + spring_height;
echo(thrust_bearing_mount_height=thrust_bearing_mount_height);
motor_mount_height = motor_height + thrust_bearing_mount_height + 5; 
echo(motor_mount_height=motor_mount_height);
core_diameter = 90;
core_radius = core_diameter / 2;
cone_height = 35;
core_cutout = 33;
seal_diameter = 31.75;
seal_height = 6.7564;
rotary_bearing_height = 7.14375;
rotary_bearing_diameter = 34.925;
end_cap_height = seal_height + rotary_bearing_height + 7;
echo(end_cap_height=end_cap_height);

bearing_case_cover_height = seal_height + 13;
motor_cover_height = 5;
core_height = motor_mount_height + bearing_case_cover_height + end_cap_height + motor_cover_height + 14;
echo(core_height =core_height);

runner_height = core_height + cone_height;
echo(runner_height=runner_height);
cone_nut_offset = 30;


blade_length = 195; // 155;
blade_twist = -120;
blades = 6;

shroud_od = 315;
echo(shroud_od=shroud_od);
shroud_id = shroud_od - 10;
shroud_width =  shroud_od - shroud_id;
shroud_thickness = 10;

shaft_mount_height = 28;
shaft_screw_diameter = shaft_diameter;
shaft_height = 152.4;

spoke_bolt_head_height = 3.9624;

threaded_insert_height = 7.9248;
threaded_insert_diameter_top = 5.9436 + .5;
threaded_insert_diameter_bottom = 5.2832 + .5;
bolt_diameter = 4.1656 + 1;

o_ring_od = 82.8548;
o_ring_id = 75.7936;
o_ring_groove_depth = 3.5306/2 - .25;

small_oring_od = 47.9298;
small_oring_id = 40.8686;

number_of_struts = 6;