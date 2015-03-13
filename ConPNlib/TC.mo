within ConPNlib;
model TC "Continuous Transition"
  parameter Integer nIn = 0 "number of input places" annotation(Dialog(connectorSizing = true));
  parameter Integer nOut = 0 "number of output places" annotation(Dialog(connectorSizing = true));
  // *** MODIFIABLE PARAMETERS AND VARIABLES BEGIN ***
  Real maximumSpeed = 1 "maximum speed" annotation(Dialog(enable = true, group = "Maximum Speed"));
  Real arcWeightIn[nIn] = fill(1, nIn) "arc weights of input places" annotation(Dialog(enable = true, group = "Arc Weights"));
  Real arcWeightOut[nOut] = fill(1, nOut) "arc weights of output places" annotation(Dialog(enable = true, group = "Arc Weights"));
  // *** MODIFIABLE PARAMETERS AND VARIABLES END ***
  Boolean fire "Does the transition fire?";
  Real instantaneousSpeed "instantaneous speed";
  Real actualSpeed = if fire then instantaneousSpeed else 0.0;
  Interfaces.TransitionOut[nOut] outPlaces(each active = activation.active, each fire = fire, each enabledByInPlaces = true, arcWeight = arcWeightOut, each instSpeed = instantaneousSpeed, each prelimSpeed = preliminarySpeed, each maxSpeed = maximumSpeed, t = tOut, maxTokens = maxTokens, decreasingFactor=decreasingFactorOut, emptied = emptied, speedSum = speedSumOut)
    "connector for output places"                                                                                                     annotation(Placement(transformation(origin = {47, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {47, 0}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.TransitionIn[nIn] inPlaces(each active = activation.active, each fire = fire, arcWeight = arcWeightIn, each instSpeed = instantaneousSpeed, each prelimSpeed = preliminarySpeed, each maxSpeed = maximumSpeed, t = tIn, minTokens = minTokens, fed = fed, enable = enableIn, decreasingFactor=decreasingFactorIn, speedSum = speedSumIn)
    "connector for input places"                                                                                                     annotation(Placement(visible = true, transformation(origin = {-47, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-47, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Real tIn[nIn] "tokens of input places";
  Real tOut[nOut] "tokens of output places";
  Real minTokens[nIn] "minimum tokens of input places";
  Real maxTokens[nOut] "maximum tokens of output places";
  Real speedSumIn[nIn] "Input speeds of continuous input places";
  Real speedSumOut[nOut] "Output speeds of continuous output places";
  Real decreasingFactorIn[nIn] "decreasing factors of input places";
  Real decreasingFactorOut[nOut] "decreasing factors of output places";
  Boolean fed[nIn] "Are the input places fed by their input transitions?";
  Boolean emptied[nOut]
    "Are the output places emptied by their output transitions?";
  Boolean enableIn[nIn]
    "Is the transition enabled by all its discrete input transitions?";
  // *** BLOCKS BEGIN ***
  // since no events are generated within functions!!!
  Blocks.activationCon activation(nIn = nIn, nOut = nOut, tIn = tIn, tOut = tOut, arcWeightIn = arcWeightIn, arcWeightOut = arcWeightOut, minTokens = minTokens, maxTokens = maxTokens, fed = fed, emptied = emptied, testValue = inPlaces.testValue, arcType = inPlaces.arcType)
    "activation process";
  Real preliminarySpeed = Functions.preliminarySpeed(nIn=  nIn, nOut=  nOut, arcWeightIn=  arcWeightIn, arcWeightOut=  arcWeightOut, speedSumIn=  speedSumIn, speedSumOut=  speedSumOut, maximumSpeed=  maximumSpeed, weaklyInputActiveVec=  activation.weaklyInputActiveVec, weaklyOutputActiveVec=  activation.weaklyOutputActiveVec)
    "preliminary speed calculation";
  // *** BLOCKS END ***
equation
  // *** MAIN BEGIN ***
  fire = activation.active and not maximumSpeed <= 0 "firing process";
    instantaneousSpeed = max(min(min(min(decreasingFactorIn),min(decreasingFactorOut))*maximumSpeed, preliminarySpeed), 0.0)
    "instantaneous speed calculation";
  // *** MAIN END ***
  annotation(defaultComponentName = "T1", Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-40, 100}, {40, -100}}, lineColor = {0, 0, 0}, fillColor = DynamicSelect({255, 255, 255}, if fire then {255, 255, 0} else {255, 255, 255}),
            fillPattern =                                                                                                    FillPattern.Solid), Text(extent = {{-2, -116}, {-2, -144}}, lineColor = {0, 0, 0}, textString = DynamicSelect(" ", if animateSpeed == 1 and fire > 0.5 then if instantaneousSpeed > 0 then realString(instantaneousSpeed, 1, 2) else "0.0" else " ")), Text(extent = {{-4, 139}, {-4, 114}}, lineColor = {0, 0, 0}, textString = "%name")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end TC;
