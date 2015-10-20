within ConPNlib;
model PC "Continuous Place"
  Real t = if t_ < minMarks then minMarks else t_ "marking";
  Real tInflowSum(fixed = true, start = 0.0);
  Real tInflow[nIn](each fixed = true, each start = 0.0);
  Real tOutflowSum(fixed = true, start = 0.0);
  Real tOutflow[nOut](each fixed = true, each start = 0.0);
  parameter Integer nIn = 0 "number of input transitions" annotation(Dialog(connectorSizing = true));
  parameter Integer nOut = 0 "number of output transitions" annotation(Dialog(connectorSizing = true));
  // *** MODIFIABLE PARAMETERS AND VARIABLES BEGIN ***
  parameter Real startMarks = 0 "start marks" annotation(Dialog(enable = true, group = "Marks"));
  parameter Real minMarks(min=0) = 0 "minimum capacity" annotation(Dialog(enable = true, group = "Marks"));
  parameter Real maxMarks(min=minMarks) = ConPNlib.Constants.inf
    "maximum capacity"                                                           annotation(Dialog(enable = true, group = "Marks"));
  // *** MODIFIABLE PARAMETERS AND VARIABLES END ***
protected
  Real t_(start = startMarks, fixed = true) "marking";
  Real arcWeightIn[nIn] "weights of input arcs";
  Real arcWeightOut[nOut] "weights of output arcs";
  Real instSpeedIn[nIn] "instantaneous speed of input transitions";
  Real instSpeedOut[nOut] "instantaneous speed of output transitions";
  Real maxSpeedIn[nIn] "maximum speed of input transitions";
  Real maxSpeedOut[nOut] "maximum speed of output transitions";
  Real prelimSpeedIn[nIn] "preliminary speed of input transitions";
  Real prelimSpeedOut[nOut] "preliminary speed of output transitions";
  Boolean fireIn[nIn](each start = false, each fixed = true)
    "Does any input transition fire?";
  Boolean fireOut[nOut](each start = false, each fixed = true)
    "Does any output transition fire?";
  Boolean activeIn[nIn] "Are the input transitions active?";
  Boolean activeOut[nOut] "Are the output transitions active?";
  Boolean enabledByInPlaces[nIn]
    "Are the input transitions enabled by all their input places?";
  // *** BLOCKS BEGIN ***
  // since no events are generated within functions!!!
  Boolean feeding = Functions.anyTrue(pre(fireIn))
    "Is the place fed by input transitions?";
  Boolean emptying = Functions.anyTrue(pre(fireOut))
    "Is the place emptied by output transitions?";
  Real firingSumIn = Functions.firingSumCon(fire=fireIn, arcWeight=arcWeightIn, instSpeed=instSpeedIn)
    "firing sum calculation";
  Real firingSumOut = Functions.firingSumCon(fire=fireOut, arcWeight=  arcWeightOut, instSpeed=  instSpeedOut)
    "firing sum calculation";
  //decreasing factor calculation
  Real decFactorIn[nIn]= Functions.decreasingFactorIn(
    nIn=nIn,
    t=t_,
    maxMarks=maxMarks,
    speedOut=firingSumOut,
    maxSpeedIn=maxSpeedIn,
    prelimSpeedIn=prelimSpeedIn,
    arcWeightIn=arcWeightIn,
    firingIn=fireIn,
    firingOut=fireOut) "decreasing factors for input transitions";
  Real decFactorOut[nOut]= Functions.decreasingFactorOut(
    nOut=nOut,
    t=t_,
    minMarks=minMarks,
    speedIn=firingSumIn,
    maxSpeedOut=maxSpeedOut,
    prelimSpeedOut=prelimSpeedOut,
    arcWeightOut=arcWeightOut,
    firingIn=fireIn,
    firingOut=fireOut) "decreasing factors for output transitions";
  // *** BLOCKS END ***
public
  Interfaces.PlaceIn inTransition[nIn](each t = t_, each maxTokens = maxMarks, enable = activeIn, each emptied = emptying, decreasingFactor = decFactorIn, each speedSum = firingSumOut, fire = fireIn, active = activeIn, arcWeight = arcWeightIn, instSpeed = instSpeedIn, maxSpeed = maxSpeedIn, prelimSpeed = prelimSpeedIn, enabledByInPlaces = enabledByInPlaces)
    "connector for input transitions"                                                                                                     annotation(Placement(transformation(origin = {-93, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-93, 0}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.PlaceOut outTransition[nOut](each t = t_, each minTokens = minMarks, enable = activeOut, each arcType = ConPNlib.Types.ArcType.normal_arc, each testValue = -1.0, each fed = feeding, decreasingFactor=decFactorOut, each speedSum = firingSumIn, fire = fireOut, active = activeOut, arcWeight = arcWeightOut, instSpeed = instSpeedOut, maxSpeed = maxSpeedOut, prelimSpeed = prelimSpeedOut)
    "connector for output transitions"                                                                                                     annotation(Placement(transformation(origin = {93, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {93, 0}, extent = {{-10, -10}, {10, 10}})));
  //initial equation
  //  fireIn = pre(fireIn);
  //  fireOut = pre(fireOut);
equation
  // *** MAIN BEGIN ***
  der(tInflowSum) = firingSumIn;
  // der(tInflow) = arcWeightIn .* instSpeedIn;
  for i in 1:nIn loop
    der(tInflow[i]) = if pre(fireIn[i]) then arcWeightIn[i] * instSpeedIn[i] else 0.0;
  end for;
  der(tOutflowSum) = firingSumOut;
  // der(tOutflow) = arcWeightOut .* instSpeedOut;
  for i in 1:nOut loop
    der(tOutflow[i]) = if pre(fireOut[i]) then arcWeightOut[i] * instSpeedOut[i] else 0.0;
  end for;
  der(t_) = firingSumIn - firingSumOut "calculation of continuous mark change";
  // *** MAIN END ***
  // *** ERROR MESSENGES BEGIN ***
  assert(startMarks >= minMarks and startMarks <= maxMarks, "minMarks <= startMarks <= maxMarks");
  // *** ERROR MESSENGES END ***
  annotation(defaultComponentName = "P1", Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false), graphics), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 0.1, grid = {2, 2}), graphics={  Ellipse(fillColor = {255, 255, 255},
            fillPattern =                                                                                                    FillPattern.Solid, extent = {{-86, 86}, {86, -86}}, endAngle = 360), Ellipse(fillColor = {255, 255, 255},
            fillPattern =                                                                                                    FillPattern.Solid, extent = {{-79, 79}, {79, -79}}, endAngle = 360), Text(origin = {0.5, -0.5}, extent = {{-1.5, 25.5}, {-1.5, -21.5}}, textString = DynamicSelect("%startMarks", if t > 0 then realString(t, 1, 2) else "0.0")), Text(extent = {{-74, -103}, {-74, -128}}, textString = "%name")}));
end PC;
