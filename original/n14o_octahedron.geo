SetFactory("OpenCASCADE");

Point(1) ={1, 0, 0};
Point(2) ={-1, 0, 0};
Point(3) ={0, 1, 0};
Point(4) ={0, -1, 0};
Point(5) ={0, 0, 1};
Point(6) ={0, 0, -1};

Line(1) = {1, 5};
Line(2) = {3, 5};
Line(3) = {2, 5};
Line(4) = {4, 5};
Line(5) = {1, 6};
Line(6) = {3, 6};
Line(7) = {2, 6};
Line(8) = {4, 6};
Line(9) = {1, 3};
Line(10) = {3, 2};
Line(11) = {2, 4};
Line(12) = {4, 1};

//+
Curve Loop(1) = {10, 3, -2};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {2, -1, 9};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {9, 6, -5};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {6, -7, -10};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {12, 5, -8};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {4, -1, -12};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {4, -3, 11};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {11, 8, -7};
//+
Plane Surface(8) = {8};
//+
Surface Loop(1) = {5, 6, 7, 1, 4, 3, 2, 8};
//+
Volume(1) = {1};
