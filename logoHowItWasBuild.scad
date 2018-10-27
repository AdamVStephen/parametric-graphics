// Copyright 2018 Infinnovation Ltd.
//
// Generate an "infinity" like symbol using OpenSCAD
//
// Concept : Pairs of C style shapes nested, rotated.
//
// Formed from outer cyclinder, subtract inner cylinder and cube.
//
// Tip : to see cube, add the #debug modifier, thus s/cube/#cube/.

module createC (x,y,z,r,o,w,a)
{
  translate ([x,y,z]) rotate ([0,0,a]) difference ()
  {
    cylinder (5,r,r,$fa=5);
    translate ([0,0,-1]) cylinder (7,r-w,r-w,$fa=5);
    translate ([o,o,-1]) cube ([r+1,r+1,7]);
  }
}

// Original parameters

//createC(-38,0,0,20,3,3,-60);
//createC(-38,0,0,13,0,3,-18);
//createC(0,0,0,20,3,3,115);
//createC(0,0,0,13,0,3,158);

// Demonstrate the formation of the shape as the rotation proceeds
// Apply animation feature.

module cpair(x,y,z,w, rb, rl, ob, ol, ab, al) 
{
    createC(x,y,z,rb,ob,w,ab);
    createC(x,y,z,rl,ol,w,al);
}

function alpha(t,i) = 115*t;
function beta(t,i) = (158-360)*t;

cpair(0,0,0,3,20,13,3,0,alpha($t,0),beta($t,1));

function gamma(t,i) = -60*t;
function delta(t,i) = (-18-360)*t;
//color("red")

cpair(-38,0,0,3,20,13,3,0,gamma($t,0),delta($t,1));

// To generate an mp4 : use the "dump frames feature"
//
// Then e.g.
//
// ffmpeg -r 50 -i frame%05d.png -vcodec libx264 -crf 25 logo.mp4


    

