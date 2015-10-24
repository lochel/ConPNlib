within ConPNlib.Examples;
model Test1a
  inner Settings settings
    annotation (Placement(transformation(extent={{34,14},{40,20}})));
  ConPNlib.PC P1 annotation(Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-006), Diagram(coordinateSystem(extent = {{0, -20}, {40, 20}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2})));
end Test1a;
