within ConPNlib.Interfaces;
connector TransitionOut
  "part of transition model to connect transitions to output places"
  input Real t "Markings of output places" annotation(HideResult = true);
  input Real maxTokens "Maximum capacities of output places" annotation(HideResult = true);
  input Boolean enable "Is the transition enabled by output places?" annotation(HideResult = true);
  input Real decreasingFactor
    "Factor of continuous output places for decreasing the speed"                           annotation(HideResult = true);
  input Boolean emptied "Are the continuous output places emptied?" annotation(HideResult = true);
  input Real speedSum "Output speeds of continuous output places" annotation(HideResult = true);
  output Boolean active "Is the transition active?" annotation(HideResult = true);
  output Boolean fire "Does the transition fire?" annotation(HideResult = true);
  output Real arcWeight "Output arc weights of the transition" annotation(HideResult = true);
  output Boolean enabledByInPlaces
    "Is the transition enabled by all input places?"                                annotation(HideResult = true);
  output Real instSpeed "Instantaneous speed of a continuous transition" annotation(HideResult = true);
  output Real prelimSpeed "Preliminary speed of a continuous transition" annotation(HideResult = true);
  output Real maxSpeed "Maximum speed of a continuous transition" annotation(HideResult = true);
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Polygon(fillColor = {255, 255, 255},
            fillPattern =                                                                                                    FillPattern.Solid, points = {{-70, 100}, {70, 0}, {-70, -100}, {-70, 100}})}), Diagram(graphics={  Polygon(fillColor = {215, 215, 215},
            fillPattern =                                                                                                    FillPattern.Solid, points = {{-70, 100}, {70, 0}, {-70, -100}, {-70, 100}}, lineColor = {0, 0, 0})}));
end TransitionOut;
