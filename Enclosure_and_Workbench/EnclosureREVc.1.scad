//EnclosureREVc.scad
//This is an Enclosure for the homework printed circuit assembly 20240421.
// Draw by Oyindamola Adeniran
// Date started - October 13th 2024
//GNU AFFERO GENERAL PUBLIC LICENSE
//Version 3, 19 November 2007
//Copyright Â© 2007 Free Software Foundation, Inc. <https://fsf.org/>
//Everyone is permitted to copy and distribute verbatim copies of this license document, but changing it is not allowed.

// <EnclosureREVc.scad>
  //  Copyright (C) <year>  <name of author>
  //  This program is free software: you can redistribute it and/or modify
  //  it under the terms of the GNU Affero General Public License as
  //  published by the Free Software Foundation, either version 3 of the
  //  License, or (at your option) any later version.
  //  This program is distributed in the hope that it will be useful,
 //   but WITHOUT ANY WARRANTY; without even the implied warranty of
   // MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  //  GNU Affero General Public License for more details.
   // You should have received a copy of the GNU Affero General Public License
    //along with this program.  If not, see <https://www.gnu.org/licenses/>.

x=54.9;//x +5PCB Width
y=26.9;//y +4PCB Height
z=0;//z
x1= 57.88;
y1= 30.685;
height_top = 3;
corner_radius=4.5;
corner_radiusb=4.5;
wall_thick =5;
hole_diameter = 3.5; // for screws
post_diameter = 10;
LED_diameter = 6.6; // for LED
lid_thickness = 2;
lid_lip = 2;
lid_tolerance =0.5;

extend = 10; //Show inside Enclosure [20 is closing enclosure number.]

power_surge_diameter =12;
power_surge_location =extend+5;

heightPCB = 113.0620;
widthPCB = 53.370;

heightPCBHole = 103.163;
widthPCBHole = 43.4340;

halfheightPCBHole = heightPCBHole/2;
halfwidthPCBHole = widthPCBHole/2;


h_hollow = 19.5;
h_inside = 19.5;

//THE TOP 
difference(){
    color("DarkGrey")
 hull(){
    translate ([x,y,z]){
    cylinder (r=corner_radius, h=height_top);
}
    translate ([-x,y,z]){
    cylinder (r=corner_radius, h=height_top);
}
    translate ([-x,-y,z]){
    cylinder (r=corner_radius, h=height_top);
}
    translate ([x,-y,z]){
    cylinder (r=corner_radius, h=height_top);
}
}
//ESP32 HOLE
translate([-16.695,-0.416,0])
cube([30,54,7],center=true);

//Top LED 1
translate([-36.83,21.685,0])
cylinder(h=15,d1=LED_diameter,d2 = LED_diameter, center=true);
//Top LED 2
translate([-36.83,14.3352,0])
cylinder(h=15,d1=LED_diameter,d2 = LED_diameter, center=true);
//Top LED 3
translate([-36.83,6.9854,0])
cylinder(h=15,d1=LED_diameter,d2 = LED_diameter, center=true);
//Top LED 4
translate([-36.83,-0.3644,0])
cylinder(h=15,d1=LED_diameter,d2 = LED_diameter, center=true);
//Top LED 5
translate([-36.83,-7.7142,0])
cylinder(h=15,d1=LED_diameter,d2 = LED_diameter, center=true);
//Top LED 6
translate([26.6618,20.0228,0])
cylinder(h=15,d1=LED_diameter,d2 = LED_diameter, center=true);
//Top LED 7
translate([26.6618,12.6568,0])
cylinder(h=15,d1=LED_diameter,d2 = LED_diameter, center=true);
//Top LED 8
translate([51.8498,10.5,0])
cylinder(h=15,d1=LED_diameter,d2 = LED_diameter, center=true);

//PUSH_BUTN 1
translate([9.0333,21.685,0])
cube([9.1967,7.20,15], center=true);
//PUSH_BUTN 2
translate([9.0333,13.435,0])
cube([9.1967,7.20,15], center=true);
//PUSH_BUTN 3
translate([9.0333,5.185,0])
cube([9.1967,7.20,15], center=true);
//PUSH_BUTN 4
translate([9.0333,-3.065,0])
cube([9.1967,7.20,15],center=true);
//TRANSISTOR HOLE
translate([10.76,-13.41,00])
cube([10.5,4.641,15],center=true);

textFileName();
}  
module textFileName(){
    //Text for file name
    rotate([180,0,180])
    translate([-40, -27,-1.5]) {
    linear_extrude(3)
    text("EnclosureREVc.1", size=3, font = "Liberation Sans");
 }
 }
