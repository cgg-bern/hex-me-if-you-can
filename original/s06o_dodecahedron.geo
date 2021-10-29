SetFactory("OpenCASCADE");

phi = (1 + Sqrt(5))/2;

Point(1) = {1, 1, 1};
Point(2) = {0, 1/phi, phi};
Point(3) = {1/phi, phi, 0};
Point(4) = {phi, 0, 1/phi};
Point(5) = {-1, -1, -1};
Point(6) = {0, -1/phi, -phi};
Point(7) = {-1/phi, -phi, 0};
Point(8) = {-phi, 0, -1/phi};
Point(9) = {1, 1, -1};
Point(10) = {0, 1/phi, -phi};
Point(11) = {1/phi, -phi, 0};
Point(12) = {phi, 0, -1/phi};
Point(13) = {1, -1, 1};
Point(14) = {0, -1/phi, phi};
Point(15) = {-1/phi, phi, 0};
Point(16) = {-phi, 0, 1/phi};
Point(17) = {-1, 1, 1};
Point(18) = {-1, -1, 1};
Point(19) = {1, -1, -1};
Point(20) = {-1, 1, -1};//+
//+
Line(1) = {2, 1};
//+
Line(2) = {1, 3};
//+
Line(3) = {3, 15};
//+
Line(4) = {15, 17};
//+
Line(5) = {17, 2};
//+
Line(6) = {1, 4};
//+
Line(7) = {4, 12};
//+
Line(8) = {12, 9};
//+
Line(9) = {9, 3};
//+
Line(10) = {12, 19};
//+
Line(11) = {19, 6};
//+
Line(12) = {6, 10};
//+
Line(13) = {10, 9};
//+
Line(14) = {6, 5};
//+
Line(15) = {5, 8};
//+
Line(16) = {8, 20};
//+
Line(17) = {20, 10};
//+
Line(18) = {8, 16};
//+
Line(19) = {16, 17};
//+
Line(20) = {15, 20};
//+
Line(21) = {16, 18};
//+
Line(22) = {18, 14};
//+
Line(23) = {14, 2};
//+
Line(24) = {14, 13};
//+
Line(25) = {13, 4};
//+
Line(26) = {13, 11};
//+
Line(27) = {11, 19};
//+
Line(28) = {11, 7};
//+
Line(29) = {7, 5};
//+
Line(30) = {7, 18};
//+
Curve Loop(1) = {5, -23, -22, -21, 19};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {23, 1, 6, -25, -24};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {5, 1, 2, 3, 4};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {2, -9, -8, -7, -6};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {7, 10, -27, -26, 25};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {26, 28, 30, 22, 24};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {30, -21, -18, -15, -29};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {18, 19, -4, 20, -16};
//+
Plane Surface(8) = {8};
//+
Curve Loop(9) = {20, 17, 13, 9, 3};
//+
Plane Surface(9) = {9};
//+
Curve Loop(10) = {13, -8, 10, 11, 12};
//+
Plane Surface(10) = {10};
//+
Curve Loop(11) = {15, 16, 17, -12, 14};
//+
Plane Surface(11) = {11};
//+
Curve Loop(12) = {29, -14, -11, -27, 28};
//+
Plane Surface(12) = {12};
//+
Surface Loop(1) = {12, 7, 6, 5, 4, 3, 1, 2, 8, 9, 11, 10};
//+
Volume(1) = {1};
