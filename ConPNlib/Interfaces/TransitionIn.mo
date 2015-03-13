within ConPNlib.Interfaces;
connector TransitionIn
  "part of transition model to connect transitions to input places"
  input Real t "Markings of input places" annotation(HideResult = true);
  input Real minTokens "Minimum capacites of input places" annotation(HideResult = true);
  input Boolean enable "Is the transition enabled by input places?" annotation(HideResult = true);
  input Real decreasingFactor
    "Factor of continuous input places for decreasing the speed"                           annotation(HideResult = true);
  input PNlib.Types.ArcType arcType
    "Type of output arcs ([1]normal, [2]test, [3]inhibition, or [4]read)"                                 annotation(HideResult = true);
  input Real testValue "Test value of a test or inhibitor arc" annotation(HideResult = true);
  input Boolean fed "Are the continuous input places fed?" annotation(HideResult = true);
  input Real speedSum "Input speeds of continuous input places" annotation(HideResult = true);
  output Boolean active "Is the transition active?" annotation(HideResult = true);
  output Boolean fire "Does the transition fire?" annotation(HideResult = true);
  output Real arcWeight "Input arc weights of the transition" annotation(HideResult = true);
  output Real instSpeed "Instantaneous speed of a continuous transition" annotation(HideResult = true);
  output Real prelimSpeed "Preliminary speed of a continuous transition" annotation(HideResult = true);
  output Real maxSpeed "Maximum speed of a continuous transition" annotation(HideResult = true);
  annotation(Diagram(graphics={  Polygon(fillColor = {95, 95, 95},
            fillPattern =                                                        FillPattern.Solid, points = {{-70, 100}, {70, 0}, {-70, -100}, {-70, 100}}, lineColor = {0, 0, 0})}), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Polygon(
            fillPattern =                                                                                                    FillPattern.Solid, points = {{-70, 100}, {70, 0}, {-70, -100}, {-70, 100}})}));
end TransitionIn;
