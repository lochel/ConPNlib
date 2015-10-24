within ConPNlib.Examples;
model Test11
  inner Settings settings
    annotation (Placement(transformation(extent={{72,12},{80,20}})));
  ConPNlib.PC 'P1'(nOut=1, startMarks=1.5) annotation (Placement(visible=true,
        transformation(
        origin={-60,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ConPNlib.TC 'T1'(nOut=1, nIn=1) annotation (Placement(visible=true,
        transformation(
        origin={-30,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ConPNlib.PC 'P2'(nOut=1, nIn=1) annotation (Placement(visible=true,
        transformation(
        origin={0,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  ConPNlib.TC 'T2'(
    nIn=1,
    nOut=1,
    maximumSpeed=0.5 + time) annotation (Placement(visible=true,
        transformation(
        origin={30,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  PC 'P3'(nIn=1)
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
equation
  connect('P1'.outTransition[1], 'T1'.inPlaces[1])
    annotation (Line(points={{-50.7,0},{-42,0},{-34.7,0}}));
  connect('P2'.inTransition[1], 'T1'.outPlaces[1])
    annotation (Line(points={{-9.3,0},{-9.3,0},{-25.3,0}}));
  connect('P2'.outTransition[1], 'T2'.inPlaces[1])
    annotation (Line(points={{9.3,0},{25.3,0}}));
  connect('T2'.outPlaces[1], 'P3'.inTransition[1]) annotation (Line(
      points={{34.7,0},{50.7,0}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation(experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-006), Diagram(coordinateSystem(extent={{-80,-20},
            {80,20}}, preserveAspectRatio=false, initialScale = 0.1, grid = {2, 2}), graphics));
end Test11;
