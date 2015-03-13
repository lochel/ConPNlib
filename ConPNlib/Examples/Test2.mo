within ConPNlib.Examples;
model Test2
  PNlib.TC T1(nIn = 1, nOut = 0, maximumSpeed = 2 * P1.t) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PC P1(nOut = 1, startMarks = 1) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-10.7, 0}, {-10.7, 0}, {15.3, 0}}));
  annotation(experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-006), Diagram(coordinateSystem(extent = {{-40, -20}, {40, 20}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-40, -20}, {40, 20}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2})));
end Test2;
