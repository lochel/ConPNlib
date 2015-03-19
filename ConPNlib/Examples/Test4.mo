within ConPNlib.Examples;
model Test4
  ConPNlib.PC P1(nOut = 1, startMarks = 0.5) annotation(Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConPNlib.TC T1(nOut = 1, nIn = 1) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConPNlib.PC P2(nOut = 1, nIn = 1) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConPNlib.TC T2(nIn = 1) annotation(Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-50.7, 0}, {-24.7, 0}}));
  connect(P2.inTransition[1], T1.outPlaces[1]) annotation(Line(points = {{10.7, 0}, {-15.3, 0}}));
  connect(P2.outTransition[1], T2.inPlaces[1]) annotation(Line(points = {{29.3, 0}, {55.3, 0}}));
  annotation(experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-006), Diagram(coordinateSystem(extent = {{-80, -20}, {80, 20}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2})));
end Test4;
