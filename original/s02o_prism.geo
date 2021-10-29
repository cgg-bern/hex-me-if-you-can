SetFactory("OpenCASCADE");
a = 1;
Point(1) = {-0.5*a, 0, 0, 1.0};
Point(2) = {0.5*a, 0, 0, 1.0};
Point(3) = {0,0.86602540*a, 0, 1.0};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 1};
Curve Loop(1) = {1,2,3};
Plane Surface(1) = {1};
Extrude {0, 0, 0.5*a} {
  Surface{1}; 
}
//+
Transfinite Surface {191};
