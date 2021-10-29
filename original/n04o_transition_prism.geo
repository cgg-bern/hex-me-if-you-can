SetFactory("OpenCASCADE");

L = 5.;
h = 1.;
theta1 = 80.;
theta2 = 150.;

// Top line
Point(1)={ 0., 0., 0.};
Point(2)={ 0., 0.,  L};
Line(1) = {1,2};

// Acute triangle
Point(3)={ h,  h * Tan(theta1/2. * 2 * Pi / 360.), 0.};
Point(4)={ h, -h * Tan(theta1/2. * 2 * Pi / 360.), 0.};
Line(2) = {3,4};
Line(3) = {1,3};
Line(4) = {1,4};

// Flat triangle
Point(5)={ h,  h * Tan(theta2/2. * 2 * Pi / 360.),  L};
Point(6)={ h, -h * Tan(theta2/2. * 2 * Pi / 360.),  L};
Line(5) = {5,6};
Line(6) = {2,5};
Line(7) = {2,6};

// Bottom lines
Line(8) = {3,5};
Line(9) = {4,6};

//+
Curve Loop(1) = {7, -9, -4, 1};
//+
Surface(1) = {1};
//+
Curve Loop(3) = {6, -8, -3, 1};
//+
Surface(2) = {3};
//+
Curve Loop(5) = {3, 2, -4};
//+
Surface(3) = {5};
//+
Curve Loop(7) = {8, 5, -9, -2};
//+
Surface(4) = {7};
//+
Curve Loop(9) = {6, 5, -7};
//+
Surface(5) = {9};
//+
Surface Loop(1) = {5, 2, 4, 1, 3};
//+
Volume(1) = {1};
