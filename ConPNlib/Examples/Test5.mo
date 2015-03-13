within ConPNlib.Examples;
model Test5
  PNlib.PC P1(nOut = 1, startMarks = 1) annotation(Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PC P2(nIn = 1) annotation(Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TC T1(nIn = 1, nOut = 1, maximumSpeed = time) annotation(Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(Line(points = {{4.7, 10}, {4.7, 10}, {20.7, 10}}));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-20.7, 10}, {-20.7, 10}, {-4.7, 10}}));
  annotation(Diagram(coordinateSystem(extent = {{-60, -20}, {60, 40}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics), Icon(coordinateSystem(extent = {{-60, -20}, {60, 40}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-006));
end Test5;