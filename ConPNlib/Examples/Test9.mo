within ConPNlib.Examples;
model Test9
  PNlib.PC P1(nOut = 1, startMarks = 1) annotation(Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TC T1(nIn = 1, nOut = 1, maximumSpeed = 0.5) annotation(Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PC P2(nIn = 1, nOut = 1) annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TC T2(nIn = 1, nOut = 1, maximumSpeed = 1.0) annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PC P3(nIn = 1, startMarks = 0) annotation(Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T2.outPlaces[1], P3.inTransition[1]) annotation(Line(points={{24.7,0},
          {30.7783,0},{30.7783,0},{30.7,0}}));
  connect(P2.outTransition[1], T2.inPlaces[1]) annotation(Line(points={{9.3,0},
          {15.566,0},{15.566,0},{15.3,0}}));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(Line(points={{-15.3,0},
          {-9.19811,0},{-9.19811,0},{-9.3,0}}));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points={{-30.7,0},
          {-24.7642,0},{-24.7642,0},{-24.7,0}}));
  annotation(experiment(StartTime = 0, StopTime = 3, Tolerance = 1e-006), Diagram(coordinateSystem(extent = {{-60, -20}, {60, 20}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2})), Icon(coordinateSystem(extent = {{-60, -20}, {60, 20}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2})));
end Test9;
