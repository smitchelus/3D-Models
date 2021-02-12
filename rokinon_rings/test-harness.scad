include <EAFx.scad>; 
// include <EAF_H.scad>; 
include <asiair.scad>; 
include <Gear_GT2.scad>; 

module M4_imbus_B(){
 rv2=7.3;
 hm = 3.4;
 union(){  

 translate([0,0,-0.5 ]) 
     cylinder(h=4.7, r=7.3/2, center=false, $fn=360);
 cylinder(h=26, r=4.2/2, center=false, $fn=360);
 translate([0,0,20 ])    
     union(){  
      cylinder(h=hm, r=rv2/1.732, center=false, $fn=6);
      translate([7.5,0,0 ])
         cube([15,rv2,hm], center=true);
  }
}
}

module dovetail(width=44, angle=15, length=100,height=10, flatend=1) { 
	difference(){
	scale([length/width*2,1,1])
   rotate([0,0,45])
   cylinder(height,width/2*sqrt(2),sqrt(2)/2*width*cos(angle*2),$fn=4);
//		echo(width/2*cos(angle*2));
//		echo(width/2*cos(angle));
		if (flatend!=0) {
			translate([-length/2-length, -width-1,-1])
			{
				cube([length,width*2+2,height+2]);
			}
			translate([length/2,-width-1,-1]){
				cube([length, width*2+2, height+2]);
			}
		}
	}
}

module M3_dira_a(){
rv2=5.8;
hm = 2.7;
 
  union(){  
cylinder(h=hm, r=rv2/sqrt(3), center=false, $fn=6);
cylinder(h=20, r=3/2, center=false, $fn=360);
translate([0,0,11 ])cylinder(h=10, r=3.3/2, center=false, $fn=360);
  }
}

module M3_dira_b(){
rv2=5.8;
hm = 2.7;
    
 rotate ([90,0,0]) rotate ([0,0,90]) union(){  
translate([0,0,10 ]) cylinder(h=hm, r=rv2/sqrt(3), center=true, $fn=6);
cylinder(h=20, r=3.2/2, center=false, $fn=360);
translate([10,0,10 ])cube([20,rv2,hm], center=true);     
  }
}

module finder_patka() {

difference(){
    
    dovetail(width=48,length=20, height=17, angle=20);

 translate([0,0, 8 ] ) {    
dovetail(width=33,length=20, height=9, angle=20);
translate([-12,-16.5, -1] )cube([33,33 ,1]);  

}
translate([0,-7.75, 9.2 ] )  rotate ([-20,0,0] ) M3_dira_b();     

}
}

module objimka_zadni() {
 
difference(){
  union(){  
      
 translate([-10,-55,16 ]) cube([ 20, 2*55, 14]); 
 cylinder(h=30, r=46, center=false, $fn=360);
 translate([-63,-19, 0]) cube([30,38 ,30]);     
 translate([60,0,20 ]) rotate ([180,0,0]) rotate ([0,90,0]) finder_patka();    
 translate([40,-24,16 ]) cube([20,48 ,14 ]);          
  }
 {
  cylinder(h=30, r=35.5, center=false, $fn=360);
  translate([0,0,14 ])cylinder(h=20, r=33.5, center=false, $fn=360);
  translate([0,0,20 ])cylinder(h=15, r=35.5, center=false, $fn=360);   
  translate([-2,-55,0 ]) cube([ 4, 2*55, 30]);
 translate([-10.1,50,22.5]) rotate ([0,90,0])M3_dira_a();     
 translate([-10.1,-50,22.5]) rotate ([0,90,0])M3_dira_a();        
  cylinder(h=16, r=46, center=false, $fn=360);
  translate([-46,-19, 0]) cube([10,38 ,16]);     
     
 }    
}

}

difference() { 
//    translate([0,0, 30] ) 
//    rotate ([180,0,0] ) 
//        objimka_zadni();  
//    translate([-78,13.5, 15] )  
//    rotate ([90,0,90] )
        M3_dira_b();
//    translate([-78,-13.5, 15] )  
//    rotate ([-90,0,-90] )
//        M4_imbus_B();
  }