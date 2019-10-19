    block Tabular "Tabular function"
      parameter Real x_vals[:] = {0} "Independent variable data points";
      parameter Real y_vals[:] = {0} "Dependent variable data points";
      Modelica.Blocks.Interfaces.RealInput u "Input variable" annotation(
        Placement(visible = true, transformation(origin = {-80.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-80.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Output variable" annotation(
        Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
    equation
      y = Functions.Utilities.Piecewise(x = u, x_grid = x_vals, y_grid = y_vals);
      annotation(
        Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Line(visible = true, points = {{-70.0, 0.0}, {-44.0, 0.0}}, color = {160, 160, 160}), Line(visible = true, points = {{28.0, 0.0}, {100.0, 0.0}}, color = {160, 160, 160}), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {160, 160, 160}, extent = {{-72.0, 2.0}, {-46.0, 20.0}}, textString = "u", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {160, 160, 160}, extent = {{52.0, 2.0}, {78.0, 20.0}}, textString = "y", fontName = "Arial"), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, 40.0}, {-8.0, 60.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, 20.0}, {-8.0, 40.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -2.0}, {-8.0, 20.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -22.0}, {-8.0, 0.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -42.0}, {-8.0, -20.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -60.0}, {-8.0, -40.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, 40.0}, {28.0, 60.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, 20.0}, {28.0, 40.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -2.0}, {28.0, 20.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -20.0}, {28.0, 0.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -40.0}, {28.0, -20.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -60.0}, {28.0, -40.0}})}),
        Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, 40.0}, {-8.0, 60.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, 20.0}, {-8.0, 40.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -2.0}, {-8.0, 20.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -22.0}, {-8.0, 0.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -42.0}, {-8.0, -20.0}}), Rectangle(visible = true, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-44.0, -60.0}, {-8.0, -40.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, 40.0}, {28.0, 60.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, 20.0}, {28.0, 40.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -2.0}, {28.0, 20.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -20.0}, {28.0, 0.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -40.0}, {28.0, -20.0}}), Rectangle(visible = true, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8.0, -60.0}, {28.0, -40.0}}), Line(visible = true, points = {{-70.0, 80.0}, {-70.0, -80.0}, {40.0, -80.0}, {100.0, 0.0}, {40.0, 80.0}, {-70.0, 80.0}}, color = {0, 0, 255}, thickness = 0.5), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, 80.0}, {100.0, 122.0}}, textString = "%name", fontName = "Arial")}),
        Documentation(info = "<html>
This is a tabular function, as it is frequently used in System Dynamics to represent measured or estimated non-linear relationships.
</html>"));
    end Tabular;