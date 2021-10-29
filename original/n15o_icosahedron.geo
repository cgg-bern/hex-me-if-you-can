SetFactory("OpenCASCADE");

phi = (1 + Sqrt(5))/2;

Point(1) = {0, 1, phi};
Point(2) = {1, phi, 0};
Point(3) = {phi, 0, 1};
Point(4) = {0, 1, -phi};
Point(5) = {1, -phi, 0};
Point(6) = {-phi, 0, 1};
Point(7) = {0, -1, phi};
Point(8) = {-1, phi, 0};
Point(9) = {phi, 0, -1};
Point(10) = {0, -1, -phi};
Point(11) = {-1, -phi, 0};
Point(12) = {-phi, 0, -1};

//+
Line(1) = {8, 6};
//+
Line(2) = {6, 1};
//+
Line(3) = {1, 8};
//+
Line(4) = {6, 7};
//+
Line(5) = {7, 1};
//+
Line(6) = {7, 3};
//+
Line(7) = {3, 1};
//+
Line(8) = {3, 2};
//+
Line(9) = {2, 1};
//+
Line(10) = {8, 2};
//+
Line(11) = {7, 5};
//+
Line(12) = {5, 3};
//+
Line(13) = {9, 3};
//+
Line(14) = {5, 9};
//+
Line(15) = {9, 2};
//+
Line(16) = {9, 4};
//+
Line(17) = {4, 8};
//+
Line(18) = {2, 4};
//+
Line(19) = {6, 12};
//+
Line(20) = {12, 8};
//+
Line(21) = {4, 12};
//+
Line(22) = {7, 11};
//+
Line(23) = {11, 6};
//+
Line(24) = {11, 12};
//+
Line(25) = {5, 11};
//+
Line(26) = {12, 10};
//+
Line(27) = {10, 11};
//+
Line(28) = {5, 10};
//+
Line(29) = {10, 4};
//+
Line(30) = {9, 10};
//+
Curve Loop(1) = {29, -16, 30};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {30, -28, 14};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {28, 27, -25};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {25, -22, 11};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {22, 23, 4};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {4, 5, -2};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {2, 3, 1};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {3, 10, 9};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {10, 18, 17};
//+
Plane Surface(9) = {9};
//+
Curve Loop(10) = {15, 18, -16};
//+
Plane Surface(10) = {10};
//+
Curve Loop(11) = {21, 26, 29};
//+
Plane Surface(11) = {11};
//+
Curve Loop(12) = {26, 27, 24};
//+
Plane Surface(12) = {12};
//+
Curve Loop(13) = {24, -19, -23};
//+
Plane Surface(13) = {13};
//+
Curve Loop(14) = {19, 20, 1};
//+
Plane Surface(14) = {14};
//+
Curve Loop(15) = {17, -20, -21};
//+
Plane Surface(15) = {15};
//+
Curve Loop(16) = {7, -5, 6};
//+
Plane Surface(16) = {16};
//+
Curve Loop(17) = {6, -12, -11};
//+
Plane Surface(17) = {17};
//+
Curve Loop(18) = {13, -12, 14};
//+
Plane Surface(18) = {18};
//+
Curve Loop(19) = {8, -15, 13};
//+
Plane Surface(19) = {19};
//+
Curve Loop(20) = {7, -9, -8};
//+
Plane Surface(20) = {20};
//+
Surface Loop(1) = {14, 13, 12, 11, 15, 9, 8, 7, 6, 5, 4, 3, 2, 1, 10, 19, 20, 16, 17, 18};
//+
Volume(1) = {1};
