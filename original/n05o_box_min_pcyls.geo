Mesh.CharacteristicLengthMin = 0.1;
Mesh.CharacteristicLengthMax = 0.1;
h = 1;
//+
SetFactory("OpenCASCADE");
Box(1) = {-0.5, -0.5, 0., 1, 1, h};
//+
Cylinder(2) = {0., 0., 0., 0, 0, 0.2, 0.2, 2*Pi};
//+
BooleanDifference{ Volume{1}; Delete; }{ Volume{2}; Delete; }


r = 0.35;
Cylinder(3) = {0., 0., h, 0, 0, 0.1, r, 2*Pi};
Sphere(4) = {0., 0., 0.1 + h, r, -Pi/2, Pi/2, 2*Pi};
BooleanUnion{ Volume{1}; Delete; }{ Volume{3}; Volume{4}; Delete; }

Cylinder(5) = {-0.5, 0., (h+0.1)/2, 1., 0, 0, 0.1, 2*Pi};
BooleanDifference{ Volume{1}; Delete; }{ Volume{5}; Delete; }

dx = 0.2;
dy = 0.2;
r2 = 0.1;
Cylinder(6) = {0+dx, -0.5, (h+0.1)/2, 0, dy, 0,  r2, 2*Pi};
Cylinder(7) = {0-dx, -0.5, (h+0.1)/2, 0, dy, 0,  r2, 2*Pi};
Cylinder(8) = {0+dx,  0.5, (h+0.1)/2, 0, -dy, 0, r2, 2*Pi};
Cylinder(9) = {0-dx,  0.5, (h+0.1)/2, 0, -dy, 0, r2, 2*Pi};
BooleanDifference{ Volume{1}; Delete; }{ Volume{6}; Volume{7}; Volume{8}; Volume{9}; Delete; }
//+
Fillet{1}{68, 58}{0.1}
