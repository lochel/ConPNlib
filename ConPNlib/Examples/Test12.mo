within ConPNlib.Examples;
model Test12 "conflict"

  ConPNlib.TC T1(nOut=1)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  ConPNlib.TC T2(nIn=1, nOut=1)
    annotation (Placement(transformation(extent={{0,10},{20,30}})));
  ConPNlib.TC T3(nIn=1, nOut=1)
    annotation (Placement(transformation(extent={{0,-30},{20,-10}})));
  ConPNlib.PC P1(nIn=1, nOut=2)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  ConPNlib.PC P2(nIn=1)
    annotation (Placement(transformation(extent={{30,10},{50,30}})));
  ConPNlib.PC P3(nIn=1)
    annotation (Placement(transformation(extent={{30,-30},{50,-10}})));
equation
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation (Line(
      points={{-45.3,0},{-29.3,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(P1.outTransition[1], T2.inPlaces[1]) annotation (Line(
      points={{-10.7,-0.5},{0,-0.5},{0,20},{5.3,20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(P1.outTransition[2], T3.inPlaces[1]) annotation (Line(
      points={{-10.7,0.5},{0,0.5},{0,-20},{5.3,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T3.outPlaces[1], P3.inTransition[1]) annotation (Line(
      points={{14.7,-20},{30.7,-20}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T2.outPlaces[1], P2.inTransition[1]) annotation (Line(
      points={{14.7,20},{30.7,20}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},
            {60,40}}),         graphics), Icon(coordinateSystem(extent={{-60,-40},
            {60,40}})));
end Test12;
