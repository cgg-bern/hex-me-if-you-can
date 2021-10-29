SetFactory("OpenCASCADE");
//+
Point(1) = {1, 0, -0.707, 1.0};
//+
Point(2) = {-1, 0, -0.707, 1.0};
//+
Point(3) = {0, 1, 0.707, 1.0};
//+
Point(4) = {0, -1, 0.707, 1.0};
//+
Line(1) = {4, 1};
//+
Line(2) = {1, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 2};
//+
Line(5) = {2, 3};
//+
Line(6) = {1, 2};
//+
Curve Loop(1) = {5, 3, 4};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {1, 6, -4};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {3, 1, 2};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {5, -2, 6};
//+
Plane Surface(4) = {4};
//+
Surface Loop(1) = {2, 3, 1, 4};
//+
Volume(1) = {1};
