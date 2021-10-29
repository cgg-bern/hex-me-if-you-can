Mesh.CharacteristicLengthMin = 0.1;
Mesh.CharacteristicLengthMax = 0.1;
//+
SetFactory("OpenCASCADE");
Box(1) = {-0.5, -0.5, 0, 1, 1, 1};
//+
Cylinder(2) = {0.1, 0.5, 0, 1, 0, 0, 0.5, 2*Pi};
//+
BooleanDifference{ Volume{1}; Delete; }{ Volume{2}; Delete; }