//textFileName();
 
// THE HOLLOW SHAPE

difference(){
color("DarkGrey")
hull(){
    translate ([x1,y1,extend+5]){
    cylinder (r=corner_radius, h=h_hollow);
}
    translate ([-x1,y1,extend+5]){
    cylinder (r=corner_radius, h=h_hollow);
}
    translate ([-x1,-y1,extend+5]){
    cylinder (r=corner_radius, h=h_hollow);
}
    translate ([x1,-y1,extend+5]){
    cylinder (r=corner_radius, h=h_hollow);
}
}
//INSIDE HOLLOW
hull(){
translate ([55.88,27.658,(extend+13)]){
    cylinder (r=corner_radiusb, h= h_inside, center=true);
}
    translate ([-55.88,27.658,(extend+13)]){
    cylinder (r=corner_radiusb, h=h_inside, center=true);
}
    translate ([-55.88,-27.658,(extend+13.5)]){
    cylinder (r=corner_radiusb, h=h_inside, center=true);
}
    translate ([55.88,-27.658,(extend+13.5)]){
    cylinder (r=corner_radiusb, h=h_inside, center=true);
    }
}


//Small Hole for Enclosure
translate([-halfheightPCBHole,halfwidthPCBHole,60])
cylinder(h=102,d1=hole_diameter,d2 = hole_diameter, center=true);  

//Small Hole 2 for Enclosure
translate([halfheightPCBHole,halfwidthPCBHole,60])
cylinder(h=102,d1=hole_diameter,d2 = hole_diameter, center=true);

//Small Hole 3 for Enclosure
translate([halfheightPCBHole,-halfwidthPCBHole,60])
cylinder(h=102,d1=hole_diameter,d2 = hole_diameter, center=true);
//Hole 4 for Enclosure
translate([-halfheightPCBHole,-halfwidthPCBHole,60])
cylinder(h=102,d1=hole_diameter,d2 = hole_diameter, center=true);

//POWER SURGE
translate([x1,-4.049,(extend+14)])
rotate([0,90,0])
cylinder (h=12,d1=power_surge_diameter,d2=power_surge_diameter,center=true);
//The barrel jack is sticking out at 2.8mm

//ESP32 USB A-HOLE
translate([-18,-35,extend+14])
rotate([0,0,90])
cube([10,13,10],center=true);
}

$fn=50;

//THE 4 CYCLINDERS 

h_bosses = 15;
z_boss = 7.5;

difference(){
//Screw Cylinder 1
    color("DarkGrey")
translate([-halfheightPCBHole,halfwidthPCBHole,z_boss])
cylinder(h=h_bosses,d1=13,d2 =13, center=true);
 
    //Small Hole 1
translate([-halfheightPCBHole,halfwidthPCBHole,12])
cylinder(h=25,d1=hole_diameter,d2 = hole_diameter, center=true);   
}   
difference (){    
//Screw Cylinder 2
    color("DarkGrey")
translate([halfheightPCBHole,halfwidthPCBHole,z_boss])
cylinder(h=h_bosses,d1=13,d2 =13,center=true);
//Small Hole 2
translate([halfheightPCBHole,halfwidthPCBHole,12])
cylinder(h=25,d1=hole_diameter,d2 = hole_diameter, center=true);
}
difference(){
//Screw Cylinder 3
    color("DarkGrey")
translate([halfheightPCBHole,-halfwidthPCBHole,z_boss])
cylinder(h=h_bosses,d1=13,d2 =13, center=true);
    //Small Hole 3
translate([halfheightPCBHole,-halfwidthPCBHole,12])
cylinder(h=25,d1=hole_diameter,d2 = hole_diameter, center=true);
}
 difference(){   
//Screw Cylinder 4
     color("DarkGrey")
translate([-halfheightPCBHole,-halfwidthPCBHole,z_boss])
cylinder(h=h_bosses,d1=13,d2 =13,center=true);
//Hole 4
translate([-halfheightPCBHole,-halfwidthPCBHole,12])
cylinder(h=25,d1=hole_diameter,d2 = hole_diameter, center=true);
 }


    

