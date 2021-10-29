SetFactory("OpenCASCADE");
Mesh.CharacteristicLengthMin = 0.1;
Mesh.CharacteristicLengthMax = 0.1;
Cylinder(1) = {-0.5, 0., 0., 1., 0, 0, 0.2, 2*Pi};
Cylinder(2) = {0., -0.5, 0., 0., 1., 0, 0.1, 2*Pi};
BooleanUnion{ Volume{1}; Delete; }{ Volume{2}; Delete; }

