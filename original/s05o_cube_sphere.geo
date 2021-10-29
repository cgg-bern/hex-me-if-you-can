Mesh.CharacteristicLengthMin = 0.1;
Mesh.CharacteristicLengthMax = 0.1;
//+
SetFactory("OpenCASCADE");
Box(1) = {-1, -1, -1, 2, 2, 2};
//+
Sphere(2) = {0, 1, 0, 0.75, -Pi/2, Pi/2, 2*Pi};
//+
BooleanUnion{ Volume{1}; Delete; }{ Volume{2}; Delete; }
