within ConPNlib;
model IA "Inhibitor Arc"
  // *** MODIFIABLE PARAMETERS AND VARIABLES BEGIN ***
  parameter Real testValue = 0.0
    "marking that has to be deceeded to enable firing"                              annotation(Dialog(enable = true, group = "Inhibitor Arc"));
  // *** MODIFIABLE PARAMETERS AND VARIABLES END ***
  Interfaces.TransitionIn inPlace(active = outTransition.active, fire = outTransition.fire, arcWeight = 0, instSpeed = 0, prelimSpeed = 0, maxSpeed = 0)
    "connector for place"                                                                                                     annotation(Placement(visible = true, transformation(origin = {-67, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-67, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.PlaceOut outTransition(t = inPlace.t, minTokens = inPlace.minTokens, enable = inPlace.enable, decreasingFactor=inPlace.decreasingFactor, fed = inPlace.fed, arcType = ConPNlib.Types.ArcType.inhibitor_arc, testValue = testValue, speedSum = inPlace.speedSum)
    "connector for transition"                                                                                                     annotation(Placement(visible = true, transformation(origin = {67, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {67, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  // *** ERROR MESSENGES BEGIN ***
  assert(testValue >= 0.0, "Test values must be greater or equal than zero.");
  // *** ERROR MESSENGES END ***
  annotation(defaultComponentName = "IA1", Icon(coordinateSystem(extent = {{-74, -20}, {74, 20}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(fillColor = {255, 255, 255},
            fillPattern =                                                                                                    FillPattern.Solid, extent = {{-60, -20}, {60, 20}}), Line(points = {{-55, 0}, {55, 0}}), Ellipse(origin = {49, 0}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                    FillPattern.Solid, extent = {{-6, -6}, {6, 6}}, endAngle = 360), Text(
            lineThickness =                                                                                                    0.5, extent = {{-38, -4}, {-38, -16}}, textString = " ")}), Diagram(coordinateSystem(extent = {{-74, -20}, {74, 20}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end IA;
