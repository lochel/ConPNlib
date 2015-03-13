within ConPNlib.Examples;
model Test8
  PNlib.PC P1(nOut = 2, startMarks = 1) annotation(Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PC P2(nIn = 1) annotation(Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TC T1(nIn = 1, nOut = 1) annotation(Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TC T2(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{-10, -40}, {10, -20}})));
  PC P3(nIn = 1, startMarks = 0.1) annotation(Placement(transformation(extent = {{20, -40}, {40, -20}})));
equation
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(Line(points = {{4.7, 10}, {20.7, 10}}));
  connect(T2.outPlaces[1], P3.inTransition[1]) annotation(Line(points = {{4.7, -30}, {4.7, -30}, {20.7, -30}}));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-20.7, -10.5}, {-12.354, -10.5}, {-12.354, 10}, {-4.7, 10}}));
  connect(P1.outTransition[2], T2.inPlaces[1]) annotation(Line(points = {{-20.7, -9.5}, {-12, -9.5}, {-12, -30}, {-4.7, -30}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(extent = {{-60, -60}, {60, 40}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics), Icon(coordinateSystem(extent = {{-40, -60}, {30, 40}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-006));
end Test8;
