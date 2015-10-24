within ConPNlib;
model Settings "Global Settings for Animation and Display"
  parameter Boolean showTokenFlow = false annotation(Dialog(enable = true, group = "Token flow"));
  annotation(defaultComponentName = "settings",defaultComponentPrefixes = "inner",missingInnerMessage = "The settings object is missing",
              Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}),
                       graphics={Rectangle(
          extent={{-98,98},{98,-98}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255}),
                              Text(
          extent={{0,22},{0,-22}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="SETTINGS")}),      Diagram(coordinateSystem(
          preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics));
end Settings;
