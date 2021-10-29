SetFactory("OpenCASCADE");
lc = 0.5;
Point(1) = {0.0,0.0,0.0,lc};
Point(2) = {1,0.0,0.0,lc};
Point(3) = {1,1,0.0,lc};
Point(4) = {0,1,0.0,lc};
Line(1) = {4,3};
Line(2) = {3,2};
Line(3) = {2,1};
Line(4) = {1,4};
Line Loop(5) = {2,3,4,1};
Plane Surface(6) = {5};
tmp[] = Extrude {0,0.0,1} {
  Surface{6};
};
Geometry.ExactExtrusion=0;
allVolumes[] = Volume "*";
Rotate {{0.2, 0.1, 0.3}, {0, 0, 0}, Pi/3} { Volume{ allVolumes[] } ; }
Rotate {{0.2, 0.1, 0.3}, {0, 0, 1}, Pi/3.2} { Volume{ allVolumes[] } ; }
//+

