SetFactory("OpenCASCADE");
Mesh.CharacteristicLengthMin = 0.1;
Mesh.CharacteristicLengthMax = 0.1;
Box(1) = {-0.5, -0.5, -0.5, 0.5, 1, 1.25};
Cylinder(2) = {0., 0., 0., 0.5, 0, 0, 0.5, 2*Pi};
Box(3) = {0., -0.5, -0.5, 0.5, 1., 0.5};
BooleanUnion{ Volume{1,2}; Delete; }{ Volume{3}; Delete; }
