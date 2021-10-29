SetFactory("OpenCASCADE");
c1 = Cos(2*Pi/5);
c2 = Cos(Pi/5);
s1 = Sin(2*Pi/5);
s2 = Sin(4*Pi/5);
h = 1;

Point(1) = {0, 1, 0., 1.0};
Point(2) = {s1, c1, 0, 1.0};
Point(3) = {s2, -c2,  0., 1.0};
Point(4) = {-s2, -c2, 0., 1.0};
Point(5) = {-s1, c1, 0.,  1.0};
Point(11) = {0, 1, h, 1.0};
Point(12) = {s1, c1, h, 1.0};
Point(13) = {s2, -c2,  h, 1.0};
Point(14) = {-s2, -c2, h, 1.0};
Point(15) = {-s1, c1, h,  1.0};

Line(10) = {1,2};
Line(11) = {2,3};
Line(12) = {3,4};
Line(13) = {4,5};
Line(14) = {5,1};

Line(20) = {11,12};
Line(21) = {12,13};
Line(22) = {13,14};
Line(23) = {14,15};
Line(24) = {15,11};

Line(31) = {1, 11};
Line(32) = {2, 12};
Line(33) = {3, 13};
Line(34) = {4, 14};
Line(35) = {5, 15};

//+
Curve Loop(1) = {21, 22, 23, 24, 20};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {11, 12, 13, 14, 10};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {12, 34, -22, -33};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {11, 33, -21, -32};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {20, -32, -10, 31};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {31, -24, -35, 14};
//+
Plane Surface(6) = {6};
//+
Curve Loop(7) = {35, -23, -34, 13};
//+
Plane Surface(7) = {7};
//+
Surface Loop(1) = {1, 4, 2, 3, 7, 6, 5};
//+
Volume(1) = {1};
