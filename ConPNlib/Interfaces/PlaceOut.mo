within ConPNlib.Interfaces;
connector PlaceOut
  "part of place model to connect places to output transitions"
  output Real t "Marking of the place" annotation(HideResult = true);
  output Real minTokens "Minimum capacity of the place" annotation(HideResult = true);
  output Boolean enable
    "Which of the output transitions are enabled by the place?"                     annotation(HideResult = true);
  output Real decreasingFactor
    "Factor for decreasing the speed of continuous input transitions"                            annotation(HideResult = true);
  output ConPNlib.Types.ArcType arcType
    "Type of output arcs ([1]normal, [2]test, [3]inhibition, or [4]read)"                                  annotation(HideResult = true);
  output Real testValue "Test value of a test or inhibitor arc" annotation(HideResult = true);
  output Boolean fed "Is the continuous place fed by input transitions?" annotation(HideResult = true);
  output Real speedSum "Input speed of a continuous place" annotation(HideResult = true);
  input Boolean active "Are the output transitions active?" annotation(HideResult = true);
  input Boolean fire "Do the output transitions fire?" annotation(HideResult = true);
  input Real arcWeight "Arc weights of output transitions" annotation(HideResult = true);
  input Real instSpeed "Instantaneous speeds of continuous output transitions" annotation(HideResult = true);
  input Real prelimSpeed "Preliminary speeds of continuous output transitions" annotation(HideResult = true);
  input Real maxSpeed "Maximum speeds of continuous output transitions" annotation(HideResult = true);
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Polygon(fillColor = {255, 255, 255},
            fillPattern =                                                                                                    FillPattern.Solid, points = {{-70, 100}, {70, 0}, {-70, -100}, {-70, 100}})}), Diagram(graphics={  Polygon(fillColor = {215, 215, 215},
            fillPattern =                                                                                                    FillPattern.Solid, points = {{-72, 100}, {68, 0}, {-72, -100}, {-72, 100}}, lineColor = {0, 0, 0})}));
end PlaceOut;
