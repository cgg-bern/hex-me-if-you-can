SetFactory("OpenCASCADE");
Mesh.CharacteristicLengthMin = 0.1;
Mesh.CharacteristicLengthMax = 0.1;
a = 2;
c1 = Cos(2*Pi/5);
c2 = Cos(Pi/5);
s1 = Sin(2*Pi/5);
s2 = Sin(4*Pi/5);
h = 2;


Point(1) = {0, 1,     0., 1.0};
Point(2) = {s1, c1,   0., 1.0};
Point(3) = {s2, -c2,  0., 1.0};
Point(4) = {-s2, -c2, 0., 1.0};
Point(5) = {-s1, c1,  0., 1.0};
Point(6) = {0, 0, 1., 1.0};

Line(10) = {1,2};
Line(11) = {2,3};
Line(12) = {3,4};
Line(13) = {4,5};
Line(14) = {5,1};

Line(20) = {1,6};
Line(21) = {2,6};
Line(22) = {3,6};
Line(23) = {4,6};
Line(24) = {5,6};

//+
Curve Loop(1) = {23, -22, 12};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {23, -24, -13};
//+
Plane Surface(2) = {2};
//+
Curve Loop(3) = {20, -24, 14};
//+
Plane Surface(3) = {3};
//+
Curve Loop(4) = {21, -20, 10};
//+
Plane Surface(4) = {4};
//+
Curve Loop(5) = {11, 22, -21};
//+
Plane Surface(5) = {5};
//+
Curve Loop(6) = {14, 10, 11, 12, 13};
//+
Plane Surface(6) = {6};
//+
Surface Loop(1) = {3, 4, 5, 6, 1, 2};
//+
Volume(1) = {1};

Box(2) = {-1.5, -1.5, 0, 3, 3, 2.5};
BooleanDifference{ Volume{2}; Delete; }{ Volume{1}; Delete; }
