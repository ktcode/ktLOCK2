//
// ktLOCK2
//
 
gap1 = 0.001;
gap2 = 0.002;
th = 2;

W = 69.5;
D = 37.5;
H = 90.5;

NR = 23;
NT = 6.2;
NH = 13;

UL = 35;

AW = 20.5;
AH = 25;
BH = 30;


translate([-70, 0, 0]) base();
adapter();
translate([70, 0, 0]) waku();

module base()
{
difference()
{
    union()
    {
        $fn=100;
        RB=6;
        hull() {
        translate([0, 0, BH])
        minkowski()
        {
            linear_extrude(height=0.1)
            polygon(points=[[RB,-51.5/2+RB],[38.5-RB,-54.5/2+RB],[38.5-RB,54.5/2-RB],[RB,51.5/2-RB]]);
            cylinder(r=RB, h=0.1);
        }
        translate([0, 0, BH-5])
        minkowski()
        {
            linear_extrude(height=0.1)
            polygon(points=[[RB,-51.5/2+RB],[30-RB,-54.5/2+RB],[30-RB,54.5/2-RB],[RB,51.5/2-RB]]);
            cylinder(r=RB, h=0.1);
        }
        }
        minkowski()
        {
            linear_extrude(height=BH-5)
            polygon(points=[[RB,-51.5/2+RB],[30-RB,-54.5/2+RB],[30-RB,54.5/2-RB],[RB,51.5/2-RB]]);
            cylinder(r=RB, h=0.1);
        }
    }
    translate([96, 0, -gap1]) cylinder(r=120/2, h=BH+1, $fn=100);
    
    
    //translate([-100/2, -100/2, -100+AH-0.5]) cube([100, 100, 100]);
}
}


module adapter()
{
difference()
{
    union()
    {
        translate([0, 0, gap1]) cylinder(r=44/2, h=AH-gap2, $fn=100);
    }
    translate([AW/2, -15/2, 0]) cube([8, 15, AH]);
    translate([AW/2, -28/2, 0]) cube([3, 28, AH]);
    
    translate([-AW/2-8, -15/2, 0]) cube([8, 15, AH]);
    translate([-AW/2-3, -28/2, 0]) cube([3, 28, AH]);
    
    translate([0, 0, 0]) knob();
}
}

module waku()
{
difference()
{
    union()
    {
        translate([0, 0, gap1]) cylinder(r=57/2, h=AH-gap1-10, $fn=100);
    }
    translate([0, 0, -gap1]) cylinder(r=44/2, h=AH+gap2, $fn=100);
    
    translate([-115, -50, -50]) cube([100, 100, 100]);
    
    translate([-50, -1/2, -50]) cube([100, 1, 100]);
    
    //#translate([-50, 0, -50]) cube([100, 100, 100]);
}
difference()
{
    union()
    {
        translate([0, 0, gap1]) cylinder(r=(44+2)/2, h=AH-gap1-10, $fn=100);
    }
    translate([0, 0, -gap1]) cylinder(r=44/2, h=AH+gap2, $fn=100);
    
    translate([-124, -50, -50]) cube([100, 100, 100]);
    
    translate([-50, -1/2, -50]) cube([100, 1, 100]);

}
}


module knob()
{
rr=12;
difference()
{
    union()
    {
        translate([0, 0, 0+gap1]) resize(newsize=[12, 40+17, AH]) cylinder(r=40/2, h=AH, $fn=100);
        translate([0, 0, -20.5]) sphere(29, $fn=100);
    }
    translate([-8.5/2, 40/2, 0]) cube([8.5, 40, AH+1]);
    translate([-8.5/2, -40-40/2, 0]) cube([8.5, 40, AH+1]);
    translate([-50, -50, -100]) cube([100, 100, 100]);
    
    
    //translate([NT/2+rr/2, NR, 10.6+1+rr/2]) rotate([90, 0, 0]) cylinder(r=rr/2, h=NR, $fn=100);
    //translate([NT/2+rr/2, 0, 10.6+1]) cube([rr, NR, rr]);
    //translate([NT/2, 0, 10.6+1+rr/2]) cube([rr, NR, rr]);
    //translate([-NT/2-rr/2, NR, 10.6+1+rr/2]) rotate([90, 0, 0]) cylinder(r=rr/2, h=NR, $fn=100);
    //translate([-NT/2-rr-rr/2, 0, 10.6+1]) cube([rr, NR, rr]);
    //translate([-NT/2-rr, 0, 10.6+1+rr/2]) cube([rr, NR, rr]);
}
}

