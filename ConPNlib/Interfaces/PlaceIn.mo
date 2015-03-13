within ConPNlib.Interfaces;
connector PlaceIn "part of place model to connect places to input transitions"
  output Real t "Marking of the place" annotation(HideResult = true);
  output Real maxTokens "Maximum capacity of the place" annotation(HideResult = true);
  output Boolean enable
    "Which of the input transitions are enabled by the place?"                     annotation(HideResult = true);
  output Real decreasingFactor
    "Factor for decreasing the speed of continuous input transitions"                            annotation(HideResult = true);
  output Boolean emptied
    "Is the continuous place emptied by output transitions?"                      annotation(HideResult = true);
  output Real speedSum "Output speed of a continuous place" annotation(HideResult = true);
  input Boolean active "Are the input transitions active?" annotation(HideResult = true);
  input Boolean fire "Do the input transitions fire?" annotation(HideResult = true);
  input Real arcWeight "Arc weights of input transitions" annotation(HideResult = true);
  input Boolean enabledByInPlaces
    "Are the input transitions enabled by all theier input places?"                               annotation(HideResult = true);
  input Real instSpeed "Instantaneous speeds of continuous input transitions" annotation(HideResult = true);
  input Real prelimSpeed "Preliminary speeds of continuous input transitions" annotation(HideResult = true);
  input Real maxSpeed "Maximum speeds of continuous input transitions" annotation(HideResult = true);
  annotation(Diagram(graphics={  Polygon(fillColor = {95, 95, 95},
            fillPattern =                                                        FillPattern.Solid, points = {{-70, 100}, {70, 0}, {-70, -100}, {-70, 100}}, lineColor = {0, 0, 0})}), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Polygon(
            fillPattern =                                                                                                    FillPattern.Solid, points = {{-70, 100}, {70, 0}, {-70, -100}, {-70, 100}})}));
end PlaceIn;
