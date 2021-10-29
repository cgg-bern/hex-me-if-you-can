Mesh.CharacteristicLengthMin = 0.1;
Mesh.CharacteristicLengthMax = 0.1;
//+
SetFactory("OpenCASCADE");
Rectangle(1) = {-1, -1, 0, 2, 2, 0};
//+
Point(5) = {0, 0, 1.41421356, 0.25};
//+
Line(5) = {1, 5};
//+
Line(6) = {2, 5};
//+
Line(7) = {3, 5};
//+
Line(8) = {4, 5};
//+
Curve Loop(2) = {6, -5, 1};
//+
Surface(2) = {2};
//+
Curve Loop(4) = {8, -5, -4};
//+
Surface(3) = {4};
//+
Curve Loop(6) = {8, -7, 3};
//+
Surface(4) = {6};
//+
Curve Loop(8) = {7, -6, 2};
//+
Surface(5) = {8};
//+
Surface Loop(1) = {3, 1, 2, 5, 4};
//+
Volume(1) = {1};

Box(2) = {-1.5, -1.5, 0, 3, 3, 2.5};

BooleanDifference{ Volume{2}; Delete; }{ Volume{1}; Delete; }
