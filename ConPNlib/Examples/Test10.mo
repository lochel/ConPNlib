within ConPNlib.Examples;
model Test10
  inner Settings settings
    annotation (Placement(transformation(extent={{70,50},{80,60}})));
  ConPNlib.PC P1(nOut = 1, startMarks = 1) annotation(Placement(visible = true, transformation(origin = {-60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConPNlib.PC P2(nOut = 2, startMarks = 1.5) annotation(Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConPNlib.IA IA1(testValue = 0) annotation(Placement(transformation(extent = {{-8, -2}, {8, 2}}, rotation = 90, origin = {-30, 0})));
  ConPNlib.TC T1(nIn = 2, nOut = 1) annotation(Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConPNlib.TC T2(nIn = 1, nOut = 1) annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConPNlib.PC P3(nIn = 1) annotation(Placement(visible = true, transformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ConPNlib.PC P4(nIn = 1) annotation(Placement(visible = true, transformation(origin = {60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(IA1.inPlace, P2.outTransition[2]) annotation(Line(points={{-30,
          -7.24324},{-30,-7.24324},{-30,-39.5},{-50.7,-39.5}}));
  connect(IA1.outTransition, T1.inPlaces[2]) annotation(Line(points={{-30,
          7.24324},{-30,7.24324},{-30,40.5},{-4.7,40.5}}));
  connect(P2.outTransition[1], T2.inPlaces[1]) annotation(Line(points = {{-50.7, -40.5}, {-4.24528, -40.5}, {-4.24528, -40}, {-4.7, -40}}));
  connect(T2.outPlaces[1], P4.inTransition[1]) annotation(Line(points = {{4.7, -40}, {50.9434, -40}, {50.9434, -40}, {50.7, -40}}));
  connect(T1.outPlaces[1], P3.inTransition[1]) annotation(Line(points = {{4.7, 40}, {50.4717, 40}, {50.4717, 40}, {50.7, 40}}));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-50.7, 40}, {-4.71698, 40}, {-4.71698, 39.5}, {-4.7, 39.5}}));
  annotation(experiment(StartTime = 0, StopTime = 3, Tolerance = 1e-006), Diagram(coordinateSystem(extent = {{-80, -60}, {80, 60}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Test10;
