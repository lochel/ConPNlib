within ConPNlib.Examples;
model Test2
  inner Settings settings
    annotation (Placement(transformation(extent={{34,14},{40,20}})));
  ConPNlib.TC T1(nIn = 1, nOut = 0, maximumSpeed = 2 * P1.t) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConPNlib.PC P1(nOut = 1, startMarks = 1) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-10.7, 0}, {-10.7, 0}, {15.3, 0}}));
  annotation(experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-006), Diagram(coordinateSystem(extent = {{-40, -20}, {40, 20}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2})));
end Test2;
