SetFactory("OpenCASCADE");
Mesh.CharacteristicLengthMin = 0.07;
Mesh.CharacteristicLengthMax = 0.07;
Cylinder(1) = {0, 0, 0, 1, 0, 0, 1, 10*Pi/180};
