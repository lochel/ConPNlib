within ConPNlib.Examples;
model Test3
  ConPNlib.TC T1(nIn = 0, nOut = 1) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConPNlib.PC P1(nIn = 1) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{-15.3, 0}, {10.7, 0}}));
  annotation(experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-006), Diagram(coordinateSystem(extent = {{-40, -20}, {40, 20}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2})));
end Test3;
