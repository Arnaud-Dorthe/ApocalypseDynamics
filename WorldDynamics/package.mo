  package WorldDynamics "World models"
    extends Modelica.Icons.Example;

    package World2 "Forrester's World Model"
      extends Modelica.Icons.Example;

      model Scenario_1 "1st Scenario"
        parameter Real Population_0 = 1650000000.0 "World population in 1900";
        parameter Real Pollution_0 = 200000000.0 "Pollution in 1900";
        parameter Real Nat_Resources_0(unit = "ton") = 900000000000.0 "Unrecoverable natural resources in 1900";
        parameter Real Cap_Invest_0(unit = "dollar") = 400000000.0 "Capital investment in 1900";
        parameter Real CIAF_0 = 0.2 "Proportion of capital investment in agriculture in 1900";
        parameter Real BRN(unit = "1/yr") = 0.04 "Normal birth rate";
        parameter Real CIAFN(unit = "dollar") = 0.3 "CIAF normalization";
        parameter Real CIAFT(unit = "yr") = 15.0 "CIAF time constant";
        parameter Real CIDN(unit = "dollar/yr") = 0.025 "Normal capital discard";
        parameter Real CIGN(unit = "dollar/yr") = 0.05 "Normal capital generation";
        parameter Real DRN(unit = "1/yr") = 0.028 "Normal death rate";
        parameter Real ECIRN(unit = "dollar") = 1.0 "Capital normalization";
        parameter Real FC(unit = "kg/yr") = 1.0 "Food coefficient";
        parameter Real FN(unit = "kg/yr") = 1.0 "Food normalization";
        parameter Real Land_Area(unit = "hectare") = 135000000.0 "Area of arable land";
        parameter Real NRI(unit = "ton") = 900000000000.0 "Initial natural resources";
        parameter Real NRUN(unit = "1/yr") = 1.0 "Normal resource utilization";
        parameter Real POLN(unit = "1/yr") = 1.0 "Normal pollution";
        parameter Real POLS = 3599900000.0 "Standard pollution";
        parameter Real Pop_dens_norm(unit = "1/hectare") = 26.5 "Normal population density";
        parameter Real QLS = 1.0 "Standard quality of life";
        output Real Pop "World population";
        output Real Pol "Pollution";
        output Real Pol_rat "Pollution ratio";
        output Real Cap_inv(unit = "dollar") "Capital investment";
        output Real Qual_life "Quality of life";
        output Real Nat_res(unit = "ton") "Natural unrecoverable resources";
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-150.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Birth_Rate annotation(
          Placement(visible = true, transformation(origin = {-120.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Population(x0 = Population_0) annotation(
          Placement(visible = true, transformation(origin = {-70.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Death_Rate annotation(
          Placement(visible = true, transformation(origin = {-20.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {10.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source2 annotation(
          Placement(visible = true, transformation(origin = {50.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Generation annotation(
          Placement(visible = true, transformation(origin = {80.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Natural_Resources(x0 = Nat_Resources_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Depletion annotation(
          Placement(visible = true, transformation(origin = {180.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink2 annotation(
          Placement(visible = true, transformation(origin = {210.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Gen_Const(k = 0) annotation(
          Placement(visible = true, transformation(origin = {80.0, 101.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular BRMM(x_vals = 0:5, y_vals = {1.2, 1.0, 0.85, 0.75, 0.7, 0.7}) annotation(
          Placement(visible = true, transformation(origin = {-105.0, 185.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular DRMM(x_vals = 0:0.5:5, y_vals = {3.0, 1.8, 1.0, 0.8, 0.7, 0.6, 0.53, 0.5, 0.5, 0.5, 0.5}) annotation(
          Placement(visible = true, transformation(origin = {51.0, 171.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain BR_norm(k = BRN) annotation(
          Placement(visible = true, transformation(origin = {-135.0, 103.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_5 Prod_5_1 annotation(
          Placement(visible = true, transformation(origin = {-160.0, 80.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain DR_norm(k = DRN) annotation(
          Placement(visible = true, transformation(origin = {-3.0, 103.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_5 Prod_5_2 annotation(
          Placement(visible = true, transformation(origin = {20.0, 79.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular BRFM(x_vals = 0:4, y_vals = {0.0, 1.0, 1.6, 1.9, 2.0}) annotation(
          Placement(visible = true, transformation(origin = {-176.0, 35.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular BRPM(x_vals = 0:10:60, y_vals = {1.02, 0.9, 0.7, 0.4, 0.25, 0.15, 0.1}) annotation(
          Placement(visible = true, transformation(origin = {-135.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular BRCM(x_vals = 0:5, y_vals = {1.05, 1.0, 0.9, 0.7, 0.6, 0.55}) annotation(
          Placement(visible = true, transformation(origin = {-95.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRCM(x_vals = 0:5, y_vals = {0.9, 1.0, 1.2, 1.5, 1.9, 3.0}) annotation(
          Placement(visible = true, transformation(origin = {-25.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRPM(x_vals = 0:10:60, y_vals = {0.92, 1.3, 2.0, 3.2, 4.8, 6.8, 9.2}) annotation(
          Placement(visible = true, transformation(origin = {15.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRFM(x_vals = 0:0.25:2, y_vals = {30.0, 3.0, 2.0, 1.4, 1.0, 0.7, 0.6, 0.5, 0.5}) annotation(
          Placement(visible = true, transformation(origin = {55.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Auxiliary.Gain Crowd_Rat(k = 1.0 / (Land_Area * Pop_dens_norm)) annotation(
          Placement(visible = true, transformation(origin = {-60.0, 35.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Gain NR_norm(k = NRUN) annotation(
          Placement(visible = true, transformation(origin = {163.0, 103.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_1 annotation(
          Placement(visible = true, transformation(origin = {140.0, 80.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular NRMM(x_vals = 0:10, y_vals = {0.0, 1.0, 1.8, 2.4, 2.9, 3.3, 3.6, 3.8, 3.9, 3.95, 4.0}) annotation(
          Placement(visible = true, transformation(origin = {201.0, 80.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Sources.Source Source3 annotation(
          Placement(visible = true, transformation(origin = {50.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CI_Generation annotation(
          Placement(visible = true, transformation(origin = {80.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Capital_Investment(x0 = Cap_Invest_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CI_Discard annotation(
          Placement(visible = true, transformation(origin = {180.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink3 annotation(
          Placement(visible = true, transformation(origin = {210.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIG_norm(k = CIGN) annotation(
          Placement(visible = true, transformation(origin = {65.0, -77.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_2 annotation(
          Placement(visible = true, transformation(origin = {40.0, -100.0}, extent = {{-14.0, -16.0}, {14.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CID_norm(k = CIDN) annotation(
          Placement(visible = true, transformation(origin = {165.0, -77.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular CIM(x_vals = 0:5, y_vals = {0.1, 1.0, 1.8, 2.4, 2.8, 3.0}) annotation(
          Placement(visible = true, transformation(origin = {113.0, -100.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain MSL(k = 1.0 / ECIRN) annotation(
          Placement(visible = true, transformation(origin = {277.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain NRFR(k = 1.0 / NRI) annotation(
          Placement(visible = true, transformation(origin = {137.0, 51.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain ECIR(k = 1.0 / (1.0 - CIAFN)) annotation(
          Placement(visible = true, transformation(origin = {243.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_1 annotation(
          Placement(visible = true, transformation(origin = {215.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular NREM(x_vals = 0:0.25:1, y_vals = {0.0, 0.15, 0.5, 0.85, 1.0}) annotation(
          Placement(visible = true, transformation(origin = {175.0, 51.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -180)));
        Modelica.Blocks.Math.Division CIR annotation(
          Placement(visible = true, transformation(origin = {107.0, 6.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source4 annotation(
          Placement(visible = true, transformation(origin = {-150.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 P_Generation annotation(
          Placement(visible = true, transformation(origin = {-120.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Pollution(x0 = Pollution_0) annotation(
          Placement(visible = true, transformation(origin = {-70.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 P_Absorption annotation(
          Placement(visible = true, transformation(origin = {-20.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink4 annotation(
          Placement(visible = true, transformation(origin = {10.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Linear NotCIAF(m = -1.0, b = 1.0) annotation(
          Placement(visible = true, transformation(origin = {189.0, 10.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain Pol_Ratio(k = 1.0 / POLS) annotation(
          Placement(visible = true, transformation(origin = {-29.0, -95.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular FCM(x_vals = 0:5, y_vals = {2.4, 1.0, 0.6, 0.4, 0.3, 0.2}) annotation(
          Placement(visible = true, transformation(origin = {-85.0, -47.0}, extent = {{-15.0, 15.0}, {15.0, -15.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_2 annotation(
          Placement(visible = true, transformation(origin = {-117.0, -66.0}, extent = {{15.0, -14.0}, {-15.0, 14.0}}, rotation = 90)));
        SystemDynamics.Auxiliary.Gain Food_Ratio(k = FC / FN) annotation(
          Placement(visible = true, transformation(origin = {-149.0, -66.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source5 annotation(
          Placement(visible = true, transformation(origin = {50.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CIAFG annotation(
          Placement(visible = true, transformation(origin = {80.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level CIAF(x0 = CIAF_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CIAFD annotation(
          Placement(visible = true, transformation(origin = {180.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink5 annotation(
          Placement(visible = true, transformation(origin = {210.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIAF_D(k = 1.0 / CIAFT) annotation(
          Placement(visible = true, transformation(origin = {163.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIAF_G(k = 1.0 / CIAFT) annotation(
          Placement(visible = true, transformation(origin = {95.0, -180.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_3 annotation(
          Placement(visible = true, transformation(origin = {120.0, -230.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division P_Abs annotation(
          Placement(visible = true, transformation(origin = {-43.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain Pol_norm(k = POLN) annotation(
          Placement(visible = true, transformation(origin = {-135.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_4 annotation(
          Placement(visible = true, transformation(origin = {-160.0, -220.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular POLCM(x_vals = 0:5, y_vals = {0.05, 1.0, 3.0, 5.4, 7.4, 8.0}) annotation(
          Placement(visible = true, transformation(origin = {-117.0, -220.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular POLAT(x_vals = 0:10:60, y_vals = {0.6, 2.5, 5.0, 8.0, 11.5, 15.5, 20.0}) annotation(
          Placement(visible = true, transformation(origin = {-39.0, -220.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular CFIFR(x_vals = 0:0.5:2, y_vals = {1.0, 0.6, 0.3, 0.15, 0.1}) annotation(
          Placement(visible = true, transformation(origin = {69.0, -230.0}, extent = {{15.0, 16.0}, {-15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular FPM(x_vals = 0:10:60, y_vals = {1.02, 0.9, 0.65, 0.35, 0.2, 0.1, 0.05}) annotation(
          Placement(visible = true, transformation(origin = {-33.0, -66.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_5 annotation(
          Placement(visible = true, transformation(origin = {229.0, -200.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIRA(k = 1.0 / CIAFN) annotation(
          Placement(visible = true, transformation(origin = {255.0, -225.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular FPCI(x_vals = 0:6, y_vals = {0.5, 1.0, 1.4, 1.7, 1.9, 2.05, 2.2}) annotation(
          Placement(visible = true, transformation(origin = {-153.0, -107.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular CIQR(x_vals = 0:0.5:2, y_vals = {0.7, 0.8, 1.0, 1.5, 2.0}) annotation(
          Placement(visible = true, transformation(origin = {167.0, -230.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        Modelica.Blocks.Math.Division QLMF annotation(
          Placement(visible = true, transformation(origin = {315.0, -223.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular QLM(x_vals = 0:5, y_vals = {0.2, 1.0, 1.7, 2.3, 2.7, 2.9}) annotation(
          Placement(visible = true, transformation(origin = {319.0, -169.0}, extent = {{15.0, 17.0}, {-15.0, -17.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular QLF(x_vals = 0:4, y_vals = {0.0, 1.0, 1.8, 2.4, 2.7}) annotation(
          Placement(visible = true, transformation(origin = {381.0, -232.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_4 Prod_4_1 annotation(
          Placement(visible = true, transformation(origin = {375.0, -163.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular QLC(x_vals = 0:0.5:5, y_vals = {2.0, 1.3, 1.0, 0.75, 0.55, 0.45, 0.38, 0.3, 0.25, 0.22, 0.2}) annotation(
          Placement(visible = true, transformation(origin = {335.0, -113.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular QLP(x_vals = 0:10:60, y_vals = {1.04, 0.85, 0.6, 0.3, 0.15, 0.05, 0.02}) annotation(
          Placement(visible = true, transformation(origin = {375.0, -113.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Gain Quality_of_Life(k = QLS) annotation(
          Placement(visible = true, transformation(origin = {412.0, -163.0}, extent = {{-20.0, -21.0}, {20.0, 21.0}}, rotation = 0)));
      equation
        connect(QLP.y, Prod_4_1.u1) annotation(
          Line(visible = true, points = {{375.0, -96.5}, {375.0, -139.75}, {375.0, -139.75}, {375.0, -152.5}}, color = {0, 0, 191}));
        connect(QLC.y, Prod_4_1.u2) annotation(
          Line(visible = true, points = {{335.0, -96.5}, {335.0, -157.0}, {366.6, -157.0}}, color = {0, 0, 191}));
        connect(Prod_4_1.y, Quality_of_Life.u) annotation(
          Line(visible = true, points = {{385.5, -163.0}, {398.0, -163.0}}, color = {0, 0, 191}));
        connect(QLF.y, Prod_4_1.u4) annotation(
          Line(visible = true, points = {{364.5, -232.0}, {356.0, -232.0}, {356.0, -190.0}, {375.0, -190.0}, {375.0, -173.5}}, color = {0, 0, 191}));
        connect(QLM.y, Prod_4_1.u3) annotation(
          Line(visible = true, points = {{335.5, -169.0}, {366.6, -169.0}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, BRFM.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-176.0, -66.0}, {-176.0, 22.2}}, color = {0, 0, 191}));
        connect(BRFM.y, Prod_5_1.u2) annotation(
          Line(visible = true, points = {{-176.0, 52.6}, {-176.0, 60.0}, {-167.36, 60.0}, {-167.36, 72.0}}, color = {0, 0, 191}));
        connect(BRPM.u, QLP.u) annotation(
          Line(visible = true, points = {{-135.0, 23.0}, {-135.0, -20.0}, {-214.0, -20.0}, {-214.0, 214.0}, {375.0, 214.0}, {375.0, -125.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, BRPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, -20.0}, {-135.0, -20.0}, {-135.0, 23.0}}, color = {0, 0, 191}));
        connect(BRPM.y, Prod_5_1.u3) annotation(
          Line(visible = true, points = {{-135.0, 51.5}, {-135.0, 60.0}, {-160.0, 60.0}, {-160.0, 68.8}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, BRCM.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-95.0, 8.0}, {-95.0, 23.0}}, color = {0, 0, 191}));
        connect(BRCM.y, Prod_5_1.u4) annotation(
          Line(visible = true, points = {{-95.0, 51.5}, {-95.0, 66.0}, {-152.64, 66.0}, {-152.64, 72.0}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, DRCM.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-25.0, 8.0}, {-25.0, 23.0}}, color = {0, 0, 191}));
        connect(DRCM.y, Prod_5_2.u2) annotation(
          Line(visible = true, points = {{-25.0, 51.5}, {-25.0, 60.0}, {12.64, 60.0}, {12.64, 71.5}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, DRPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, 8.0}, {15.0, 8.0}, {15.0, 23.0}}, color = {0, 0, 191}));
        connect(DRPM.y, Prod_5_2.u3) annotation(
          Line(visible = true, points = {{15.0, 51.5}, {15.0, 60.0}, {20.0, 60.0}, {20.0, 68.5}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, DRFM.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-176.0, -66.0}, {-176.0, 0.0}, {55.0, 0.0}, {55.0, 23.0}}, color = {0, 0, 191}));
        connect(DRFM.y, Prod_5_2.u4) annotation(
          Line(visible = true, points = {{55.0, 51.5}, {55.0, 60.0}, {27.36, 60.0}, {27.36, 71.5}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, QLC.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-206.0, 8.0}, {-206.0, 208.0}, {335.0, 208.0}, {335.0, -125.0}}, color = {0, 0, 191}));
        connect(FCM.u, Crowd_Rat.y) annotation(
          Line(visible = true, points = {{-73.0, -47.0}, {-60.0, -47.0}, {-60.0, 23.8}}, color = {0, 0, 191}));
        connect(Crowd_Rat.u, Population.y3) annotation(
          Line(visible = true, points = {{-60.0, 46.2}, {-60.0, 66.0}, {-70.0, 66.0}, {-70.0, 127.0}}, color = {0, 0, 191}));
        connect(Prod_2_5.u2, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{239.5, -200.0}, {260.0, -200.0}, {260.0, -20.0}, {160.0, -20.0}, {160.0, 30.0}, {203.8, 30.0}}, color = {0, 0, 191}));
        connect(Prod_3_1.y, ECIR.u) annotation(
          Line(visible = true, points = {{226.2, 30.0}, {232.5, 30.0}}, color = {0, 0, 191}));
        connect(CIR.y, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{90.5, 6.0}, {80.0, 6.0}, {80.0, 30.0}, {203.8, 30.0}}, color = {0, 0, 191}));
        connect(NotCIAF.y, Prod_3_1.u3) annotation(
          Line(visible = true, points = {{202.5, 10.0}, {215.0, 10.0}, {215.0, 19.5}}, color = {0, 0, 191}));
        connect(Prod_3_1.u1, NREM.y) annotation(
          Line(visible = true, points = {{215.0, 40.5}, {215.0, 51.0}, {191.5, 51.0}}, color = {0, 0, 191}));
        connect(QLF.y, QLMF.u2) annotation(
          Line(visible = true, points = {{364.5, -232.0}, {333.0, -232.0}}, color = {0, 0, 191}));
        connect(QLMF.y, CIQR.u) annotation(
          Line(visible = true, points = {{298.5, -223.0}, {290.0, -223.0}, {290.0, -256.0}, {190.0, -256.0}, {190.0, -230.0}, {179.0, -230.0}}, color = {0, 0, 191}));
        connect(P_Abs.u1, Pollution.y3) annotation(
          Line(visible = true, points = {{-61.0, -170.4}, {-70.0, -170.4}, {-70.0, -153.0}}, color = {0, 0, 191}));
        connect(CIG_norm.y, CI_Generation.u) annotation(
          Line(visible = true, points = {{75.5, -77.0}, {80.0, -77.0}, {80.0, -61.0}}, color = {0, 0, 191}));
        connect(CI_Discard.y1, Sink3.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, -40.0}, {199.0, -40.0}}, color = {191, 0, 191}));
        connect(Capital_Investment.u2, CI_Discard.y) annotation(
          Line(visible = true, points = {{152.0, -40.0}, {170.0, -40.0}}, color = {191, 0, 191}));
        connect(Source3.MassInPort1, CI_Generation.y) annotation(
          Line(visible = true, points = {{61.0, -40.0}, {70.0, -40.0}}, color = {191, 0, 191}));
        connect(CI_Generation.y1, Capital_Investment.u1) annotation(
          Line(visible = true, points = {{90.0, -40.0}, {108.0, -40.0}}, color = {191, 0, 191}));
        connect(FPM.u, POLAT.u) annotation(
          Line(visible = true, points = {{-21.0, -66.0}, {0.0, -66.0}, {0.0, -220.0}, {-27.0, -220.0}}, color = {0, 0, 191}));
        connect(CIRA.y, FPCI.u) annotation(
          Line(visible = true, points = {{265.5, -225.0}, {280.0, -225.0}, {280.0, -252.0}, {-210.0, -252.0}, {-210.0, -107.0}, {-165.0, -107.0}}, color = {0, 0, 191}));
        connect(Prod_2_1.u1, Population.y1) annotation(
          Line(visible = true, points = {{128.8, 80.0}, {100.0, 80.0}, {100.0, 194.0}, {-46.0, 194.0}, {-46.0, 151.0}, {-53.0, 151.0}}, color = {0, 0, 191}));
        connect(NRMM.u, DRMM.u) annotation(
          Line(visible = true, points = {{213.0, 80.0}, {300.0, 80.0}, {300.0, 171.0}, {63.0, 171.0}}, color = {0, 0, 191}));
        connect(NRMM.u, BRMM.u) annotation(
          Line(visible = true, points = {{213.0, 80.0}, {300.0, 80.0}, {300.0, 200.0}, {-70.0, 200.0}, {-70.0, 185.0}, {-93.0, 185.0}}, color = {0, 0, 191}));
        connect(CFIFR.u, QLF.u) annotation(
          Line(visible = true, points = {{57.0, -230.0}, {40.0, -230.0}, {40.0, -260.0}, {400.0, -260.0}, {400.0, -232.0}, {393.0, -232.0}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, QLF.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-220.0, -66.0}, {-220.0, -260.0}, {400.0, -260.0}, {400.0, -232.0}, {393.0, -232.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, FPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, -66.0}, {-21.0, -66.0}}, color = {0, 0, 191}));
        connect(CIR.y, POLCM.u) annotation(
          Line(visible = true, points = {{90.5, 6.0}, {80.0, 6.0}, {80.0, -6.0}, {10.0, -6.0}, {10.0, -116.0}, {-100.0, -116.0}, {-100.0, -220.0}, {-105.0, -220.0}}, color = {0, 0, 191}));
        connect(QLM.u, CIM.u) annotation(
          Line(visible = true, points = {{307.0, -169.0}, {300.0, -169.0}, {300.0, -100.0}, {125.0, -100.0}}, color = {0, 0, 191}));
        connect(QLM.y, QLMF.u1) annotation(
          Line(visible = true, points = {{335.5, -169.0}, {344.0, -169.0}, {344.0, -214.0}, {333.0, -214.0}}, color = {0, 0, 191}));
        connect(MSL.y, QLM.u) annotation(
          Line(visible = true, points = {{287.5, 30.0}, {300.0, 30.0}, {300.0, -169.0}, {307.0, -169.0}}, color = {0, 0, 191}));
        connect(NRMM.y, Prod_2_1.u2) annotation(
          Line(visible = true, points = {{184.5, 80.0}, {151.2, 80.0}}, color = {0, 0, 191}));
        connect(MSL.y, NRMM.u) annotation(
          Line(visible = true, points = {{287.5, 30.0}, {300.0, 30.0}, {300.0, 80.0}, {213.0, 80.0}}, color = {0, 0, 191}));
        connect(ECIR.y, MSL.u) annotation(
          Line(visible = true, points = {{253.5, 30.0}, {266.5, 30.0}}, color = {0, 0, 191}));
        connect(NotCIAF.u, CIAF.y1) annotation(
          Line(visible = true, points = {{175.5, 10.0}, {168.0, 10.0}, {168.0, -8.0}, {240.0, -8.0}, {240.0, -110.0}, {154.0, -110.0}, {154.0, -129.0}, {147.0, -129.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, CIR.u2) annotation(
          Line(visible = true, points = {{30.2, -100.0}, {20.0, -100.0}, {20.0, -14.0}, {140.0, -14.0}, {140.0, -3.6}, {125.0, -3.6}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, Population.y1) annotation(
          Line(visible = true, points = {{30.2, -100.0}, {20.0, -100.0}, {20.0, -14.0}, {320.0, -14.0}, {320.0, 194.0}, {-46.0, 194.0}, {-46.0, 151.0}, {-53.0, 151.0}}, color = {0, 0, 191}));
        connect(Prod_2_4.u1, Population.y) annotation(
          Line(visible = true, points = {{-171.2, -220.0}, {-200.0, -220.0}, {-200.0, 164.0}, {-94.0, 164.0}, {-94.0, 151.0}, {-87.0, 151.0}}, color = {0, 0, 191}));
        connect(CID_norm.u, Capital_Investment.y2) annotation(
          Line(visible = true, points = {{154.5, -77.0}, {145.0, -77.0}, {145.0, -53.0}}, color = {0, 0, 191}));
        connect(CID_norm.y, CI_Discard.u) annotation(
          Line(visible = true, points = {{175.5, -77.0}, {180.0, -77.0}, {180.0, -61.0}}, color = {0, 0, 191}));
        connect(CIM.y, Prod_2_2.u2) annotation(
          Line(visible = true, points = {{96.5, -100.0}, {49.8, -100.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.y, CIG_norm.u) annotation(
          Line(visible = true, points = {{40.0, -88.8}, {40.0, -77.0}, {54.5, -77.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.u, Pollution.y1) annotation(
          Line(visible = true, points = {{-39.5, -95.0}, {-46.0, -95.0}, {-46.0, -129.0}, {-53.0, -129.0}}, color = {0, 0, 191}));
        connect(POLCM.y, Prod_2_4.u2) annotation(
          Line(visible = true, points = {{-133.5, -220.0}, {-148.8, -220.0}}, color = {0, 0, 191}));
        connect(Prod_2_4.y, Pol_norm.u) annotation(
          Line(visible = true, points = {{-160.0, -208.8}, {-160.0, -180.0}, {-145.5, -180.0}}, color = {0, 0, 191}));
        connect(Pol_norm.y, P_Generation.u) annotation(
          Line(visible = true, points = {{-124.5, -180.0}, {-120.0, -180.0}, {-120.0, -161.0}}, color = {0, 0, 191}));
        connect(POLAT.y, P_Abs.u2) annotation(
          Line(visible = true, points = {{-55.5, -220.0}, {-70.0, -220.0}, {-70.0, -189.6}, {-61.0, -189.6}}, color = {0, 0, 191}));
        connect(P_Abs.y, P_Absorption.u) annotation(
          Line(visible = true, points = {{-26.5, -180.0}, {-20.0, -180.0}, {-20.0, -161.0}}, color = {0, 0, 191}));
        connect(CFIFR.y, Prod_2_3.u1) annotation(
          Line(visible = true, points = {{85.5, -230.0}, {108.8, -230.0}}, color = {0, 0, 191}));
        connect(CIQR.y, Prod_2_3.u2) annotation(
          Line(visible = true, points = {{150.5, -230.0}, {131.2, -230.0}}, color = {0, 0, 191}));
        connect(CIAF_G.y, CIAFG.u) annotation(
          Line(visible = true, points = {{84.5, -180.0}, {80.0, -180.0}, {80.0, -161.0}}, color = {0, 0, 191}));
        connect(CIAF_G.u, Prod_2_3.y) annotation(
          Line(visible = true, points = {{105.5, -180.0}, {120.0, -180.0}, {120.0, -218.8}}, color = {0, 0, 191}));
        connect(CIRA.u, Prod_2_5.y) annotation(
          Line(visible = true, points = {{244.5, -225.0}, {229.0, -225.0}, {229.0, -211.2}}, color = {0, 0, 191}));
        connect(Prod_2_5.u1, CIAF.y3) annotation(
          Line(visible = true, points = {{218.5, -200.0}, {130.0, -200.0}, {130.0, -153.0}}, color = {0, 0, 191}));
        connect(CIAF_D.u, CIAF.y2) annotation(
          Line(visible = true, points = {{152.5, -180.0}, {145.0, -180.0}, {145.0, -153.0}}, color = {0, 0, 191}));
        connect(CIAF_D.y, CIAFD.u) annotation(
          Line(visible = true, points = {{173.5, -180.0}, {180.0, -180.0}, {180.0, -161.0}}, color = {0, 0, 191}));
        connect(CIAFD.y1, Sink5.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, -140.0}, {199.0, -140.0}}, color = {191, 0, 191}));
        connect(CIAF.u2, CIAFD.y) annotation(
          Line(visible = true, points = {{152.0, -140.0}, {170.0, -140.0}}, color = {191, 0, 191}));
        connect(CIAFG.y1, CIAF.u1) annotation(
          Line(visible = true, points = {{90.0, -140.0}, {108.0, -140.0}}, color = {191, 0, 191}));
        connect(Source5.MassInPort1, CIAFG.y) annotation(
          Line(visible = true, points = {{61.0, -140.0}, {70.0, -140.0}}, color = {191, 0, 191}));
        connect(P_Absorption.y1, Sink4.MassInPort1) annotation(
          Line(visible = true, points = {{-10.0, -140.0}, {-1.0, -140.0}}, color = {191, 0, 191}));
        connect(Pollution.u2, P_Absorption.y) annotation(
          Line(visible = true, points = {{-48.0, -140.0}, {-30.0, -140.0}}, color = {191, 0, 191}));
        connect(P_Generation.y1, Pollution.u1) annotation(
          Line(visible = true, points = {{-110.0, -140.0}, {-92.0, -140.0}}, color = {191, 0, 191}));
        connect(Source4.MassInPort1, P_Generation.y) annotation(
          Line(visible = true, points = {{-139.0, -140.0}, {-130.0, -140.0}}, color = {191, 0, 191}));
        connect(FPCI.y, Prod_3_2.u3) annotation(
          Line(visible = true, points = {{-136.5, -107.0}, {-117.0, -107.0}, {-117.0, -76.5}}, color = {0, 0, 191}));
        connect(FPM.y, Prod_3_2.u2) annotation(
          Line(visible = true, points = {{-49.5, -66.0}, {-107.2, -66.0}}, color = {0, 0, 191}));
        connect(Prod_3_2.u1, FCM.y) annotation(
          Line(visible = true, points = {{-117.0, -55.5}, {-117.0, -47.0}, {-101.5, -47.0}}, color = {0, 0, 191}));
        connect(Prod_3_2.y, Food_Ratio.u) annotation(
          Line(visible = true, points = {{-126.8, -66.0}, {-138.5, -66.0}}, color = {0, 0, 191}));
        connect(CIR.u1, Capital_Investment.y1) annotation(
          Line(visible = true, points = {{125.0, 15.6}, {154.0, 15.6}, {154.0, -29.0}, {147.0, -29.0}}, color = {0, 0, 191}));
        connect(NRFR.y, NREM.u) annotation(
          Line(visible = true, points = {{147.5, 51.0}, {153.75, 51.0}, {153.75, 51.0}, {163.0, 51.0}}, color = {0, 0, 191}));
        connect(DRMM.y, Prod_5_2.u5) annotation(
          Line(visible = true, points = {{34.5, 171.0}, {26.0, 171.0}, {26.0, 104.0}, {40.0, 104.0}, {40.0, 79.0}, {31.2, 79.0}}, color = {0, 0, 191}));
        connect(DR_norm.y, Death_Rate.u) annotation(
          Line(visible = true, points = {{-13.5, 103.0}, {-20.0, 103.0}, {-20.0, 119.0}}, color = {0, 0, 191}));
        connect(Prod_5_2.y, DR_norm.u) annotation(
          Line(visible = true, points = {{20.0, 89.5}, {20.0, 103.0}, {7.5, 103.0}}, color = {0, 0, 191}));
        connect(Prod_5_2.u1, Population.y2) annotation(
          Line(visible = true, points = {{8.8, 79.0}, {-55.0, 79.0}, {-55.0, 127.0}}, color = {0, 0, 191}));
        connect(BRMM.y, Prod_5_1.u1) annotation(
          Line(visible = true, points = {{-121.5, 185.0}, {-180.0, 185.0}, {-180.0, 80.0}, {-171.2, 80.0}}, color = {0, 0, 191}));
        connect(Prod_5_1.u5, Population.y4) annotation(
          Line(visible = true, points = {{-148.8, 80.0}, {-85.0, 80.0}, {-85.0, 127.0}}, color = {0, 0, 191}));
        connect(Prod_5_1.y, BR_norm.u) annotation(
          Line(visible = true, points = {{-160.0, 91.2}, {-160.0, 103.0}, {-145.5, 103.0}}, color = {0, 0, 191}));
        connect(BR_norm.y, Birth_Rate.u) annotation(
          Line(visible = true, points = {{-124.5, 103.0}, {-120.0, 103.0}, {-120.0, 119.0}}, color = {0, 0, 191}));
        connect(Source1.MassInPort1, Birth_Rate.y) annotation(
          Line(visible = true, points = {{-139.0, 140.0}, {-130.0, 140.0}}, color = {191, 0, 191}));
        connect(Birth_Rate.y1, Population.u1) annotation(
          Line(visible = true, points = {{-110.0, 140.0}, {-92.0, 140.0}}, color = {191, 0, 191}));
        connect(Population.u2, Death_Rate.y) annotation(
          Line(visible = true, points = {{-48.0, 140.0}, {-30.0, 140.0}}, color = {191, 0, 191}));
        connect(Death_Rate.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, points = {{-10.0, 140.0}, {-1.0, 140.0}}, color = {191, 0, 191}));
        connect(Source2.MassInPort1, Generation.y) annotation(
          Line(visible = true, points = {{61.0, 140.0}, {70.0, 140.0}}, color = {191, 0, 191}));
        connect(Gen_Const.y, Generation.u) annotation(
          Line(visible = true, points = {{80.0, 111.5}, {80.0, 119.0}}, color = {0, 0, 191}));
        connect(NRFR.u, Natural_Resources.y4) annotation(
          Line(visible = true, points = {{126.5, 51.0}, {115.0, 51.0}, {115.0, 127.0}}, color = {0, 0, 191}));
        connect(Generation.y1, Natural_Resources.u1) annotation(
          Line(visible = true, points = {{90.0, 140.0}, {108.0, 140.0}}, color = {191, 0, 191}));
        connect(Prod_2_1.y, NR_norm.u) annotation(
          Line(visible = true, points = {{140.0, 91.2}, {140.0, 103.0}, {152.5, 103.0}}, color = {0, 0, 191}));
        connect(Natural_Resources.u2, Depletion.y) annotation(
          Line(visible = true, points = {{152.0, 140.0}, {170.0, 140.0}}, color = {191, 0, 191}));
        connect(Depletion.y1, Sink2.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, 140.0}, {199.0, 140.0}}, color = {191, 0, 191}));
        connect(NR_norm.y, Depletion.u) annotation(
          Line(visible = true, points = {{173.5, 103.0}, {180.0, 103.0}, {180.0, 119.0}}, color = {0, 0, 191}));
        Pop = Population.y;
        Pol = Pollution.y;
        Pol_rat = Pol_Ratio.y;
        Cap_inv = Capital_Investment.y;
        Qual_life = Quality_of_Life.y;
        Nat_res = Natural_Resources.y;
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-220.0, -262.0}, {442.0, 220.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-70.0, 102.0}, {296.0, 170.0}}, textString = "Forrester's", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-70.0, -22.0}, {296.0, 46.0}}, textString = "Original", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-70.0, -100.0}, {296.0, -32.0}}, textString = "World Model", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-62.0, 6.0}, {-58.0, 10.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{98.0, 192.0}, {102.0, 196.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{138.0, -16.0}, {142.0, -12.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -22.0}, {2.0, -18.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-178.0, -2.0}, {-174.0, 2.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{78.0, 4.0}, {82.0, 8.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -97.0}, {2.0, -93.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-178.0, -68.0}, {-174.0, -64.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -68.0}, {2.0, -64.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{158.0, 28.0}, {162.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{38.0, -262.0}, {42.0, -258.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, -102.0}, {302.0, -98.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 28.0}, {302.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 78.0}, {302.0, 82.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 169.0}, {302.0, 173.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{342.0, -171.0}, {346.0, -167.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{354.0, -234.0}, {358.0, -230.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-97.0, 6.0}, {-93.0, 10.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-137.0, -22.0}, {-133.0, -18.0}})}),
          Documentation(info = "<html>
This is the original scenario of <a href=\"http://en.wikipedia.org/wiki/Jay_Wright_Forrester\">Jay Forrester's</a> <font color=red><b>WORLD2</b></font> model as described in his <a href=\"http://www.amazon.com/World-Dynamics-Jay-W-Forrester/dp/1883823382/ref=ed_oe_h/103-2487145-1208659\">World Dynamics</a> book. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Forrester, J.W. (1971), <a href=\"http://www.amazon.com/World-Dynamics-Jay-W-Forrester/dp/1883823382/ref=ed_oe_h/103-2487145-1208659\">World Dynamics</a>, Pegasus Communications, 160p.
</ol> <p>
 
<hr> <p>
 
Simulate the model across 200 years, and plot the state variables as well as the quality of life as functions of the calendar years: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/SD_Fig1.png\"> <p>
 
<hr> <p>
</html>", revisions = ""),
          experiment(StartTime = 1900, StopTime = 2100),
          experimentSetupOutput);
      end Scenario_1;

      model Scenario_2 "2nd Scenario"
        parameter Real Population_0 = 1650000000.0 "World population in 1900";
        parameter Real Pollution_0 = 200000000.0 "Pollution in 1900";
        parameter Real Nat_Resources_0(unit = "ton") = 900000000000.0 "Unrecoverable natural resources in 1900";
        parameter Real Cap_Invest_0(unit = "dollar") = 400000000.0 "Capital investment in 1900";
        parameter Real CIAF_0 = 0.2 "Proportion of capital investment in agriculture in 1900";
        parameter Real BRN(unit = "1/yr") = 0.04 "Normal birth rate";
        parameter Real CIAFN(unit = "dollar") = 0.3 "CIAF normalization";
        parameter Real CIAFT(unit = "yr") = 15.0 "CIAF time constant";
        parameter Real CIDN(unit = "dollar/yr") = 0.025 "Normal capital discard";
        parameter Real CIGN(unit = "dollar/yr") = 0.05 "Normal capital generation";
        parameter Real DRN(unit = "1/yr") = 0.028 "Normal death rate";
        parameter Real ECIRN(unit = "dollar") = 1.0 "Capital normalization";
        parameter Real FC(unit = "kg/yr") = 1.0 "Food coefficient";
        parameter Real FN(unit = "kg/yr") = 1.0 "Food normalization";
        parameter Real Land_Area(unit = "hectare") = 135000000.0 "Area of arable land";
        parameter Real NRI(unit = "ton") = 900000000000.0 "Initial natural resources";
        parameter Real POLN(unit = "1/yr") = 1.0 "Normal pollution";
        parameter Real POLS = 3599900000.0 "Standard pollution";
        parameter Real Pop_dens_norm(unit = "1/hectare") = 26.5 "Normal population density";
        parameter Real QLS = 1.0 "Standard quality of life";
        output Real Pop "World population";
        output Real Pol "Pollution";
        output Real Pol_rat "Pollution ratio";
        output Real Cap_inv(unit = "dollar") "Capital investment";
        output Real Qual_life "Quality of life";
        output Real Nat_res(unit = "ton") "Natural unrecoverable resources";
        Real NRUN(unit = "1/yr") "Normal resource utilization";
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-150.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Birth_Rate annotation(
          Placement(visible = true, transformation(origin = {-120.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Population(x0 = Population_0) annotation(
          Placement(visible = true, transformation(origin = {-70.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Death_Rate annotation(
          Placement(visible = true, transformation(origin = {-20.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {10.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source2 annotation(
          Placement(visible = true, transformation(origin = {50.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Generation annotation(
          Placement(visible = true, transformation(origin = {80.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Natural_Resources(x0 = Nat_Resources_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Depletion annotation(
          Placement(visible = true, transformation(origin = {180.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink2 annotation(
          Placement(visible = true, transformation(origin = {210.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Gen_Const(k = 0) annotation(
          Placement(visible = true, transformation(origin = {80.0, 101.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular BRMM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {1.2, 1.0, 0.85, 0.75, 0.7, 0.7, 0.7}) annotation(
          Placement(visible = true, transformation(origin = {-105.0, 185.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular DRMM(x_vals = {0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 20}, y_vals = {3.0, 1.8, 1.0, 0.8, 0.7, 0.6, 0.53, 0.5, 0.5, 0.5, 0.5, 0.5}) annotation(
          Placement(visible = true, transformation(origin = {51.0, 171.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain BR_norm(k = BRN) annotation(
          Placement(visible = true, transformation(origin = {-135.0, 103.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_5 Prod_5_1 annotation(
          Placement(visible = true, transformation(origin = {-160.0, 80.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain DR_norm(k = DRN) annotation(
          Placement(visible = true, transformation(origin = {-3.0, 103.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_5 Prod_5_2 annotation(
          Placement(visible = true, transformation(origin = {20.0, 79.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular BRFM(x_vals = {0, 1, 2, 3, 4, 20}, y_vals = {0.0, 1.0, 1.6, 1.9, 2.0, 2.0}) annotation(
          Placement(visible = true, transformation(origin = {-176.0, 35.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular BRPM(x_vals = 0:10:60, y_vals = {1.02, 0.9, 0.7, 0.4, 0.25, 0.15, 0.1}) annotation(
          Placement(visible = true, transformation(origin = {-135.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular BRCM(x_vals = 0:5, y_vals = {1.05, 1.0, 0.9, 0.7, 0.6, 0.55}) annotation(
          Placement(visible = true, transformation(origin = {-95.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRCM(x_vals = 0:5, y_vals = {0.9, 1.0, 1.2, 1.5, 1.9, 3.0}) annotation(
          Placement(visible = true, transformation(origin = {-25.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRPM(x_vals = 0:10:60, y_vals = {0.92, 1.3, 2.0, 3.2, 4.8, 6.8, 9.2}) annotation(
          Placement(visible = true, transformation(origin = {15.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRFM(x_vals = {0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 20}, y_vals = {30.0, 3.0, 2.0, 1.4, 1.0, 0.7, 0.6, 0.5, 0.5, 0.5}) annotation(
          Placement(visible = true, transformation(origin = {55.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Auxiliary.Gain Crowd_Rat(k = 1.0 / (Land_Area * Pop_dens_norm)) annotation(
          Placement(visible = true, transformation(origin = {-60.0, 35.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_1 annotation(
          Placement(visible = true, transformation(origin = {140.0, 80.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular NRMM(x_vals = 0:10, y_vals = {0.0, 1.0, 1.8, 2.4, 2.9, 3.3, 3.6, 3.8, 3.9, 3.95, 4.0}) annotation(
          Placement(visible = true, transformation(origin = {201.0, 80.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Sources.Source Source3 annotation(
          Placement(visible = true, transformation(origin = {50.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CI_Generation annotation(
          Placement(visible = true, transformation(origin = {80.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Capital_Investment(x0 = Cap_Invest_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CI_Discard annotation(
          Placement(visible = true, transformation(origin = {180.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink3 annotation(
          Placement(visible = true, transformation(origin = {210.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIG_norm(k = CIGN) annotation(
          Placement(visible = true, transformation(origin = {65.0, -77.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_2 annotation(
          Placement(visible = true, transformation(origin = {40.0, -100.0}, extent = {{-14.0, -16.0}, {14.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CID_norm(k = CIDN) annotation(
          Placement(visible = true, transformation(origin = {165.0, -77.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular CIM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {0.1, 1.0, 1.8, 2.4, 2.8, 3.0, 3.0}) annotation(
          Placement(visible = true, transformation(origin = {113.0, -100.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain MSL(k = 1.0 / ECIRN) annotation(
          Placement(visible = true, transformation(origin = {277.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain NRFR(k = 1.0 / NRI) annotation(
          Placement(visible = true, transformation(origin = {137.0, 51.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain ECIR(k = 1.0 / (1.0 - CIAFN)) annotation(
          Placement(visible = true, transformation(origin = {243.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_1 annotation(
          Placement(visible = true, transformation(origin = {215.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular NREM(x_vals = 0:0.25:1, y_vals = {0.0, 0.15, 0.5, 0.85, 1.0}) annotation(
          Placement(visible = true, transformation(origin = {175.0, 51.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -180)));
        Modelica.Blocks.Math.Division CIR annotation(
          Placement(visible = true, transformation(origin = {107.0, 6.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source4 annotation(
          Placement(visible = true, transformation(origin = {-150.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 P_Generation annotation(
          Placement(visible = true, transformation(origin = {-120.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Pollution(x0 = Pollution_0) annotation(
          Placement(visible = true, transformation(origin = {-70.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 P_Absorption annotation(
          Placement(visible = true, transformation(origin = {-20.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink4 annotation(
          Placement(visible = true, transformation(origin = {10.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Linear NotCIAF(m = -1.0, b = 1.0) annotation(
          Placement(visible = true, transformation(origin = {189.0, 10.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain Pol_Ratio(k = 1.0 / POLS) annotation(
          Placement(visible = true, transformation(origin = {-29.0, -95.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular FCM(x_vals = 0:5, y_vals = {2.4, 1.0, 0.6, 0.4, 0.3, 0.2}) annotation(
          Placement(visible = true, transformation(origin = {-85.0, -47.0}, extent = {{-15.0, 15.0}, {15.0, -15.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_2 annotation(
          Placement(visible = true, transformation(origin = {-117.0, -66.0}, extent = {{15.0, -14.0}, {-15.0, 14.0}}, rotation = 90)));
        SystemDynamics.Auxiliary.Gain Food_Ratio(k = FC / FN) annotation(
          Placement(visible = true, transformation(origin = {-149.0, -66.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source5 annotation(
          Placement(visible = true, transformation(origin = {50.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CIAFG annotation(
          Placement(visible = true, transformation(origin = {80.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level CIAF(x0 = CIAF_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CIAFD annotation(
          Placement(visible = true, transformation(origin = {180.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink5 annotation(
          Placement(visible = true, transformation(origin = {210.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIAF_D(k = 1.0 / CIAFT) annotation(
          Placement(visible = true, transformation(origin = {163.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIAF_G(k = 1.0 / CIAFT) annotation(
          Placement(visible = true, transformation(origin = {95.0, -180.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_3 annotation(
          Placement(visible = true, transformation(origin = {120.0, -230.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division P_Abs annotation(
          Placement(visible = true, transformation(origin = {-43.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain Pol_norm(k = POLN) annotation(
          Placement(visible = true, transformation(origin = {-135.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_4 annotation(
          Placement(visible = true, transformation(origin = {-160.0, -220.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular POLCM(x_vals = {0, 1, 2, 3, 4, 5, 100}, y_vals = {0.05, 1.0, 3.0, 5.4, 7.4, 8.0, 8.0}) annotation(
          Placement(visible = true, transformation(origin = {-117.0, -220.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular POLAT(x_vals = 0:10:60, y_vals = {0.6, 2.5, 5.0, 8.0, 11.5, 15.5, 20.0}) annotation(
          Placement(visible = true, transformation(origin = {-39.0, -220.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular CFIFR(x_vals = {0, 0.5, 1, 1.5, 2, 20}, y_vals = {1.0, 0.6, 0.3, 0.15, 0.1, 0.1}) annotation(
          Placement(visible = true, transformation(origin = {69.0, -230.0}, extent = {{15.0, 16.0}, {-15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular FPM(x_vals = 0:10:60, y_vals = {1.02, 0.9, 0.65, 0.35, 0.2, 0.1, 0.05}) annotation(
          Placement(visible = true, transformation(origin = {-33.0, -66.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_5 annotation(
          Placement(visible = true, transformation(origin = {229.0, -200.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIRA(k = 1.0 / CIAFN) annotation(
          Placement(visible = true, transformation(origin = {255.0, -225.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular FPCI(x_vals = {0, 1, 2, 3, 4, 5, 6, 100}, y_vals = {0.5, 1.0, 1.4, 1.7, 1.9, 2.05, 2.2, 2.2}) annotation(
          Placement(visible = true, transformation(origin = {-153.0, -107.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular CIQR(y_vals = {0.7, 0.8, 1.0, 1.5, 2.0, 2.0}, x_vals = {0, 0.5, 1, 1.5, 2, 10}) annotation(
          Placement(visible = true, transformation(origin = {167.0, -230.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        Modelica.Blocks.Math.Division QLMF annotation(
          Placement(visible = true, transformation(origin = {315.0, -223.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular QLM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {0.2, 1.0, 1.7, 2.3, 2.7, 2.9, 2.9}) annotation(
          Placement(visible = true, transformation(origin = {319.0, -169.0}, extent = {{15.0, 17.0}, {-15.0, -17.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular QLF(x_vals = {0, 1, 2, 3, 4, 20}, y_vals = {0.0, 1.0, 1.8, 2.4, 2.7, 2.7}) annotation(
          Placement(visible = true, transformation(origin = {381.0, -232.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_4 Prod_4_1 annotation(
          Placement(visible = true, transformation(origin = {375.0, -163.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular QLC(x_vals = 0:0.5:5, y_vals = {2.0, 1.3, 1.0, 0.75, 0.55, 0.45, 0.38, 0.3, 0.25, 0.22, 0.2}) annotation(
          Placement(visible = true, transformation(origin = {335.0, -113.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular QLP(x_vals = 0:10:60, y_vals = {1.04, 0.85, 0.6, 0.3, 0.15, 0.05, 0.02}) annotation(
          Placement(visible = true, transformation(origin = {375.0, -113.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Gain Quality_of_Life(k = QLS) annotation(
          Placement(visible = true, transformation(origin = {412.0, -163.0}, extent = {{-20.0, -21.0}, {20.0, 21.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World2.Utilities.Parameter_Change NR_norm annotation(
          Placement(visible = true, transformation(origin = {161.6845, 105.0774}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(NR_norm.u1, Prod_2_1.y) annotation(
          Line(visible = true, points = {{152.6845, 109.0774}, {140.0, 109.0774}, {140.0, 91.2}}, color = {0, 0, 191}));
        connect(Depletion.u, NR_norm.y) annotation(
          Line(visible = true, points = {{180.0, 119.0}, {180.0, 105.0}, {170.6845, 105.0774}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, BRFM.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-176.0, -66.0}, {-176.0, 22.2}}, color = {0, 0, 191}));
        connect(BRFM.y, Prod_5_1.u2) annotation(
          Line(visible = true, points = {{-176.0, 52.6}, {-176.0, 60.0}, {-167.36, 60.0}, {-167.36, 72.0}}, color = {0, 0, 191}));
        connect(BRPM.u, QLP.u) annotation(
          Line(visible = true, points = {{-135.0, 23.0}, {-135.0, -20.0}, {-214.0, -20.0}, {-214.0, 214.0}, {375.0, 214.0}, {375.0, -125.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, BRPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, -20.0}, {-135.0, -20.0}, {-135.0, 23.0}}, color = {0, 0, 191}));
        connect(BRPM.y, Prod_5_1.u3) annotation(
          Line(visible = true, points = {{-135.0, 51.5}, {-135.0, 60.0}, {-160.0, 60.0}, {-160.0, 68.8}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, BRCM.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-95.0, 8.0}, {-95.0, 23.0}}, color = {0, 0, 191}));
        connect(BRCM.y, Prod_5_1.u4) annotation(
          Line(visible = true, points = {{-95.0, 51.5}, {-95.0, 66.0}, {-152.64, 66.0}, {-152.64, 72.0}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, DRCM.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-25.0, 8.0}, {-25.0, 23.0}}, color = {0, 0, 191}));
        connect(DRCM.y, Prod_5_2.u2) annotation(
          Line(visible = true, points = {{-25.0, 51.5}, {-25.0, 60.0}, {12.64, 60.0}, {12.64, 71.5}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, DRPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, 8.0}, {15.0, 8.0}, {15.0, 23.0}}, color = {0, 0, 191}));
        connect(DRPM.y, Prod_5_2.u3) annotation(
          Line(visible = true, points = {{15.0, 51.5}, {15.0, 60.0}, {20.0, 60.0}, {20.0, 68.5}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, DRFM.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-176.0, -66.0}, {-176.0, 0.0}, {55.0, 0.0}, {55.0, 23.0}}, color = {0, 0, 191}));
        connect(DRFM.y, Prod_5_2.u4) annotation(
          Line(visible = true, points = {{55.0, 51.5}, {55.0, 60.0}, {27.36, 60.0}, {27.36, 71.5}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, QLC.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-206.0, 8.0}, {-206.0, 208.0}, {335.0, 208.0}, {335.0, -125.0}}, color = {0, 0, 191}));
        connect(FCM.u, Crowd_Rat.y) annotation(
          Line(visible = true, points = {{-73.0, -47.0}, {-60.0, -47.0}, {-60.0, 23.8}}, color = {0, 0, 191}));
        connect(Crowd_Rat.u, Population.y3) annotation(
          Line(visible = true, points = {{-60.0, 46.2}, {-60.0, 66.0}, {-70.0, 66.0}, {-70.0, 127.0}}, color = {0, 0, 191}));
        connect(Prod_2_5.u2, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{239.5, -200.0}, {260.0, -200.0}, {260.0, -20.0}, {160.0, -20.0}, {160.0, 30.0}, {203.8, 30.0}}, color = {0, 0, 191}));
        connect(Prod_3_1.y, ECIR.u) annotation(
          Line(visible = true, points = {{226.2, 30.0}, {232.5, 30.0}}, color = {0, 0, 191}));
        connect(CIR.y, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{90.5, 6.0}, {80.0, 6.0}, {80.0, 30.0}, {203.8, 30.0}}, color = {0, 0, 191}));
        connect(NotCIAF.y, Prod_3_1.u3) annotation(
          Line(visible = true, points = {{202.5, 10.0}, {215.0, 10.0}, {215.0, 19.5}}, color = {0, 0, 191}));
        connect(Prod_3_1.u1, NREM.y) annotation(
          Line(visible = true, points = {{215.0, 40.5}, {215.0, 51.0}, {191.5, 51.0}}, color = {0, 0, 191}));
        connect(QLP.y, Prod_4_1.u1) annotation(
          Line(visible = true, points = {{375.0, -96.5}, {375.0, -152.5}}, color = {0, 0, 191}));
        connect(QLC.y, Prod_4_1.u2) annotation(
          Line(visible = true, points = {{335.0, -96.5}, {335.0, -157.0}, {366.6, -157.0}}, color = {0, 0, 191}));
        connect(Prod_4_1.y, Quality_of_Life.u) annotation(
          Line(visible = true, points = {{385.5, -163.0}, {398.0, -163.0}}, color = {0, 0, 191}));
        connect(QLF.y, Prod_4_1.u4) annotation(
          Line(visible = true, points = {{364.5, -232.0}, {356.0, -232.0}, {356.0, -190.0}, {375.0, -190.0}, {375.0, -173.5}}, color = {0, 0, 191}));
        connect(QLM.y, Prod_4_1.u3) annotation(
          Line(visible = true, points = {{335.5, -169.0}, {366.6, -169.0}}, color = {0, 0, 191}));
        connect(QLF.y, QLMF.u2) annotation(
          Line(visible = true, points = {{364.5, -232.0}, {333.0, -232.0}}, color = {0, 0, 191}));
        connect(QLMF.y, CIQR.u) annotation(
          Line(visible = true, points = {{298.5, -223.0}, {290.0, -223.0}, {290.0, -256.0}, {190.0, -256.0}, {190.0, -230.0}, {179.0, -230.0}}, color = {0, 0, 191}));
        connect(P_Abs.u1, Pollution.y3) annotation(
          Line(visible = true, points = {{-61.0, -170.4}, {-70.0, -170.4}, {-70.0, -153.0}}, color = {0, 0, 191}));
        connect(CIG_norm.y, CI_Generation.u) annotation(
          Line(visible = true, points = {{75.5, -77.0}, {80.0, -77.0}, {80.0, -61.0}}, color = {0, 0, 191}));
        connect(CI_Discard.y1, Sink3.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, -40.0}, {199.0, -40.0}}, color = {191, 0, 191}));
        connect(Capital_Investment.u2, CI_Discard.y) annotation(
          Line(visible = true, points = {{152.0, -40.0}, {170.0, -40.0}}, color = {191, 0, 191}));
        connect(Source3.MassInPort1, CI_Generation.y) annotation(
          Line(visible = true, points = {{61.0, -40.0}, {70.0, -40.0}}, color = {191, 0, 191}));
        connect(CI_Generation.y1, Capital_Investment.u1) annotation(
          Line(visible = true, points = {{90.0, -40.0}, {108.0, -40.0}}, color = {191, 0, 191}));
        connect(FPM.u, POLAT.u) annotation(
          Line(visible = true, points = {{-21.0, -66.0}, {0.0, -66.0}, {0.0, -220.0}, {-27.0, -220.0}}, color = {0, 0, 191}));
        connect(CIRA.y, FPCI.u) annotation(
          Line(visible = true, points = {{265.5, -225.0}, {280.0, -225.0}, {280.0, -252.0}, {-210.0, -252.0}, {-210.0, -107.0}, {-165.0, -107.0}}, color = {0, 0, 191}));
        connect(Prod_2_1.u1, Population.y1) annotation(
          Line(visible = true, points = {{128.8, 80.0}, {100.0, 80.0}, {100.0, 194.0}, {-46.0, 194.0}, {-46.0, 151.0}, {-53.0, 151.0}}, color = {0, 0, 191}));
        connect(NRMM.u, DRMM.u) annotation(
          Line(visible = true, points = {{213.0, 80.0}, {300.0, 80.0}, {300.0, 171.0}, {63.0, 171.0}}, color = {0, 0, 191}));
        connect(NRMM.u, BRMM.u) annotation(
          Line(visible = true, points = {{213.0, 80.0}, {300.0, 80.0}, {300.0, 200.0}, {-70.0, 200.0}, {-70.0, 185.0}, {-93.0, 185.0}}, color = {0, 0, 191}));
        connect(CFIFR.u, QLF.u) annotation(
          Line(visible = true, points = {{57.0, -230.0}, {40.0, -230.0}, {40.0, -260.0}, {400.0, -260.0}, {400.0, -232.0}, {393.0, -232.0}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, QLF.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-220.0, -66.0}, {-220.0, -260.0}, {400.0, -260.0}, {400.0, -232.0}, {393.0, -232.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, FPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, -66.0}, {-21.0, -66.0}}, color = {0, 0, 191}));
        connect(CIR.y, POLCM.u) annotation(
          Line(visible = true, points = {{90.5, 6.0}, {80.0, 6.0}, {80.0, -6.0}, {10.0, -6.0}, {10.0, -116.0}, {-100.0, -116.0}, {-100.0, -220.0}, {-105.0, -220.0}}, color = {0, 0, 191}));
        connect(QLM.u, CIM.u) annotation(
          Line(visible = true, points = {{307.0, -169.0}, {300.0, -169.0}, {300.0, -100.0}, {125.0, -100.0}}, color = {0, 0, 191}));
        connect(QLM.y, QLMF.u1) annotation(
          Line(visible = true, points = {{335.5, -169.0}, {344.0, -169.0}, {344.0, -214.0}, {333.0, -214.0}}, color = {0, 0, 191}));
        connect(MSL.y, QLM.u) annotation(
          Line(visible = true, points = {{287.5, 30.0}, {300.0, 30.0}, {300.0, -169.0}, {307.0, -169.0}}, color = {0, 0, 191}));
        connect(NRMM.y, Prod_2_1.u2) annotation(
          Line(visible = true, points = {{184.5, 80.0}, {151.2, 80.0}}, color = {0, 0, 191}));
        connect(MSL.y, NRMM.u) annotation(
          Line(visible = true, points = {{287.5, 30.0}, {300.0, 30.0}, {300.0, 80.0}, {213.0, 80.0}}, color = {0, 0, 191}));
        connect(ECIR.y, MSL.u) annotation(
          Line(visible = true, points = {{253.5, 30.0}, {266.5, 30.0}}, color = {0, 0, 191}));
        connect(NotCIAF.u, CIAF.y1) annotation(
          Line(visible = true, points = {{175.5, 10.0}, {168.0, 10.0}, {168.0, -8.0}, {240.0, -8.0}, {240.0, -110.0}, {154.0, -110.0}, {154.0, -129.0}, {147.0, -129.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, CIR.u2) annotation(
          Line(visible = true, points = {{30.2, -100.0}, {20.0, -100.0}, {20.0, -14.0}, {140.0, -14.0}, {140.0, -3.6}, {125.0, -3.6}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, Population.y1) annotation(
          Line(visible = true, points = {{30.2, -100.0}, {20.0, -100.0}, {20.0, -14.0}, {320.0, -14.0}, {320.0, 194.0}, {-46.0, 194.0}, {-46.0, 151.0}, {-53.0, 151.0}}, color = {0, 0, 191}));
        connect(Prod_2_4.u1, Population.y) annotation(
          Line(visible = true, points = {{-171.2, -220.0}, {-200.0, -220.0}, {-200.0, 164.0}, {-94.0, 164.0}, {-94.0, 151.0}, {-87.0, 151.0}}, color = {0, 0, 191}));
        connect(CID_norm.u, Capital_Investment.y2) annotation(
          Line(visible = true, points = {{154.5, -77.0}, {145.0, -77.0}, {145.0, -53.0}}, color = {0, 0, 191}));
        connect(CID_norm.y, CI_Discard.u) annotation(
          Line(visible = true, points = {{175.5, -77.0}, {180.0, -77.0}, {180.0, -61.0}}, color = {0, 0, 191}));
        connect(CIM.y, Prod_2_2.u2) annotation(
          Line(visible = true, points = {{96.5, -100.0}, {49.8, -100.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.y, CIG_norm.u) annotation(
          Line(visible = true, points = {{40.0, -88.8}, {40.0, -77.0}, {54.5, -77.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.u, Pollution.y1) annotation(
          Line(visible = true, points = {{-39.5, -95.0}, {-46.0, -95.0}, {-46.0, -129.0}, {-53.0, -129.0}}, color = {0, 0, 191}));
        connect(POLCM.y, Prod_2_4.u2) annotation(
          Line(visible = true, points = {{-133.5, -220.0}, {-148.8, -220.0}}, color = {0, 0, 191}));
        connect(Prod_2_4.y, Pol_norm.u) annotation(
          Line(visible = true, points = {{-160.0, -208.8}, {-160.0, -180.0}, {-145.5, -180.0}}, color = {0, 0, 191}));
        connect(Pol_norm.y, P_Generation.u) annotation(
          Line(visible = true, points = {{-124.5, -180.0}, {-120.0, -180.0}, {-120.0, -161.0}}, color = {0, 0, 191}));
        connect(POLAT.y, P_Abs.u2) annotation(
          Line(visible = true, points = {{-55.5, -220.0}, {-70.0, -220.0}, {-70.0, -189.6}, {-61.0, -189.6}}, color = {0, 0, 191}));
        connect(P_Abs.y, P_Absorption.u) annotation(
          Line(visible = true, points = {{-26.5, -180.0}, {-20.0, -180.0}, {-20.0, -161.0}}, color = {0, 0, 191}));
        connect(CFIFR.y, Prod_2_3.u1) annotation(
          Line(visible = true, points = {{85.5, -230.0}, {108.8, -230.0}}, color = {0, 0, 191}));
        connect(CIQR.y, Prod_2_3.u2) annotation(
          Line(visible = true, points = {{150.5, -230.0}, {131.2, -230.0}}, color = {0, 0, 191}));
        connect(CIAF_G.y, CIAFG.u) annotation(
          Line(visible = true, points = {{84.5, -180.0}, {80.0, -180.0}, {80.0, -161.0}}, color = {0, 0, 191}));
        connect(CIAF_G.u, Prod_2_3.y) annotation(
          Line(visible = true, points = {{105.5, -180.0}, {120.0, -180.0}, {120.0, -218.8}}, color = {0, 0, 191}));
        connect(CIRA.u, Prod_2_5.y) annotation(
          Line(visible = true, points = {{244.5, -225.0}, {229.0, -225.0}, {229.0, -211.2}}, color = {0, 0, 191}));
        connect(Prod_2_5.u1, CIAF.y3) annotation(
          Line(visible = true, points = {{218.5, -200.0}, {130.0, -200.0}, {130.0, -153.0}}, color = {0, 0, 191}));
        connect(CIAF_D.u, CIAF.y2) annotation(
          Line(visible = true, points = {{152.5, -180.0}, {145.0, -180.0}, {145.0, -153.0}}, color = {0, 0, 191}));
        connect(CIAF_D.y, CIAFD.u) annotation(
          Line(visible = true, points = {{173.5, -180.0}, {180.0, -180.0}, {180.0, -161.0}}, color = {0, 0, 191}));
        connect(CIAFD.y1, Sink5.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, -140.0}, {199.0, -140.0}}, color = {191, 0, 191}));
        connect(CIAF.u2, CIAFD.y) annotation(
          Line(visible = true, points = {{152.0, -140.0}, {170.0, -140.0}}, color = {191, 0, 191}));
        connect(CIAFG.y1, CIAF.u1) annotation(
          Line(visible = true, points = {{90.0, -140.0}, {108.0, -140.0}}, color = {191, 0, 191}));
        connect(Source5.MassInPort1, CIAFG.y) annotation(
          Line(visible = true, points = {{61.0, -140.0}, {70.0, -140.0}}, color = {191, 0, 191}));
        connect(P_Absorption.y1, Sink4.MassInPort1) annotation(
          Line(visible = true, points = {{-10.0, -140.0}, {-1.0, -140.0}}, color = {191, 0, 191}));
        connect(Pollution.u2, P_Absorption.y) annotation(
          Line(visible = true, points = {{-48.0, -140.0}, {-30.0, -140.0}}, color = {191, 0, 191}));
        connect(P_Generation.y1, Pollution.u1) annotation(
          Line(visible = true, points = {{-110.0, -140.0}, {-92.0, -140.0}}, color = {191, 0, 191}));
        connect(Source4.MassInPort1, P_Generation.y) annotation(
          Line(visible = true, points = {{-139.0, -140.0}, {-130.0, -140.0}}, color = {191, 0, 191}));
        connect(FPCI.y, Prod_3_2.u3) annotation(
          Line(visible = true, points = {{-136.5, -107.0}, {-117.0, -107.0}, {-117.0, -76.5}}, color = {0, 0, 191}));
        connect(FPM.y, Prod_3_2.u2) annotation(
          Line(visible = true, points = {{-49.5, -66.0}, {-107.2, -66.0}}, color = {0, 0, 191}));
        connect(Prod_3_2.u1, FCM.y) annotation(
          Line(visible = true, points = {{-117.0, -55.5}, {-117.0, -47.0}, {-101.5, -47.0}}, color = {0, 0, 191}));
        connect(Prod_3_2.y, Food_Ratio.u) annotation(
          Line(visible = true, points = {{-126.8, -66.0}, {-138.5, -66.0}}, color = {0, 0, 191}));
        connect(CIR.u1, Capital_Investment.y1) annotation(
          Line(visible = true, points = {{125.0, 15.6}, {154.0, 15.6}, {154.0, -29.0}, {147.0, -29.0}}, color = {0, 0, 191}));
        connect(NRFR.y, NREM.u) annotation(
          Line(visible = true, points = {{147.5, 51.0}, {163.0, 51.0}}, color = {0, 0, 191}));
        connect(DRMM.y, Prod_5_2.u5) annotation(
          Line(visible = true, points = {{34.5, 171.0}, {26.0, 171.0}, {26.0, 104.0}, {40.0, 104.0}, {40.0, 79.0}, {31.2, 79.0}}, color = {0, 0, 191}));
        connect(DR_norm.y, Death_Rate.u) annotation(
          Line(visible = true, points = {{-13.5, 103.0}, {-20.0, 103.0}, {-20.0, 119.0}}, color = {0, 0, 191}));
        connect(Prod_5_2.y, DR_norm.u) annotation(
          Line(visible = true, points = {{20.0, 89.5}, {20.0, 103.0}, {7.5, 103.0}}, color = {0, 0, 191}));
        connect(Prod_5_2.u1, Population.y2) annotation(
          Line(visible = true, points = {{8.8, 79.0}, {-55.0, 79.0}, {-55.0, 127.0}}, color = {0, 0, 191}));
        connect(BRMM.y, Prod_5_1.u1) annotation(
          Line(visible = true, points = {{-121.5, 185.0}, {-180.0, 185.0}, {-180.0, 80.0}, {-171.2, 80.0}}, color = {0, 0, 191}));
        connect(Prod_5_1.u5, Population.y4) annotation(
          Line(visible = true, points = {{-148.8, 80.0}, {-85.0, 80.0}, {-85.0, 127.0}}, color = {0, 0, 191}));
        connect(Prod_5_1.y, BR_norm.u) annotation(
          Line(visible = true, points = {{-160.0, 91.2}, {-160.0, 103.0}, {-145.5, 103.0}}, color = {0, 0, 191}));
        connect(BR_norm.y, Birth_Rate.u) annotation(
          Line(visible = true, points = {{-124.5, 103.0}, {-120.0, 103.0}, {-120.0, 119.0}}, color = {0, 0, 191}));
        connect(Source1.MassInPort1, Birth_Rate.y) annotation(
          Line(visible = true, points = {{-139.0, 140.0}, {-130.0, 140.0}}, color = {191, 0, 191}));
        connect(Birth_Rate.y1, Population.u1) annotation(
          Line(visible = true, points = {{-110.0, 140.0}, {-92.0, 140.0}}, color = {191, 0, 191}));
        connect(Population.u2, Death_Rate.y) annotation(
          Line(visible = true, points = {{-48.0, 140.0}, {-30.0, 140.0}}, color = {191, 0, 191}));
        connect(Death_Rate.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, points = {{-10.0, 140.0}, {-1.0, 140.0}}, color = {191, 0, 191}));
        connect(Source2.MassInPort1, Generation.y) annotation(
          Line(visible = true, points = {{61.0, 140.0}, {70.0, 140.0}}, color = {191, 0, 191}));
        connect(Gen_Const.y, Generation.u) annotation(
          Line(visible = true, points = {{80.0, 111.5}, {80.0, 119.0}}, color = {0, 0, 191}));
        connect(NRFR.u, Natural_Resources.y4) annotation(
          Line(visible = true, points = {{126.5, 51.0}, {115.0, 51.0}, {115.0, 127.0}}, color = {0, 0, 191}));
        connect(Generation.y1, Natural_Resources.u1) annotation(
          Line(visible = true, points = {{90.0, 140.0}, {108.0, 140.0}}, color = {191, 0, 191}));
        connect(Natural_Resources.u2, Depletion.y) annotation(
          Line(visible = true, points = {{152.0, 140.0}, {170.0, 140.0}}, color = {191, 0, 191}));
        connect(Depletion.y1, Sink2.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, 140.0}, {199.0, 140.0}}, color = {191, 0, 191}));
        Pop = Population.y;
        Pol = Pollution.y;
        Pol_rat = Pol_Ratio.y;
        Cap_inv = Capital_Investment.y;
        Qual_life = Quality_of_Life.y;
        Nat_res = Natural_Resources.y;
        NRUN = if time > 1970 then 0.25 else 1.0;
        NR_norm.u2 = NRUN;
        annotation(
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-62.0, 6.0}, {-58.0, 10.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{98.0, 192.0}, {102.0, 196.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{138.0, -16.0}, {142.0, -12.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -22.0}, {2.0, -18.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-178.0, -2.0}, {-174.0, 2.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{78.0, 4.0}, {82.0, 8.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -97.0}, {2.0, -93.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-178.0, -68.0}, {-174.0, -64.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -68.0}, {2.0, -64.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{158.0, 28.0}, {162.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{38.0, -262.0}, {42.0, -258.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, -102.0}, {302.0, -98.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 28.0}, {302.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 78.0}, {302.0, 82.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 169.0}, {302.0, 173.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{342.0, -171.0}, {346.0, -167.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{354.0, -234.0}, {358.0, -230.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-97.0, 6.0}, {-93.0, 10.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-137.0, -22.0}, {-133.0, -18.0}})}),
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-220.0, -260.0}, {442.0, 224.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-152.0, 74.0}, {368.0, 144.0}}, textString = "1st Modification", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 0, 255}, extent = {{-148.0, -22.0}, {372.0, 48.0}}, textString = "NRUN", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-150.0, -102.0}, {370.0, -32.0}}, textString = "reduced to 0.25", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-150.0, -188.0}, {370.0, -118.0}}, textString = "in 1970", fontName = "Arial")}),
          experiment(StartTime = 1900, StopTime = 2100),
          experimentSetupOutput,
          Documentation(info = "<html>
This is the first modification proposed by <a href=\"http://en.wikipedia.org/wiki/Jay_Wright_Forrester\">Jay Forrester</a> in his <font color=red><b>WORLD2</b></font> model. The utilization of natural resources is reduced in 1970 to 25% of their former value in order to extend their availability. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Forrester, J.W. (1971), <a href=\"http://www.amazon.com/World-Dynamics-Jay-W-Forrester/dp/1883823382/ref=ed_oe_h/103-2487145-1208659\">World Dynamics</a>, Pegasus Communications, 160p.
</ol> <p>
 
<hr> <p>
 
Simulate the model across 200 years, and plot the state variables as well as the quality of life as functions of the calendar years: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/SD_Fig2.png\"> <p>
 
I had to artificially extend some of the tabular functions, because our software complains when an interpolation function attempts an extrapolation. <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_2;

      model Scenario_3 "3rd Scenario"
        parameter Real Population_0 = 1650000000.0 "World population in 1900";
        parameter Real Pollution_0 = 200000000.0 "Pollution in 1900";
        parameter Real Nat_Resources_0(unit = "ton") = 900000000000.0 "Unrecoverable natural resources in 1900";
        parameter Real Cap_Invest_0(unit = "dollar") = 400000000.0 "Capital investment in 1900";
        parameter Real CIAF_0 = 0.2 "Proportion of capital investment in agriculture in 1900";
        parameter Real BRN(unit = "1/yr") = 0.04 "Normal birth rate";
        parameter Real CIAFN(unit = "dollar") = 0.3 "CIAF normalization";
        parameter Real CIAFT(unit = "yr") = 15.0 "CIAF time constant";
        parameter Real CIDN(unit = "dollar/yr") = 0.025 "Normal capital discard";
        parameter Real CIGN(unit = "dollar/yr") = 0.05 "Normal capital generation";
        parameter Real DRN(unit = "1/yr") = 0.028 "Normal death rate";
        parameter Real ECIRN(unit = "dollar") = 1.0 "Capital normalization";
        parameter Real FC(unit = "kg/yr") = 1.0 "Food coefficient";
        parameter Real FN(unit = "kg/yr") = 1.0 "Food normalization";
        parameter Real Land_Area(unit = "hectare") = 135000000.0 "Area of arable land";
        parameter Real NRI(unit = "ton") = 900000000000.0 "Initial natural resources";
        parameter Real POLS = 3599900000.0 "Standard pollution";
        parameter Real Pop_dens_norm(unit = "1/hectare") = 26.5 "Normal population density";
        parameter Real QLS = 1.0 "Standard quality of life";
        output Real Pop "World population";
        output Real Pol "Pollution";
        output Real Pol_rat "Pollution ratio";
        output Real Cap_inv(unit = "dollar") "Capital investment";
        output Real Qual_life "Quality of life";
        output Real Nat_res(unit = "ton") "Natural unrecoverable resources";
        Real NRUN(unit = "1/yr") "Normal resource utilization";
        Real POLN(unit = "1/yr") "Normal pollution";
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-150.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Birth_Rate annotation(
          Placement(visible = true, transformation(origin = {-120.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Population(x0 = Population_0) annotation(
          Placement(visible = true, transformation(origin = {-70.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Death_Rate annotation(
          Placement(visible = true, transformation(origin = {-20.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {10.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source2 annotation(
          Placement(visible = true, transformation(origin = {50.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Generation annotation(
          Placement(visible = true, transformation(origin = {80.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Natural_Resources(x0 = Nat_Resources_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Depletion annotation(
          Placement(visible = true, transformation(origin = {180.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink2 annotation(
          Placement(visible = true, transformation(origin = {210.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Gen_Const(k = 0) annotation(
          Placement(visible = true, transformation(origin = {80.0, 101.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular BRMM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {1.2, 1.0, 0.85, 0.75, 0.7, 0.7, 0.7}) annotation(
          Placement(visible = true, transformation(origin = {-105.0, 185.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular DRMM(x_vals = {0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 20}, y_vals = {3.0, 1.8, 1.0, 0.8, 0.7, 0.6, 0.53, 0.5, 0.5, 0.5, 0.5, 0.5}) annotation(
          Placement(visible = true, transformation(origin = {51.0, 171.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain BR_norm(k = BRN) annotation(
          Placement(visible = true, transformation(origin = {-135.0, 103.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_5 Prod_5_1 annotation(
          Placement(visible = true, transformation(origin = {-160.0, 80.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain DR_norm(k = DRN) annotation(
          Placement(visible = true, transformation(origin = {-3.0, 103.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_5 Prod_5_2 annotation(
          Placement(visible = true, transformation(origin = {20.0, 79.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular BRFM(x_vals = {0, 1, 2, 3, 4, 20}, y_vals = {0.0, 1.0, 1.6, 1.9, 2.0, 2.0}) annotation(
          Placement(visible = true, transformation(origin = {-176.0, 35.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular BRPM(x_vals = 0:10:60, y_vals = {1.02, 0.9, 0.7, 0.4, 0.25, 0.15, 0.1}) annotation(
          Placement(visible = true, transformation(origin = {-135.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular BRCM(x_vals = 0:5, y_vals = {1.05, 1.0, 0.9, 0.7, 0.6, 0.55}) annotation(
          Placement(visible = true, transformation(origin = {-95.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRCM(x_vals = 0:5, y_vals = {0.9, 1.0, 1.2, 1.5, 1.9, 3.0}) annotation(
          Placement(visible = true, transformation(origin = {-25.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRPM(x_vals = 0:10:60, y_vals = {0.92, 1.3, 2.0, 3.2, 4.8, 6.8, 9.2}) annotation(
          Placement(visible = true, transformation(origin = {15.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRFM(x_vals = {0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 20}, y_vals = {30.0, 3.0, 2.0, 1.4, 1.0, 0.7, 0.6, 0.5, 0.5, 0.5}) annotation(
          Placement(visible = true, transformation(origin = {55.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Gain Crowd_Rat(k = 1.0 / (Land_Area * Pop_dens_norm)) annotation(
          Placement(visible = true, transformation(origin = {-60.0, 35.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_1 annotation(
          Placement(visible = true, transformation(origin = {140.0, 80.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular NRMM(x_vals = 0:10, y_vals = {0.0, 1.0, 1.8, 2.4, 2.9, 3.3, 3.6, 3.8, 3.9, 3.95, 4.0}) annotation(
          Placement(visible = true, transformation(origin = {201.0, 80.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Sources.Source Source3 annotation(
          Placement(visible = true, transformation(origin = {50.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CI_Generation annotation(
          Placement(visible = true, transformation(origin = {80.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Capital_Investment(x0 = Cap_Invest_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CI_Discard annotation(
          Placement(visible = true, transformation(origin = {180.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink3 annotation(
          Placement(visible = true, transformation(origin = {210.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIG_norm(k = CIGN) annotation(
          Placement(visible = true, transformation(origin = {65.0, -77.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_2 annotation(
          Placement(visible = true, transformation(origin = {40.0, -100.0}, extent = {{-14.0, -16.0}, {14.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CID_norm(k = CIDN) annotation(
          Placement(visible = true, transformation(origin = {165.0, -77.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular CIM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {0.1, 1.0, 1.8, 2.4, 2.8, 3.0, 3.0}) annotation(
          Placement(visible = true, transformation(origin = {113.0, -100.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain MSL(k = 1.0 / ECIRN) annotation(
          Placement(visible = true, transformation(origin = {277.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain NRFR(k = 1.0 / NRI) annotation(
          Placement(visible = true, transformation(origin = {137.0, 51.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain ECIR(k = 1.0 / (1.0 - CIAFN)) annotation(
          Placement(visible = true, transformation(origin = {243.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_1 annotation(
          Placement(visible = true, transformation(origin = {215.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular NREM(x_vals = 0:0.25:1, y_vals = {0.0, 0.15, 0.5, 0.85, 1.0}) annotation(
          Placement(visible = true, transformation(origin = {175.0, 51.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -180)));
        Modelica.Blocks.Math.Division CIR annotation(
          Placement(visible = true, transformation(origin = {107.0, 6.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source4 annotation(
          Placement(visible = true, transformation(origin = {-150.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 P_Generation annotation(
          Placement(visible = true, transformation(origin = {-120.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Pollution(x0 = Pollution_0) annotation(
          Placement(visible = true, transformation(origin = {-70.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 P_Absorption annotation(
          Placement(visible = true, transformation(origin = {-20.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink4 annotation(
          Placement(visible = true, transformation(origin = {10.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Linear NotCIAF(m = -1.0, b = 1.0) annotation(
          Placement(visible = true, transformation(origin = {189.0, 10.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain Pol_Ratio(k = 1.0 / POLS) annotation(
          Placement(visible = true, transformation(origin = {-29.0, -95.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular FCM(x_vals = 0:5, y_vals = {2.4, 1.0, 0.6, 0.4, 0.3, 0.2}) annotation(
          Placement(visible = true, transformation(origin = {-85.0, -47.0}, extent = {{-15.0, 15.0}, {15.0, -15.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_2 annotation(
          Placement(visible = true, transformation(origin = {-117.0, -66.0}, extent = {{15.0, -14.0}, {-15.0, 14.0}}, rotation = 90)));
        SystemDynamics.Auxiliary.Gain Food_Ratio(k = FC / FN) annotation(
          Placement(visible = true, transformation(origin = {-149.0, -66.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source5 annotation(
          Placement(visible = true, transformation(origin = {50.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CIAFG annotation(
          Placement(visible = true, transformation(origin = {80.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level CIAF(x0 = CIAF_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CIAFD annotation(
          Placement(visible = true, transformation(origin = {180.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink5 annotation(
          Placement(visible = true, transformation(origin = {210.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIAF_D(k = 1.0 / CIAFT) annotation(
          Placement(visible = true, transformation(origin = {163.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIAF_G(k = 1.0 / CIAFT) annotation(
          Placement(visible = true, transformation(origin = {95.0, -180.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_3 annotation(
          Placement(visible = true, transformation(origin = {120.0, -230.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division P_Abs annotation(
          Placement(visible = true, transformation(origin = {-43.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_4 annotation(
          Placement(visible = true, transformation(origin = {-160.0, -220.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular POLCM(x_vals = {0, 1, 2, 3, 4, 5, 100}, y_vals = {0.05, 1.0, 3.0, 5.4, 7.4, 8.0, 8.0}) annotation(
          Placement(visible = true, transformation(origin = {-117.0, -220.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular POLAT(x_vals = 0:10:60, y_vals = {0.6, 2.5, 5.0, 8.0, 11.5, 15.5, 20.0}) annotation(
          Placement(visible = true, transformation(origin = {-39.0, -220.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular CFIFR(x_vals = {0, 0.5, 1, 1.5, 2, 20}, y_vals = {1.0, 0.6, 0.3, 0.15, 0.1, 0.1}) annotation(
          Placement(visible = true, transformation(origin = {69.0, -230.0}, extent = {{15.0, 16.0}, {-15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular FPM(x_vals = 0:10:60, y_vals = {1.02, 0.9, 0.65, 0.35, 0.2, 0.1, 0.05}) annotation(
          Placement(visible = true, transformation(origin = {-33.0, -66.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_5 annotation(
          Placement(visible = true, transformation(origin = {229.0, -200.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIRA(k = 1.0 / CIAFN) annotation(
          Placement(visible = true, transformation(origin = {255.0, -225.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular FPCI(x_vals = {0, 1, 2, 3, 4, 5, 6, 100}, y_vals = {0.5, 1.0, 1.4, 1.7, 1.9, 2.05, 2.2, 2.2}) annotation(
          Placement(visible = true, transformation(origin = {-153.0, -107.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular CIQR(y_vals = {0.7, 0.8, 1.0, 1.5, 2.0, 2.0}, x_vals = {0, 0.5, 1, 1.5, 2, 10}) annotation(
          Placement(visible = true, transformation(origin = {167.0, -230.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        Modelica.Blocks.Math.Division QLMF annotation(
          Placement(visible = true, transformation(origin = {315.0, -223.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular QLM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {0.2, 1.0, 1.7, 2.3, 2.7, 2.9, 2.9}) annotation(
          Placement(visible = true, transformation(origin = {319.0, -169.0}, extent = {{15.0, 17.0}, {-15.0, -17.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular QLF(x_vals = {0, 1, 2, 3, 4, 20}, y_vals = {0.0, 1.0, 1.8, 2.4, 2.7, 2.7}) annotation(
          Placement(visible = true, transformation(origin = {381.0, -232.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_4 Prod_4_1 annotation(
          Placement(visible = true, transformation(origin = {375.0, -163.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular QLC(x_vals = 0:0.5:5, y_vals = {2.0, 1.3, 1.0, 0.75, 0.55, 0.45, 0.38, 0.3, 0.25, 0.22, 0.2}) annotation(
          Placement(visible = true, transformation(origin = {335.0, -113.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular QLP(x_vals = 0:10:60, y_vals = {1.04, 0.85, 0.6, 0.3, 0.15, 0.05, 0.02}) annotation(
          Placement(visible = true, transformation(origin = {375.0, -113.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Gain Quality_of_Life(k = QLS) annotation(
          Placement(visible = true, transformation(origin = {412.0, -163.0}, extent = {{-20.0, -21.0}, {20.0, 21.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World2.Utilities.Parameter_Change NR_norm annotation(
          Placement(visible = true, transformation(origin = {162.5298, 105.0774}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World2.Utilities.Parameter_Change Pol_norm annotation(
          Placement(visible = true, transformation(origin = {-140.0, -180.815}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
      equation
        connect(NR_norm.u1, Prod_2_1.y) annotation(
          Line(visible = true, points = {{153.5298, 109.0774}, {140.0, 109.0774}, {140.0, 91.2}}, color = {0, 0, 191}));
        connect(P_Generation.u, Pol_norm.y) annotation(
          Line(visible = true, points = {{-120.0, -161.0}, {-120.0, -171.0}, {-120.0, -181.0}, {-126.5, -180.815}}, color = {0, 0, 191}));
        connect(Pol_norm.u1, Prod_2_4.y) annotation(
          Line(visible = true, points = {{-153.5, -174.815}, {-160.0, -175.0}, {-160.0, -208.8}}, color = {0, 0, 191}));
        connect(Depletion.u, NR_norm.y) annotation(
          Line(visible = true, points = {{180.0, 119.0}, {180.0, 105.0}, {171.5298, 105.0774}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, BRFM.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-176.0, -66.0}, {-176.0, 22.2}}, color = {0, 0, 191}));
        connect(BRFM.y, Prod_5_1.u2) annotation(
          Line(visible = true, points = {{-176.0, 52.6}, {-176.0, 60.0}, {-167.36, 60.0}, {-167.36, 72.0}}, color = {0, 0, 191}));
        connect(BRPM.u, QLP.u) annotation(
          Line(visible = true, points = {{-135.0, 23.0}, {-135.0, -20.0}, {-214.0, -20.0}, {-214.0, 214.0}, {375.0, 214.0}, {375.0, -125.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, BRPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, -20.0}, {-135.0, -20.0}, {-135.0, 23.0}}, color = {0, 0, 191}));
        connect(BRPM.y, Prod_5_1.u3) annotation(
          Line(visible = true, points = {{-135.0, 51.5}, {-135.0, 60.0}, {-160.0, 60.0}, {-160.0, 68.8}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, BRCM.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-95.0, 8.0}, {-95.0, 23.0}}, color = {0, 0, 191}));
        connect(BRCM.y, Prod_5_1.u4) annotation(
          Line(visible = true, points = {{-95.0, 51.5}, {-95.0, 66.0}, {-152.64, 66.0}, {-152.64, 72.0}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, DRCM.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-25.0, 8.0}, {-25.0, 23.0}}, color = {0, 0, 191}));
        connect(DRCM.y, Prod_5_2.u2) annotation(
          Line(visible = true, points = {{-25.0, 51.5}, {-25.0, 60.0}, {12.64, 60.0}, {12.64, 71.5}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, DRPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, 8.0}, {15.0, 8.0}, {15.0, 23.0}}, color = {0, 0, 191}));
        connect(DRPM.y, Prod_5_2.u3) annotation(
          Line(visible = true, points = {{15.0, 51.5}, {15.0, 60.0}, {20.0, 60.0}, {20.0, 68.5}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, QLC.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-206.0, 8.0}, {-206.0, 208.0}, {335.0, 208.0}, {335.0, -125.0}}, color = {0, 0, 191}));
        connect(FCM.u, Crowd_Rat.y) annotation(
          Line(visible = true, points = {{-73.0, -47.0}, {-60.0, -47.0}, {-60.0, 23.8}}, color = {0, 0, 191}));
        connect(Crowd_Rat.u, Population.y3) annotation(
          Line(visible = true, points = {{-60.0, 46.2}, {-60.0, 66.0}, {-70.0, 66.0}, {-70.0, 127.0}}, color = {0, 0, 191}));
        connect(Prod_2_5.u2, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{239.5, -200.0}, {260.0, -200.0}, {260.0, -20.0}, {160.0, -20.0}, {160.0, 30.0}, {203.8, 30.0}}, color = {0, 0, 191}));
        connect(Prod_3_1.y, ECIR.u) annotation(
          Line(visible = true, points = {{226.2, 30.0}, {232.5, 30.0}}, color = {0, 0, 191}));
        connect(CIR.y, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{90.5, 6.0}, {80.0, 6.0}, {80.0, 30.0}, {203.8, 30.0}}, color = {0, 0, 191}));
        connect(NotCIAF.y, Prod_3_1.u3) annotation(
          Line(visible = true, points = {{202.5, 10.0}, {215.0, 10.0}, {215.0, 19.5}}, color = {0, 0, 191}));
        connect(Prod_3_1.u1, NREM.y) annotation(
          Line(visible = true, points = {{215.0, 40.5}, {215.0, 51.0}, {191.5, 51.0}}, color = {0, 0, 191}));
        connect(QLP.y, Prod_4_1.u1) annotation(
          Line(visible = true, points = {{375.0, -96.5}, {375.0, -152.5}}, color = {0, 0, 191}));
        connect(QLC.y, Prod_4_1.u2) annotation(
          Line(visible = true, points = {{335.0, -96.5}, {335.0, -157.0}, {366.6, -157.0}}, color = {0, 0, 191}));
        connect(Prod_4_1.y, Quality_of_Life.u) annotation(
          Line(visible = true, points = {{385.5, -163.0}, {398.0, -163.0}}, color = {0, 0, 191}));
        connect(QLF.y, Prod_4_1.u4) annotation(
          Line(visible = true, points = {{364.5, -232.0}, {356.0, -232.0}, {356.0, -190.0}, {375.0, -190.0}, {375.0, -173.5}}, color = {0, 0, 191}));
        connect(QLM.y, Prod_4_1.u3) annotation(
          Line(visible = true, points = {{335.5, -169.0}, {366.6, -169.0}}, color = {0, 0, 191}));
        connect(QLF.y, QLMF.u2) annotation(
          Line(visible = true, points = {{364.5, -232.0}, {333.0, -232.0}}, color = {0, 0, 191}));
        connect(QLMF.y, CIQR.u) annotation(
          Line(visible = true, points = {{298.5, -223.0}, {290.0, -223.0}, {290.0, -256.0}, {190.0, -256.0}, {190.0, -230.0}, {179.0, -230.0}}, color = {0, 0, 191}));
        connect(P_Abs.u1, Pollution.y3) annotation(
          Line(visible = true, points = {{-61.0, -170.4}, {-70.0, -170.4}, {-70.0, -153.0}}, color = {0, 0, 191}));
        connect(CIG_norm.y, CI_Generation.u) annotation(
          Line(visible = true, points = {{75.5, -77.0}, {80.0, -77.0}, {80.0, -61.0}}, color = {0, 0, 191}));
        connect(CI_Discard.y1, Sink3.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, -40.0}, {199.0, -40.0}}, color = {191, 0, 191}));
        connect(Capital_Investment.u2, CI_Discard.y) annotation(
          Line(visible = true, points = {{152.0, -40.0}, {170.0, -40.0}}, color = {191, 0, 191}));
        connect(Source3.MassInPort1, CI_Generation.y) annotation(
          Line(visible = true, points = {{61.0, -40.0}, {70.0, -40.0}}, color = {191, 0, 191}));
        connect(CI_Generation.y1, Capital_Investment.u1) annotation(
          Line(visible = true, points = {{90.0, -40.0}, {108.0, -40.0}}, color = {191, 0, 191}));
        connect(FPM.u, POLAT.u) annotation(
          Line(visible = true, points = {{-21.0, -66.0}, {0.0, -66.0}, {0.0, -220.0}, {-27.0, -220.0}}, color = {0, 0, 191}));
        connect(CIRA.y, FPCI.u) annotation(
          Line(visible = true, points = {{265.5, -225.0}, {280.0, -225.0}, {280.0, -252.0}, {-210.0, -252.0}, {-210.0, -107.0}, {-165.0, -107.0}}, color = {0, 0, 191}));
        connect(Prod_2_1.u1, Population.y1) annotation(
          Line(visible = true, points = {{128.8, 80.0}, {100.0, 80.0}, {100.0, 194.0}, {-46.0, 194.0}, {-46.0, 151.0}, {-53.0, 151.0}}, color = {0, 0, 191}));
        connect(NRMM.u, DRMM.u) annotation(
          Line(visible = true, points = {{213.0, 80.0}, {300.0, 80.0}, {300.0, 171.0}, {63.0, 171.0}}, color = {0, 0, 191}));
        connect(NRMM.u, BRMM.u) annotation(
          Line(visible = true, points = {{213.0, 80.0}, {300.0, 80.0}, {300.0, 200.0}, {-70.0, 200.0}, {-70.0, 185.0}, {-93.0, 185.0}}, color = {0, 0, 191}));
        connect(CFIFR.u, QLF.u) annotation(
          Line(visible = true, points = {{57.0, -230.0}, {40.0, -230.0}, {40.0, -260.0}, {400.0, -260.0}, {400.0, -232.0}, {393.0, -232.0}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, QLF.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-220.0, -66.0}, {-220.0, -260.0}, {400.0, -260.0}, {400.0, -232.0}, {393.0, -232.0}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, DRFM.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-176.0, -66.0}, {-176.0, 0.0}, {55.0, 0.0}, {55.0, 47.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, FPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, -66.0}, {-21.0, -66.0}}, color = {0, 0, 191}));
        connect(CIR.y, POLCM.u) annotation(
          Line(visible = true, points = {{90.5, 6.0}, {80.0, 6.0}, {80.0, -6.0}, {10.0, -6.0}, {10.0, -116.0}, {-100.0, -116.0}, {-100.0, -220.0}, {-105.0, -220.0}}, color = {0, 0, 191}));
        connect(QLM.u, CIM.u) annotation(
          Line(visible = true, points = {{307.0, -169.0}, {300.0, -169.0}, {300.0, -100.0}, {125.0, -100.0}}, color = {0, 0, 191}));
        connect(QLM.y, QLMF.u1) annotation(
          Line(visible = true, points = {{335.5, -169.0}, {344.0, -169.0}, {344.0, -214.0}, {333.0, -214.0}}, color = {0, 0, 191}));
        connect(MSL.y, QLM.u) annotation(
          Line(visible = true, points = {{287.5, 30.0}, {300.0, 30.0}, {300.0, -169.0}, {307.0, -169.0}}, color = {0, 0, 191}));
        connect(NRMM.y, Prod_2_1.u2) annotation(
          Line(visible = true, points = {{184.5, 80.0}, {151.2, 80.0}}, color = {0, 0, 191}));
        connect(MSL.y, NRMM.u) annotation(
          Line(visible = true, points = {{287.5, 30.0}, {300.0, 30.0}, {300.0, 80.0}, {213.0, 80.0}}, color = {0, 0, 191}));
        connect(ECIR.y, MSL.u) annotation(
          Line(visible = true, points = {{253.5, 30.0}, {266.5, 30.0}}, color = {0, 0, 191}));
        connect(NotCIAF.u, CIAF.y1) annotation(
          Line(visible = true, points = {{175.5, 10.0}, {168.0, 10.0}, {168.0, -8.0}, {240.0, -8.0}, {240.0, -110.0}, {154.0, -110.0}, {154.0, -129.0}, {147.0, -129.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, CIR.u2) annotation(
          Line(visible = true, points = {{30.2, -100.0}, {20.0, -100.0}, {20.0, -14.0}, {140.0, -14.0}, {140.0, -3.6}, {125.0, -3.6}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, Population.y1) annotation(
          Line(visible = true, points = {{30.2, -100.0}, {20.0, -100.0}, {20.0, -14.0}, {320.0, -14.0}, {320.0, 194.0}, {-46.0, 194.0}, {-46.0, 151.0}, {-53.0, 151.0}}, color = {0, 0, 191}));
        connect(Prod_2_4.u1, Population.y) annotation(
          Line(visible = true, points = {{-171.2, -220.0}, {-200.0, -220.0}, {-200.0, 164.0}, {-94.0, 164.0}, {-94.0, 151.0}, {-87.0, 151.0}}, color = {0, 0, 191}));
        connect(CID_norm.u, Capital_Investment.y2) annotation(
          Line(visible = true, points = {{154.5, -77.0}, {145.0, -77.0}, {145.0, -53.0}}, color = {0, 0, 191}));
        connect(CID_norm.y, CI_Discard.u) annotation(
          Line(visible = true, points = {{175.5, -77.0}, {180.0, -77.0}, {180.0, -61.0}}, color = {0, 0, 191}));
        connect(CIM.y, Prod_2_2.u2) annotation(
          Line(visible = true, points = {{96.5, -100.0}, {49.8, -100.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.y, CIG_norm.u) annotation(
          Line(visible = true, points = {{40.0, -88.8}, {40.0, -77.0}, {54.5, -77.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.u, Pollution.y1) annotation(
          Line(visible = true, points = {{-39.5, -95.0}, {-46.0, -95.0}, {-46.0, -129.0}, {-53.0, -129.0}}, color = {0, 0, 191}));
        connect(POLCM.y, Prod_2_4.u2) annotation(
          Line(visible = true, points = {{-133.5, -220.0}, {-148.8, -220.0}}, color = {0, 0, 191}));
        connect(POLAT.y, P_Abs.u2) annotation(
          Line(visible = true, points = {{-55.5, -220.0}, {-70.0, -220.0}, {-70.0, -189.6}, {-61.0, -189.6}}, color = {0, 0, 191}));
        connect(P_Abs.y, P_Absorption.u) annotation(
          Line(visible = true, points = {{-26.5, -180.0}, {-20.0, -180.0}, {-20.0, -161.0}}, color = {0, 0, 191}));
        connect(CFIFR.y, Prod_2_3.u1) annotation(
          Line(visible = true, points = {{85.5, -230.0}, {108.8, -230.0}}, color = {0, 0, 191}));
        connect(CIQR.y, Prod_2_3.u2) annotation(
          Line(visible = true, points = {{150.5, -230.0}, {131.2, -230.0}}, color = {0, 0, 191}));
        connect(CIAF_G.y, CIAFG.u) annotation(
          Line(visible = true, points = {{84.5, -180.0}, {80.0, -180.0}, {80.0, -161.0}}, color = {0, 0, 191}));
        connect(CIAF_G.u, Prod_2_3.y) annotation(
          Line(visible = true, points = {{105.5, -180.0}, {120.0, -180.0}, {120.0, -218.8}}, color = {0, 0, 191}));
        connect(CIRA.u, Prod_2_5.y) annotation(
          Line(visible = true, points = {{244.5, -225.0}, {229.0, -225.0}, {229.0, -211.2}}, color = {0, 0, 191}));
        connect(Prod_2_5.u1, CIAF.y3) annotation(
          Line(visible = true, points = {{218.5, -200.0}, {130.0, -200.0}, {130.0, -153.0}}, color = {0, 0, 191}));
        connect(CIAF_D.u, CIAF.y2) annotation(
          Line(visible = true, points = {{152.5, -180.0}, {145.0, -180.0}, {145.0, -153.0}}, color = {0, 0, 191}));
        connect(CIAF_D.y, CIAFD.u) annotation(
          Line(visible = true, points = {{173.5, -180.0}, {180.0, -180.0}, {180.0, -161.0}}, color = {0, 0, 191}));
        connect(CIAFD.y1, Sink5.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, -140.0}, {199.0, -140.0}}, color = {191, 0, 191}));
        connect(CIAF.u2, CIAFD.y) annotation(
          Line(visible = true, points = {{152.0, -140.0}, {170.0, -140.0}}, color = {191, 0, 191}));
        connect(CIAFG.y1, CIAF.u1) annotation(
          Line(visible = true, points = {{90.0, -140.0}, {108.0, -140.0}}, color = {191, 0, 191}));
        connect(Source5.MassInPort1, CIAFG.y) annotation(
          Line(visible = true, points = {{61.0, -140.0}, {70.0, -140.0}}, color = {191, 0, 191}));
        connect(P_Absorption.y1, Sink4.MassInPort1) annotation(
          Line(visible = true, points = {{-10.0, -140.0}, {-1.0, -140.0}}, color = {191, 0, 191}));
        connect(Pollution.u2, P_Absorption.y) annotation(
          Line(visible = true, points = {{-48.0, -140.0}, {-30.0, -140.0}}, color = {191, 0, 191}));
        connect(P_Generation.y1, Pollution.u1) annotation(
          Line(visible = true, points = {{-110.0, -140.0}, {-92.0, -140.0}}, color = {191, 0, 191}));
        connect(Source4.MassInPort1, P_Generation.y) annotation(
          Line(visible = true, points = {{-139.0, -140.0}, {-130.0, -140.0}}, color = {191, 0, 191}));
        connect(FPCI.y, Prod_3_2.u3) annotation(
          Line(visible = true, points = {{-136.5, -107.0}, {-117.0, -107.0}, {-117.0, -76.5}}, color = {0, 0, 191}));
        connect(FPM.y, Prod_3_2.u2) annotation(
          Line(visible = true, points = {{-49.5, -66.0}, {-107.2, -66.0}}, color = {0, 0, 191}));
        connect(Prod_3_2.u1, FCM.y) annotation(
          Line(visible = true, points = {{-117.0, -55.5}, {-117.0, -47.0}, {-101.5, -47.0}}, color = {0, 0, 191}));
        connect(Prod_3_2.y, Food_Ratio.u) annotation(
          Line(visible = true, points = {{-126.8, -66.0}, {-138.5, -66.0}}, color = {0, 0, 191}));
        connect(CIR.u1, Capital_Investment.y1) annotation(
          Line(visible = true, points = {{125.0, 15.6}, {154.0, 15.6}, {154.0, -29.0}, {147.0, -29.0}}, color = {0, 0, 191}));
        connect(NRFR.y, NREM.u) annotation(
          Line(visible = true, points = {{147.5, 51.0}, {163.0, 51.0}}, color = {0, 0, 191}));
        connect(DRMM.y, Prod_5_2.u5) annotation(
          Line(visible = true, points = {{34.5, 171.0}, {26.0, 171.0}, {26.0, 104.0}, {40.0, 104.0}, {40.0, 79.0}, {31.2, 79.0}}, color = {0, 0, 191}));
        connect(DR_norm.y, Death_Rate.u) annotation(
          Line(visible = true, points = {{-13.5, 103.0}, {-20.0, 103.0}, {-20.0, 119.0}}, color = {0, 0, 191}));
        connect(Prod_5_2.y, DR_norm.u) annotation(
          Line(visible = true, points = {{20.0, 89.5}, {20.0, 103.0}, {7.5, 103.0}}, color = {0, 0, 191}));
        connect(Prod_5_2.u1, Population.y2) annotation(
          Line(visible = true, points = {{8.8, 79.0}, {-55.0, 79.0}, {-55.0, 127.0}}, color = {0, 0, 191}));
        connect(BRMM.y, Prod_5_1.u1) annotation(
          Line(visible = true, points = {{-121.5, 185.0}, {-180.0, 185.0}, {-180.0, 80.0}, {-171.2, 80.0}}, color = {0, 0, 191}));
        connect(Prod_5_1.u5, Population.y4) annotation(
          Line(visible = true, points = {{-148.8, 80.0}, {-85.0, 80.0}, {-85.0, 127.0}}, color = {0, 0, 191}));
        connect(Prod_5_1.y, BR_norm.u) annotation(
          Line(visible = true, points = {{-160.0, 91.2}, {-160.0, 103.0}, {-145.5, 103.0}}, color = {0, 0, 191}));
        connect(BR_norm.y, Birth_Rate.u) annotation(
          Line(visible = true, points = {{-124.5, 103.0}, {-120.0, 103.0}, {-120.0, 119.0}}, color = {0, 0, 191}));
        connect(Source1.MassInPort1, Birth_Rate.y) annotation(
          Line(visible = true, points = {{-139.0, 140.0}, {-130.0, 140.0}}, color = {191, 0, 191}));
        connect(Birth_Rate.y1, Population.u1) annotation(
          Line(visible = true, points = {{-110.0, 140.0}, {-92.0, 140.0}}, color = {191, 0, 191}));
        connect(Population.u2, Death_Rate.y) annotation(
          Line(visible = true, points = {{-48.0, 140.0}, {-30.0, 140.0}}, color = {191, 0, 191}));
        connect(Death_Rate.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, points = {{-10.0, 140.0}, {-1.0, 140.0}}, color = {191, 0, 191}));
        connect(Source2.MassInPort1, Generation.y) annotation(
          Line(visible = true, points = {{61.0, 140.0}, {70.0, 140.0}}, color = {191, 0, 191}));
        connect(Gen_Const.y, Generation.u) annotation(
          Line(visible = true, points = {{80.0, 111.5}, {80.0, 119.0}}, color = {0, 0, 191}));
        connect(NRFR.u, Natural_Resources.y4) annotation(
          Line(visible = true, points = {{126.5, 51.0}, {115.0, 51.0}, {115.0, 127.0}}, color = {0, 0, 191}));
        connect(Generation.y1, Natural_Resources.u1) annotation(
          Line(visible = true, points = {{90.0, 140.0}, {108.0, 140.0}}, color = {191, 0, 191}));
        connect(Natural_Resources.u2, Depletion.y) annotation(
          Line(visible = true, points = {{152.0, 140.0}, {170.0, 140.0}}, color = {191, 0, 191}));
        connect(Depletion.y1, Sink2.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, 140.0}, {199.0, 140.0}}, color = {191, 0, 191}));
        connect(DRFM.y, Prod_5_2.u4) annotation(
          Line(visible = true, points = {{55.0, 18.5}, {55.0, 60.0}, {27.36, 60.0}, {27.36, 71.5}}, color = {0, 0, 191}));
        Pop = Population.y;
        Pol = Pollution.y;
        Pol_rat = Pol_Ratio.y;
        Cap_inv = Capital_Investment.y;
        Qual_life = Quality_of_Life.y;
        Nat_res = Natural_Resources.y;
        NRUN = if time > 1970 then 0.25 else 1.0;
        NR_norm.u2 = NRUN;
        POLN = if time > 1970 then 0.25 else 1.0;
        Pol_norm.u2 = POLN;
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-220.0, -264.0}, {442.0, 220.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-152.0, 70.0}, {368.0, 140.0}}, textString = "2nd Modification", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 0, 255}, extent = {{-148.0, -26.0}, {372.0, 44.0}}, textString = "POLN", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-150.0, -106.0}, {370.0, -36.0}}, textString = "reduced to 0.25", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-150.0, -192.0}, {370.0, -122.0}}, textString = "in 1970", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-62.0, 6.0}, {-58.0, 10.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{98.0, 192.0}, {102.0, 196.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{138.0, -16.0}, {142.0, -12.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -22.0}, {2.0, -18.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-178.0, -2.0}, {-174.0, 2.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{78.0, 4.0}, {82.0, 8.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -97.0}, {2.0, -93.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-178.0, -68.0}, {-174.0, -64.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -68.0}, {2.0, -64.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{158.0, 28.0}, {162.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{38.0, -262.0}, {42.0, -258.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, -102.0}, {302.0, -98.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 28.0}, {302.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 78.0}, {302.0, 82.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 169.0}, {302.0, 173.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{342.0, -171.0}, {346.0, -167.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{354.0, -234.0}, {358.0, -230.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-97.0, 6.0}, {-93.0, 10.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-137.0, -22.0}, {-133.0, -18.0}})}),
          experiment(StartTime = 1900, StopTime = 2100),
          experimentSetupOutput,
          Documentation(info = "<html>
This is the second modification proposed by <a href=\"http://en.wikipedia.org/wiki/Jay_Wright_Forrester\">Jay Forrester</a> in his <font color=red><b>WORLD2</b></font> model. The generation of pollution is reduced in 1970 to 25% of their former value in order to reduce the effect of pollution on climate and food production. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Forrester, J.W. (1971), <a href=\"http://www.amazon.com/World-Dynamics-Jay-W-Forrester/dp/1883823382/ref=ed_oe_h/103-2487145-1208659\">World Dynamics</a>, Pegasus Communications, 160p.
</ol> <p>
 
<hr> <p>
 
Simulate the model across 200 years, and plot the state variables as well as the quality of life as functions of the calendar years: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/SD_Fig3.png\"> <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_3;

      model Scenario_4 "4th Scenario"
        parameter Real Population_0 = 1650000000.0 "World population in 1900";
        parameter Real Pollution_0 = 200000000.0 "Pollution in 1900";
        parameter Real Nat_Resources_0(unit = "ton") = 900000000000.0 "Unrecoverable natural resources in 1900";
        parameter Real Cap_Invest_0(unit = "dollar") = 400000000.0 "Capital investment in 1900";
        parameter Real CIAF_0 = 0.2 "Proportion of capital investment in agriculture in 1900";
        parameter Real BRN(unit = "1/yr") = 0.04 "Normal birth rate";
        parameter Real CIAFN(unit = "dollar") = 0.3 "CIAF normalization";
        parameter Real CIAFT(unit = "yr") = 15.0 "CIAF time constant";
        parameter Real CIDN(unit = "dollar/yr") = 0.025 "Normal capital discard";
        parameter Real CIGN(unit = "dollar/yr") = 0.05 "Normal capital generation";
        parameter Real ECIRN(unit = "dollar") = 1.0 "Capital normalization";
        parameter Real FC(unit = "kg/yr") = 1.0 "Food coefficient";
        parameter Real FN(unit = "kg/yr") = 1.0 "Food normalization";
        parameter Real Land_Area(unit = "hectare") = 135000000.0 "Area of arable land";
        parameter Real NRI(unit = "ton") = 900000000000.0 "Initial natural resources";
        parameter Real POLS = 3599900000.0 "Standard pollution";
        parameter Real Pop_dens_norm(unit = "1/hectare") = 26.5 "Normal population density";
        parameter Real QLS = 1.0 "Standard quality of life";
        output Real Pop "World population";
        output Real Pol "Pollution";
        output Real Pol_rat "Pollution ratio";
        output Real Cap_inv(unit = "dollar") "Capital investment";
        output Real Qual_life "Quality of life";
        output Real Nat_res(unit = "ton") "Natural unrecoverable resources";
        Real NRUN(unit = "1/yr") "Normal resource utilization";
        Real POLN(unit = "1/yr") "Normal pollution";
        Real DRN(unit = "1/yr") "Normal death rate";
        Real Pop_meas;
      protected
        Real time_vals[12](each unit = "yr") = {1900, 1910, 1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000, 2500};
        Real pop_vals[12] = {1600000000.0, 1750000000.0, 1860000000.0, 2070000000.0, 2300000000.0, 2556000000.0, 3039500000.0, 3706560000.0, 4378100000.0, 5190300000.0, 5996200000.0, 6000000000.0};
      public
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-150.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Birth_Rate annotation(
          Placement(visible = true, transformation(origin = {-120.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Population(x0 = Population_0) annotation(
          Placement(visible = true, transformation(origin = {-70.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Death_Rate annotation(
          Placement(visible = true, transformation(origin = {-20.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {10.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source2 annotation(
          Placement(visible = true, transformation(origin = {50.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Generation annotation(
          Placement(visible = true, transformation(origin = {80.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Natural_Resources(x0 = Nat_Resources_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Depletion annotation(
          Placement(visible = true, transformation(origin = {180.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink2 annotation(
          Placement(visible = true, transformation(origin = {210.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Gen_Const(k = 0) annotation(
          Placement(visible = true, transformation(origin = {80.0, 101.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular BRMM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {1.2, 1.0, 0.85, 0.75, 0.7, 0.7, 0.7}) annotation(
          Placement(visible = true, transformation(origin = {-105.0, 185.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular DRMM(x_vals = {0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 20}, y_vals = {3.0, 1.8, 1.0, 0.8, 0.7, 0.6, 0.53, 0.5, 0.5, 0.5, 0.5, 0.5}) annotation(
          Placement(visible = true, transformation(origin = {51.0, 171.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain BR_norm(k = BRN) annotation(
          Placement(visible = true, transformation(origin = {-135.0, 103.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_5 Prod_5_1 annotation(
          Placement(visible = true, transformation(origin = {-160.0, 80.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_5 Prod_5_2 annotation(
          Placement(visible = true, transformation(origin = {20.0, 79.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular BRFM(x_vals = {0, 1, 2, 3, 4, 20}, y_vals = {0.0, 1.0, 1.6, 1.9, 2.0, 2.0}) annotation(
          Placement(visible = true, transformation(origin = {-176.0, 35.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular BRPM(x_vals = 0:10:60, y_vals = {1.02, 0.9, 0.7, 0.4, 0.25, 0.15, 0.1}) annotation(
          Placement(visible = true, transformation(origin = {-135.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular BRCM(x_vals = 0:5, y_vals = {1.05, 1.0, 0.9, 0.7, 0.6, 0.55}) annotation(
          Placement(visible = true, transformation(origin = {-95.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRCM(x_vals = 0:5, y_vals = {0.9, 1.0, 1.2, 1.5, 1.9, 3.0}) annotation(
          Placement(visible = true, transformation(origin = {-25.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRPM(x_vals = 0:10:60, y_vals = {0.92, 1.3, 2.0, 3.2, 4.8, 6.8, 9.2}) annotation(
          Placement(visible = true, transformation(origin = {15.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRFM(x_vals = {0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 20}, y_vals = {30.0, 3.0, 2.0, 1.4, 1.0, 0.7, 0.6, 0.5, 0.5, 0.5}) annotation(
          Placement(visible = true, transformation(origin = {55.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Auxiliary.Gain Crowd_Rat(k = 1.0 / (Land_Area * Pop_dens_norm)) annotation(
          Placement(visible = true, transformation(origin = {-60.0, 35.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_1 annotation(
          Placement(visible = true, transformation(origin = {140.0, 80.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular NRMM(x_vals = 0:10, y_vals = {0.0, 1.0, 1.8, 2.4, 2.9, 3.3, 3.6, 3.8, 3.9, 3.95, 4.0}) annotation(
          Placement(visible = true, transformation(origin = {201.0, 80.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Sources.Source Source3 annotation(
          Placement(visible = true, transformation(origin = {50.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CI_Generation annotation(
          Placement(visible = true, transformation(origin = {80.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Capital_Investment(x0 = Cap_Invest_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CI_Discard annotation(
          Placement(visible = true, transformation(origin = {180.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink3 annotation(
          Placement(visible = true, transformation(origin = {210.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIG_norm(k = CIGN) annotation(
          Placement(visible = true, transformation(origin = {65.0, -77.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_2 annotation(
          Placement(visible = true, transformation(origin = {40.0, -100.0}, extent = {{-14.0, -16.0}, {14.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CID_norm(k = CIDN) annotation(
          Placement(visible = true, transformation(origin = {165.0, -77.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular CIM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {0.1, 1.0, 1.8, 2.4, 2.8, 3.0, 3.0}) annotation(
          Placement(visible = true, transformation(origin = {113.0, -100.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain MSL(k = 1.0 / ECIRN) annotation(
          Placement(visible = true, transformation(origin = {277.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain NRFR(k = 1.0 / NRI) annotation(
          Placement(visible = true, transformation(origin = {137.0, 51.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain ECIR(k = 1.0 / (1.0 - CIAFN)) annotation(
          Placement(visible = true, transformation(origin = {243.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_1 annotation(
          Placement(visible = true, transformation(origin = {215.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular NREM(x_vals = 0:0.25:1, y_vals = {0.0, 0.15, 0.5, 0.85, 1.0}) annotation(
          Placement(visible = true, transformation(origin = {175.0, 51.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -180)));
        Modelica.Blocks.Math.Division CIR annotation(
          Placement(visible = true, transformation(origin = {107.0, 6.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source4 annotation(
          Placement(visible = true, transformation(origin = {-150.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 P_Generation annotation(
          Placement(visible = true, transformation(origin = {-120.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Pollution(x0 = Pollution_0) annotation(
          Placement(visible = true, transformation(origin = {-70.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 P_Absorption annotation(
          Placement(visible = true, transformation(origin = {-20.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink4 annotation(
          Placement(visible = true, transformation(origin = {10.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Linear NotCIAF(m = -1.0, b = 1.0) annotation(
          Placement(visible = true, transformation(origin = {189.0, 10.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain Pol_Ratio(k = 1.0 / POLS) annotation(
          Placement(visible = true, transformation(origin = {-29.0, -95.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular FCM(x_vals = 0:5, y_vals = {2.4, 1.0, 0.6, 0.4, 0.3, 0.2}) annotation(
          Placement(visible = true, transformation(origin = {-85.0, -47.0}, extent = {{-15.0, 15.0}, {15.0, -15.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_2 annotation(
          Placement(visible = true, transformation(origin = {-117.0, -66.0}, extent = {{15.0, -14.0}, {-15.0, 14.0}}, rotation = 90)));
        SystemDynamics.Auxiliary.Gain Food_Ratio(k = FC / FN) annotation(
          Placement(visible = true, transformation(origin = {-149.0, -66.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source5 annotation(
          Placement(visible = true, transformation(origin = {50.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CIAFG annotation(
          Placement(visible = true, transformation(origin = {80.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level CIAF(x0 = CIAF_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CIAFD annotation(
          Placement(visible = true, transformation(origin = {180.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink5 annotation(
          Placement(visible = true, transformation(origin = {210.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIAF_D(k = 1.0 / CIAFT) annotation(
          Placement(visible = true, transformation(origin = {163.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIAF_G(k = 1.0 / CIAFT) annotation(
          Placement(visible = true, transformation(origin = {95.0, -180.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_3 annotation(
          Placement(visible = true, transformation(origin = {120.0, -230.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division P_Abs annotation(
          Placement(visible = true, transformation(origin = {-43.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_4 annotation(
          Placement(visible = true, transformation(origin = {-160.0, -220.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular POLCM(x_vals = {0, 1, 2, 3, 4, 5, 100}, y_vals = {0.05, 1.0, 3.0, 5.4, 7.4, 8.0, 8.0}) annotation(
          Placement(visible = true, transformation(origin = {-117.0, -220.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular POLAT(x_vals = 0:10:60, y_vals = {0.6, 2.5, 5.0, 8.0, 11.5, 15.5, 20.0}) annotation(
          Placement(visible = true, transformation(origin = {-39.0, -220.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular CFIFR(x_vals = {0, 0.5, 1, 1.5, 2, 20}, y_vals = {1.0, 0.6, 0.3, 0.15, 0.1, 0.1}) annotation(
          Placement(visible = true, transformation(origin = {69.0, -230.0}, extent = {{15.0, 16.0}, {-15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular FPM(x_vals = 0:10:60, y_vals = {1.02, 0.9, 0.65, 0.35, 0.2, 0.1, 0.05}) annotation(
          Placement(visible = true, transformation(origin = {-33.0, -66.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_5 annotation(
          Placement(visible = true, transformation(origin = {229.0, -200.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIRA(k = 1.0 / CIAFN) annotation(
          Placement(visible = true, transformation(origin = {255.0, -225.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular FPCI(x_vals = {0, 1, 2, 3, 4, 5, 6, 100}, y_vals = {0.5, 1.0, 1.4, 1.7, 1.9, 2.05, 2.2, 2.2}) annotation(
          Placement(visible = true, transformation(origin = {-153.0, -107.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular CIQR(y_vals = {0.7, 0.8, 1.0, 1.5, 2.0, 2.0}, x_vals = {0, 0.5, 1, 1.5, 2, 10}) annotation(
          Placement(visible = true, transformation(origin = {167.0, -230.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        Modelica.Blocks.Math.Division QLMF annotation(
          Placement(visible = true, transformation(origin = {315.0, -223.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular QLM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {0.2, 1.0, 1.7, 2.3, 2.7, 2.9, 2.9}) annotation(
          Placement(visible = true, transformation(origin = {319.0, -169.0}, extent = {{15.0, 17.0}, {-15.0, -17.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular QLF(x_vals = {0, 1, 2, 3, 4, 20}, y_vals = {0.0, 1.0, 1.8, 2.4, 2.7, 2.7}) annotation(
          Placement(visible = true, transformation(origin = {381.0, -232.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_4 Prod_4_1 annotation(
          Placement(visible = true, transformation(origin = {375.0, -163.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular QLC(x_vals = 0:0.5:5, y_vals = {2.0, 1.3, 1.0, 0.75, 0.55, 0.45, 0.38, 0.3, 0.25, 0.22, 0.2}) annotation(
          Placement(visible = true, transformation(origin = {335.0, -113.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular QLP(x_vals = 0:10:60, y_vals = {1.04, 0.85, 0.6, 0.3, 0.15, 0.05, 0.02}) annotation(
          Placement(visible = true, transformation(origin = {375.0, -113.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Gain Quality_of_Life(k = QLS) annotation(
          Placement(visible = true, transformation(origin = {412.0, -163.0}, extent = {{-20.0, -21.0}, {20.0, 21.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World2.Utilities.Parameter_Change NR_norm annotation(
          Placement(visible = true, transformation(origin = {160.0, 105.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -360)));
        SystemDynamics.WorldDynamics.World2.Utilities.Parameter_Change Pol_norm annotation(
          Placement(visible = true, transformation(origin = {-138.175, -180.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          extent = {{-154, -196}, {-124, -166}});
        SystemDynamics.WorldDynamics.World2.Utilities.Parameter_Change DR_norm annotation(
          Placement(visible = true, transformation(origin = {-0.0, 100.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
      equation
        connect(Pol_norm.u1, Prod_2_4.y) annotation(
          Line(visible = true, points = {{-151.675, -174.0}, {-160.0, -174.0}, {-160.0, -208.8}}, color = {0, 0, 191}));
        connect(P_Generation.u, Pol_norm.y) annotation(
          Line(visible = true, points = {{-120.0, -161.0}, {-120.0, -180.0}, {-124.675, -180.0}}, color = {0, 0, 191}));
        connect(Depletion.u, NR_norm.y) annotation(
          Line(visible = true, origin = {177.8333, 109.6667}, points = {{2.1667, 9.3333}, {2.1667, -4.6667}, {-4.3333, -4.6667}}, color = {0, 0, 191}));
        connect(NR_norm.u1, Prod_2_1.y) annotation(
          Line(visible = true, points = {{146.5, 111.0}, {140.0, 111.0}, {140.0, 91.2}}, color = {0, 0, 191}));
        connect(DR_norm.u1, Prod_5_2.y) annotation(
          Line(visible = true, points = {{13.5, 106.0}, {20.0, 106.0}, {20.0, 89.5}}, color = {0, 0, 191}));
        connect(DR_norm.y, Death_Rate.u) annotation(
          Line(visible = true, origin = {-17.8333, 106.3333}, points = {{4.3333, -6.3333}, {-2.1667, -6.3333}, {-2.1667, 12.6667}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, BRFM.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-176.0, -66.0}, {-176.0, 22.2}}, color = {0, 0, 191}));
        connect(BRFM.y, Prod_5_1.u2) annotation(
          Line(visible = true, points = {{-176.0, 52.6}, {-176.0, 60.0}, {-167.36, 60.0}, {-167.36, 72.0}}, color = {0, 0, 191}));
        connect(BRPM.u, QLP.u) annotation(
          Line(visible = true, points = {{-135.0, 23.0}, {-135.0, -20.0}, {-214.0, -20.0}, {-214.0, 214.0}, {375.0, 214.0}, {375.0, -125.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, BRPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, -20.0}, {-135.0, -20.0}, {-135.0, 23.0}}, color = {0, 0, 191}));
        connect(BRPM.y, Prod_5_1.u3) annotation(
          Line(visible = true, points = {{-135.0, 51.5}, {-135.0, 60.0}, {-160.0, 60.0}, {-160.0, 68.8}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, BRCM.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-95.0, 8.0}, {-95.0, 23.0}}, color = {0, 0, 191}));
        connect(BRCM.y, Prod_5_1.u4) annotation(
          Line(visible = true, points = {{-95.0, 51.5}, {-95.0, 66.0}, {-152.64, 66.0}, {-152.64, 72.0}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, DRCM.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-25.0, 8.0}, {-25.0, 23.0}}, color = {0, 0, 191}));
        connect(DRCM.y, Prod_5_2.u2) annotation(
          Line(visible = true, points = {{-25.0, 51.5}, {-25.0, 60.0}, {12.64, 60.0}, {12.64, 71.5}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, DRPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, 8.0}, {15.0, 8.0}, {15.0, 23.0}}, color = {0, 0, 191}));
        connect(DRPM.y, Prod_5_2.u3) annotation(
          Line(visible = true, points = {{15.0, 51.5}, {15.0, 60.0}, {20.0, 60.0}, {20.0, 68.5}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, DRFM.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-176.0, -66.0}, {-176.0, 0.0}, {55.0, 0.0}, {55.0, 23.0}}, color = {0, 0, 191}));
        connect(DRFM.y, Prod_5_2.u4) annotation(
          Line(visible = true, points = {{55.0, 51.5}, {55.0, 60.0}, {27.36, 60.0}, {27.36, 71.5}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, QLC.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-206.0, 8.0}, {-206.0, 208.0}, {335.0, 208.0}, {335.0, -125.0}}, color = {0, 0, 191}));
        connect(FCM.u, Crowd_Rat.y) annotation(
          Line(visible = true, points = {{-73.0, -47.0}, {-60.0, -47.0}, {-60.0, 23.8}}, color = {0, 0, 191}));
        connect(Crowd_Rat.u, Population.y3) annotation(
          Line(visible = true, points = {{-60.0, 46.2}, {-60.0, 66.0}, {-70.0, 66.0}, {-70.0, 127.0}}, color = {0, 0, 191}));
        connect(Prod_2_5.u2, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{239.5, -200.0}, {260.0, -200.0}, {260.0, -20.0}, {160.0, -20.0}, {160.0, 30.0}, {203.8, 30.0}}, color = {0, 0, 191}));
        connect(Prod_3_1.y, ECIR.u) annotation(
          Line(visible = true, points = {{226.2, 30.0}, {232.5, 30.0}}, color = {0, 0, 191}));
        connect(CIR.y, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{90.5, 6.0}, {80.0, 6.0}, {80.0, 30.0}, {203.8, 30.0}}, color = {0, 0, 191}));
        connect(NotCIAF.y, Prod_3_1.u3) annotation(
          Line(visible = true, points = {{202.5, 10.0}, {215.0, 10.0}, {215.0, 19.5}}, color = {0, 0, 191}));
        connect(Prod_3_1.u1, NREM.y) annotation(
          Line(visible = true, points = {{215.0, 40.5}, {215.0, 51.0}, {191.5, 51.0}}, color = {0, 0, 191}));
        connect(QLP.y, Prod_4_1.u1) annotation(
          Line(visible = true, points = {{375.0, -96.5}, {375.0, -152.5}}, color = {0, 0, 191}));
        connect(QLC.y, Prod_4_1.u2) annotation(
          Line(visible = true, points = {{335.0, -96.5}, {335.0, -157.0}, {366.6, -157.0}}, color = {0, 0, 191}));
        connect(Prod_4_1.y, Quality_of_Life.u) annotation(
          Line(visible = true, points = {{385.5, -163.0}, {398.0, -163.0}}, color = {0, 0, 191}));
        connect(QLF.y, Prod_4_1.u4) annotation(
          Line(visible = true, points = {{364.5, -232.0}, {356.0, -232.0}, {356.0, -190.0}, {375.0, -190.0}, {375.0, -173.5}}, color = {0, 0, 191}));
        connect(QLM.y, Prod_4_1.u3) annotation(
          Line(visible = true, points = {{335.5, -169.0}, {366.6, -169.0}}, color = {0, 0, 191}));
        connect(QLF.y, QLMF.u2) annotation(
          Line(visible = true, points = {{364.5, -232.0}, {333.0, -232.0}}, color = {0, 0, 191}));
        connect(QLMF.y, CIQR.u) annotation(
          Line(visible = true, points = {{298.5, -223.0}, {290.0, -223.0}, {290.0, -256.0}, {190.0, -256.0}, {190.0, -230.0}, {179.0, -230.0}}, color = {0, 0, 191}));
        connect(P_Abs.u1, Pollution.y3) annotation(
          Line(visible = true, points = {{-61.0, -170.4}, {-70.0, -170.4}, {-70.0, -153.0}}, color = {0, 0, 191}));
        connect(CIG_norm.y, CI_Generation.u) annotation(
          Line(visible = true, points = {{75.5, -77.0}, {80.0, -77.0}, {80.0, -61.0}}, color = {0, 0, 191}));
        connect(CI_Discard.y1, Sink3.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, -40.0}, {199.0, -40.0}}, color = {191, 0, 191}));
        connect(Capital_Investment.u2, CI_Discard.y) annotation(
          Line(visible = true, points = {{152.0, -40.0}, {170.0, -40.0}}, color = {191, 0, 191}));
        connect(Source3.MassInPort1, CI_Generation.y) annotation(
          Line(visible = true, points = {{61.0, -40.0}, {70.0, -40.0}}, color = {191, 0, 191}));
        connect(CI_Generation.y1, Capital_Investment.u1) annotation(
          Line(visible = true, points = {{90.0, -40.0}, {108.0, -40.0}}, color = {191, 0, 191}));
        connect(FPM.u, POLAT.u) annotation(
          Line(visible = true, points = {{-21.0, -66.0}, {0.0, -66.0}, {0.0, -220.0}, {-27.0, -220.0}}, color = {0, 0, 191}));
        connect(CIRA.y, FPCI.u) annotation(
          Line(visible = true, points = {{265.5, -225.0}, {280.0, -225.0}, {280.0, -252.0}, {-210.0, -252.0}, {-210.0, -107.0}, {-165.0, -107.0}}, color = {0, 0, 191}));
        connect(Prod_2_1.u1, Population.y1) annotation(
          Line(visible = true, points = {{128.8, 80.0}, {100.0, 80.0}, {100.0, 194.0}, {-46.0, 194.0}, {-46.0, 151.0}, {-53.0, 151.0}}, color = {0, 0, 191}));
        connect(NRMM.u, DRMM.u) annotation(
          Line(visible = true, points = {{213.0, 80.0}, {300.0, 80.0}, {300.0, 171.0}, {63.0, 171.0}}, color = {0, 0, 191}));
        connect(NRMM.u, BRMM.u) annotation(
          Line(visible = true, points = {{213.0, 80.0}, {300.0, 80.0}, {300.0, 200.0}, {-70.0, 200.0}, {-70.0, 185.0}, {-93.0, 185.0}}, color = {0, 0, 191}));
        connect(CFIFR.u, QLF.u) annotation(
          Line(visible = true, points = {{57.0, -230.0}, {40.0, -230.0}, {40.0, -260.0}, {400.0, -260.0}, {400.0, -232.0}, {393.0, -232.0}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, QLF.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-220.0, -66.0}, {-220.0, -260.0}, {400.0, -260.0}, {400.0, -232.0}, {393.0, -232.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, FPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, -66.0}, {-21.0, -66.0}}, color = {0, 0, 191}));
        connect(CIR.y, POLCM.u) annotation(
          Line(visible = true, points = {{90.5, 6.0}, {80.0, 6.0}, {80.0, -6.0}, {10.0, -6.0}, {10.0, -116.0}, {-100.0, -116.0}, {-100.0, -220.0}, {-105.0, -220.0}}, color = {0, 0, 191}));
        connect(QLM.u, CIM.u) annotation(
          Line(visible = true, points = {{307.0, -169.0}, {300.0, -169.0}, {300.0, -100.0}, {125.0, -100.0}}, color = {0, 0, 191}));
        connect(QLM.y, QLMF.u1) annotation(
          Line(visible = true, points = {{335.5, -169.0}, {344.0, -169.0}, {344.0, -214.0}, {333.0, -214.0}}, color = {0, 0, 191}));
        connect(MSL.y, QLM.u) annotation(
          Line(visible = true, points = {{287.5, 30.0}, {300.0, 30.0}, {300.0, -169.0}, {307.0, -169.0}}, color = {0, 0, 191}));
        connect(NRMM.y, Prod_2_1.u2) annotation(
          Line(visible = true, points = {{184.5, 80.0}, {151.2, 80.0}}, color = {0, 0, 191}));
        connect(MSL.y, NRMM.u) annotation(
          Line(visible = true, points = {{287.5, 30.0}, {300.0, 30.0}, {300.0, 80.0}, {213.0, 80.0}}, color = {0, 0, 191}));
        connect(ECIR.y, MSL.u) annotation(
          Line(visible = true, points = {{253.5, 30.0}, {266.5, 30.0}}, color = {0, 0, 191}));
        connect(NotCIAF.u, CIAF.y1) annotation(
          Line(visible = true, points = {{175.5, 10.0}, {168.0, 10.0}, {168.0, -8.0}, {240.0, -8.0}, {240.0, -110.0}, {154.0, -110.0}, {154.0, -129.0}, {147.0, -129.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, CIR.u2) annotation(
          Line(visible = true, points = {{30.2, -100.0}, {20.0, -100.0}, {20.0, -14.0}, {140.0, -14.0}, {140.0, -3.6}, {125.0, -3.6}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, Population.y1) annotation(
          Line(visible = true, points = {{30.2, -100.0}, {20.0, -100.0}, {20.0, -14.0}, {320.0, -14.0}, {320.0, 194.0}, {-46.0, 194.0}, {-46.0, 151.0}, {-53.0, 151.0}}, color = {0, 0, 191}));
        connect(Prod_2_4.u1, Population.y) annotation(
          Line(visible = true, points = {{-171.2, -220.0}, {-200.0, -220.0}, {-200.0, 164.0}, {-94.0, 164.0}, {-94.0, 151.0}, {-87.0, 151.0}}, color = {0, 0, 191}));
        connect(CID_norm.u, Capital_Investment.y2) annotation(
          Line(visible = true, points = {{154.5, -77.0}, {145.0, -77.0}, {145.0, -53.0}}, color = {0, 0, 191}));
        connect(CID_norm.y, CI_Discard.u) annotation(
          Line(visible = true, points = {{175.5, -77.0}, {180.0, -77.0}, {180.0, -61.0}}, color = {0, 0, 191}));
        connect(CIM.y, Prod_2_2.u2) annotation(
          Line(visible = true, points = {{96.5, -100.0}, {49.8, -100.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.y, CIG_norm.u) annotation(
          Line(visible = true, points = {{40.0, -88.8}, {40.0, -77.0}, {54.5, -77.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.u, Pollution.y1) annotation(
          Line(visible = true, points = {{-39.5, -95.0}, {-46.0, -95.0}, {-46.0, -129.0}, {-53.0, -129.0}}, color = {0, 0, 191}));
        connect(POLCM.y, Prod_2_4.u2) annotation(
          Line(visible = true, points = {{-133.5, -220.0}, {-148.8, -220.0}}, color = {0, 0, 191}));
        connect(POLAT.y, P_Abs.u2) annotation(
          Line(visible = true, points = {{-55.5, -220.0}, {-70.0, -220.0}, {-70.0, -189.6}, {-61.0, -189.6}}, color = {0, 0, 191}));
        connect(P_Abs.y, P_Absorption.u) annotation(
          Line(visible = true, points = {{-26.5, -180.0}, {-20.0, -180.0}, {-20.0, -161.0}}, color = {0, 0, 191}));
        connect(CFIFR.y, Prod_2_3.u1) annotation(
          Line(visible = true, points = {{85.5, -230.0}, {108.8, -230.0}}, color = {0, 0, 191}));
        connect(CIQR.y, Prod_2_3.u2) annotation(
          Line(visible = true, points = {{150.5, -230.0}, {131.2, -230.0}}, color = {0, 0, 191}));
        connect(CIAF_G.y, CIAFG.u) annotation(
          Line(visible = true, points = {{84.5, -180.0}, {80.0, -180.0}, {80.0, -161.0}}, color = {0, 0, 191}));
        connect(CIAF_G.u, Prod_2_3.y) annotation(
          Line(visible = true, points = {{105.5, -180.0}, {120.0, -180.0}, {120.0, -218.8}}, color = {0, 0, 191}));
        connect(CIRA.u, Prod_2_5.y) annotation(
          Line(visible = true, points = {{244.5, -225.0}, {229.0, -225.0}, {229.0, -211.2}}, color = {0, 0, 191}));
        connect(Prod_2_5.u1, CIAF.y3) annotation(
          Line(visible = true, points = {{218.5, -200.0}, {130.0, -200.0}, {130.0, -153.0}}, color = {0, 0, 191}));
        connect(CIAF_D.u, CIAF.y2) annotation(
          Line(visible = true, points = {{152.5, -180.0}, {145.0, -180.0}, {145.0, -153.0}}, color = {0, 0, 191}));
        connect(CIAF_D.y, CIAFD.u) annotation(
          Line(visible = true, points = {{173.5, -180.0}, {180.0, -180.0}, {180.0, -161.0}}, color = {0, 0, 191}));
        connect(CIAFD.y1, Sink5.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, -140.0}, {199.0, -140.0}}, color = {191, 0, 191}));
        connect(CIAF.u2, CIAFD.y) annotation(
          Line(visible = true, points = {{152.0, -140.0}, {170.0, -140.0}}, color = {191, 0, 191}));
        connect(CIAFG.y1, CIAF.u1) annotation(
          Line(visible = true, points = {{90.0, -140.0}, {108.0, -140.0}}, color = {191, 0, 191}));
        connect(Source5.MassInPort1, CIAFG.y) annotation(
          Line(visible = true, points = {{61.0, -140.0}, {70.0, -140.0}}, color = {191, 0, 191}));
        connect(P_Absorption.y1, Sink4.MassInPort1) annotation(
          Line(visible = true, points = {{-10.0, -140.0}, {-1.0, -140.0}}, color = {191, 0, 191}));
        connect(Pollution.u2, P_Absorption.y) annotation(
          Line(visible = true, points = {{-48.0, -140.0}, {-30.0, -140.0}}, color = {191, 0, 191}));
        connect(P_Generation.y1, Pollution.u1) annotation(
          Line(visible = true, points = {{-110.0, -140.0}, {-92.0, -140.0}}, color = {191, 0, 191}));
        connect(Source4.MassInPort1, P_Generation.y) annotation(
          Line(visible = true, points = {{-139.0, -140.0}, {-130.0, -140.0}}, color = {191, 0, 191}));
        connect(FPCI.y, Prod_3_2.u3) annotation(
          Line(visible = true, points = {{-136.5, -107.0}, {-117.0, -107.0}, {-117.0, -76.5}}, color = {0, 0, 191}));
        connect(FPM.y, Prod_3_2.u2) annotation(
          Line(visible = true, points = {{-49.5, -66.0}, {-107.2, -66.0}}, color = {0, 0, 191}));
        connect(Prod_3_2.u1, FCM.y) annotation(
          Line(visible = true, points = {{-117.0, -55.5}, {-117.0, -47.0}, {-101.5, -47.0}}, color = {0, 0, 191}));
        connect(Prod_3_2.y, Food_Ratio.u) annotation(
          Line(visible = true, points = {{-126.8, -66.0}, {-138.5, -66.0}}, color = {0, 0, 191}));
        connect(CIR.u1, Capital_Investment.y1) annotation(
          Line(visible = true, points = {{125.0, 15.6}, {154.0, 15.6}, {154.0, -29.0}, {147.0, -29.0}}, color = {0, 0, 191}));
        connect(NRFR.y, NREM.u) annotation(
          Line(visible = true, points = {{147.5, 51.0}, {163.0, 51.0}}, color = {0, 0, 191}));
        connect(DRMM.y, Prod_5_2.u5) annotation(
          Line(visible = true, points = {{34.5, 171.0}, {26.0, 171.0}, {26.0, 104.0}, {40.0, 104.0}, {40.0, 79.0}, {31.2, 79.0}}, color = {0, 0, 191}));
        connect(Prod_5_2.u1, Population.y2) annotation(
          Line(visible = true, points = {{8.8, 79.0}, {-55.0, 79.0}, {-55.0, 127.0}}, color = {0, 0, 191}));
        connect(BRMM.y, Prod_5_1.u1) annotation(
          Line(visible = true, points = {{-121.5, 185.0}, {-180.0, 185.0}, {-180.0, 80.0}, {-171.2, 80.0}}, color = {0, 0, 191}));
        connect(Prod_5_1.u5, Population.y4) annotation(
          Line(visible = true, points = {{-148.8, 80.0}, {-85.0, 80.0}, {-85.0, 127.0}}, color = {0, 0, 191}));
        connect(Prod_5_1.y, BR_norm.u) annotation(
          Line(visible = true, points = {{-160.0, 91.2}, {-160.0, 103.0}, {-145.5, 103.0}}, color = {0, 0, 191}));
        connect(BR_norm.y, Birth_Rate.u) annotation(
          Line(visible = true, points = {{-124.5, 103.0}, {-120.0, 103.0}, {-120.0, 119.0}}, color = {0, 0, 191}));
        connect(Source1.MassInPort1, Birth_Rate.y) annotation(
          Line(visible = true, points = {{-139.0, 140.0}, {-130.0, 140.0}}, color = {191, 0, 191}));
        connect(Birth_Rate.y1, Population.u1) annotation(
          Line(visible = true, points = {{-110.0, 140.0}, {-92.0, 140.0}}, color = {191, 0, 191}));
        connect(Population.u2, Death_Rate.y) annotation(
          Line(visible = true, points = {{-48.0, 140.0}, {-30.0, 140.0}}, color = {191, 0, 191}));
        connect(Death_Rate.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, points = {{-10.0, 140.0}, {-1.0, 140.0}}, color = {191, 0, 191}));
        connect(Source2.MassInPort1, Generation.y) annotation(
          Line(visible = true, points = {{61.0, 140.0}, {70.0, 140.0}}, color = {191, 0, 191}));
        connect(Gen_Const.y, Generation.u) annotation(
          Line(visible = true, points = {{80.0, 111.5}, {80.0, 119.0}}, color = {0, 0, 191}));
        connect(NRFR.u, Natural_Resources.y4) annotation(
          Line(visible = true, points = {{126.5, 51.0}, {115.0, 51.0}, {115.0, 127.0}}, color = {0, 0, 191}));
        connect(Generation.y1, Natural_Resources.u1) annotation(
          Line(visible = true, points = {{90.0, 140.0}, {108.0, 140.0}}, color = {191, 0, 191}));
        connect(Natural_Resources.u2, Depletion.y) annotation(
          Line(visible = true, points = {{152.0, 140.0}, {170.0, 140.0}}, color = {191, 0, 191}));
        connect(Depletion.y1, Sink2.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, 140.0}, {199.0, 140.0}}, color = {191, 0, 191}));
        Pop = Population.y;
        Pol = Pollution.y;
        Pol_rat = Pol_Ratio.y;
        Cap_inv = Capital_Investment.y;
        Qual_life = Quality_of_Life.y;
        Nat_res = Natural_Resources.y;
        NRUN = if time > 1970 then 0.25 else 1.0;
        NR_norm.u2 = NRUN;
        POLN = if time > 1970 then 0.25 else 1.0;
        Pol_norm.u2 = POLN;
        DRN = if time > 1970 then 0.02 else 0.028;
        DR_norm.u2 = DRN;
        Pop_meas = Functions.Utilities.Piecewise(x = time, x_grid = time_vals, y_grid = pop_vals);
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-220.0, -264.0}, {442.0, 220.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-152.0, 70.0}, {368.0, 140.0}}, textString = "3rd Modification", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {127, 0, 255}, extent = {{-148.0, -26.0}, {372.0, 44.0}}, textString = "DRN", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-150.0, -106.0}, {370.0, -36.0}}, textString = "reduced to 0.2", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-150.0, -192.0}, {370.0, -122.0}}, textString = "in 1970", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-62.0, 6.0}, {-58.0, 10.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{98.0, 192.0}, {102.0, 196.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{138.0, -16.0}, {142.0, -12.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -22.0}, {2.0, -18.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-178.0, -2.0}, {-174.0, 2.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{78.0, 4.0}, {82.0, 8.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -97.0}, {2.0, -93.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-178.0, -68.0}, {-174.0, -64.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -68.0}, {2.0, -64.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{158.0, 28.0}, {162.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{38.0, -262.0}, {42.0, -258.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, -102.0}, {302.0, -98.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 28.0}, {302.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 78.0}, {302.0, 82.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 169.0}, {302.0, 173.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{342.0, -171.0}, {346.0, -167.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{354.0, -234.0}, {358.0, -230.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-97.0, 6.0}, {-93.0, 10.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-137.0, -22.0}, {-133.0, -18.0}})}),
          experiment(StartTime = 1900, StopTime = 2000),
          experimentSetupOutput,
          Documentation(info = "<html>
This is a further modification of <a href=\"http://en.wikipedia.org/wiki/Jay_Wright_Forrester\">Jay Forrester's</a> <font color=red><b>WORLD2</b></font> model. The death rate is reduced in 1970 to better account for the recent advances in medicine. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Forrester, J.W. (1971), <a href=\"http://www.amazon.com/World-Dynamics-Jay-W-Forrester/dp/1883823382/ref=ed_oe_h/103-2487145-1208659\">World Dynamics</a>, Pegasus Communications, 160p.
</ol> <p>
 
<hr> <p>
 
Simulate the model across 100 years, and plot the simulated and the measured world populations together on a single graph against the calendar years: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/SD_Fig4.png\"> <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_4;

      model Scenario_5 "5th Scenario"
        parameter Real Population_0 = 1650000000.0 "World population in 1900";
        parameter Real Pollution_0 = 200000000.0 "Pollution in 1900";
        parameter Real Nat_Resources_0(unit = "ton") = 900000000000.0 "Unrecoverable natural resources in 1900";
        parameter Real Cap_Invest_0(unit = "dollar") = 400000000.0 "Capital investment in 1900";
        parameter Real CIAF_0 = 0.2 "Proportion of capital investment in agriculture in 1900";
        parameter Real BRN(unit = "1/yr") = 0.04 "Normal birth rate";
        parameter Real CIAFN(unit = "dollar") = 0.3 "CIAF normalization";
        parameter Real CIAFT(unit = "yr") = 15.0 "CIAF time constant";
        parameter Real CIDN(unit = "dollar/yr") = 0.025 "Normal capital discard";
        parameter Real CIGN(unit = "dollar/yr") = 0.05 "Normal capital generation";
        parameter Real ECIRN(unit = "dollar") = 1.0 "Capital normalization";
        parameter Real FC(unit = "kg/yr") = 1.0 "Food coefficient";
        parameter Real FN(unit = "kg/yr") = 1.0 "Food normalization";
        parameter Real Land_Area(unit = "hectare") = 135000000.0 "Area of arable land";
        parameter Real NRI(unit = "ton") = 900000000000.0 "Initial natural resources";
        parameter Real POLS = 3599900000.0 "Standard pollution";
        parameter Real Pop_dens_norm(unit = "1/hectare") = 26.5 "Normal population density";
        parameter Real QLS = 1.0 "Standard quality of life";
        Real years(start = 1900) "Time in calendar years";
        output Real Pop "World population";
        output Real Pol "Pollution";
        output Real Pol_rat "Pollution ratio";
        output Real Cap_inv(unit = "dollar") "Capital investment";
        output Real Qual_life "Quality of life";
        output Real Nat_res(unit = "ton") "Natural unrecoverable resources";
        Real NRUN(unit = "1/yr") "Normal resource utilization";
        Real POLN(unit = "1/yr") "Normal pollution";
        Real DRN(unit = "1/yr") "Normal death rate";
        Real Pop_meas;
      protected
        Real time_vals[12] = {1900, 1910, 1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000, 2500};
        Real pop_vals[12] = {1600000000.0, 1750000000.0, 1860000000.0, 2070000000.0, 2300000000.0, 2556000000.0, 3039500000.0, 3706560000.0, 4378100000.0, 5190300000.0, 5996200000.0, 6000000000.0};
        Real dir;
        parameter Real time_reverse(unit = "yr") = 200 "Time of time reversal";
      public
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-150.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Birth_Rate annotation(
          Placement(visible = true, transformation(origin = {-120.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Reverse_Level Population(x0 = Population_0) annotation(
          Placement(visible = true, transformation(origin = {-70.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Death_Rate annotation(
          Placement(visible = true, transformation(origin = {-20.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {10.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source2 annotation(
          Placement(visible = true, transformation(origin = {50.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Generation annotation(
          Placement(visible = true, transformation(origin = {80.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Reverse_Level Natural_Resources(x0 = Nat_Resources_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Depletion annotation(
          Placement(visible = true, transformation(origin = {180.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink2 annotation(
          Placement(visible = true, transformation(origin = {210.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Gen_Const(k = 0) annotation(
          Placement(visible = true, transformation(origin = {80.0, 101.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular BRMM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {1.2, 1.0, 0.85, 0.75, 0.7, 0.7, 0.7}) annotation(
          Placement(visible = true, transformation(origin = {-105.0, 185.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular DRMM(x_vals = {0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 20}, y_vals = {3.0, 1.8, 1.0, 0.8, 0.7, 0.6, 0.53, 0.5, 0.5, 0.5, 0.5, 0.5}) annotation(
          Placement(visible = true, transformation(origin = {51.0, 171.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain BR_norm(k = BRN) annotation(
          Placement(visible = true, transformation(origin = {-135.0, 103.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_5 Prod_5_1 annotation(
          Placement(visible = true, transformation(origin = {-160.0, 80.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_5 Prod_5_2 annotation(
          Placement(visible = true, transformation(origin = {20.0, 79.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular BRFM(x_vals = {0, 1, 2, 3, 4, 20}, y_vals = {0.0, 1.0, 1.6, 1.9, 2.0, 2.0}) annotation(
          Placement(visible = true, transformation(origin = {-176.0, 35.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular BRPM(x_vals = 0:10:60, y_vals = {1.02, 0.9, 0.7, 0.4, 0.25, 0.15, 0.1}) annotation(
          Placement(visible = true, transformation(origin = {-135.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular BRCM(x_vals = 0:5, y_vals = {1.05, 1.0, 0.9, 0.7, 0.6, 0.55}) annotation(
          Placement(visible = true, transformation(origin = {-95.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRCM(x_vals = 0:5, y_vals = {0.9, 1.0, 1.2, 1.5, 1.9, 3.0}) annotation(
          Placement(visible = true, transformation(origin = {-25.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRPM(x_vals = 0:10:60, y_vals = {0.92, 1.3, 2.0, 3.2, 4.8, 6.8, 9.2}) annotation(
          Placement(visible = true, transformation(origin = {15.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRFM(x_vals = {0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 20}, y_vals = {30.0, 3.0, 2.0, 1.4, 1.0, 0.7, 0.6, 0.5, 0.5, 0.5}) annotation(
          Placement(visible = true, transformation(origin = {55.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Auxiliary.Gain Crowd_Rat(k = 1.0 / (Land_Area * Pop_dens_norm)) annotation(
          Placement(visible = true, transformation(origin = {-60.0, 35.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_1 annotation(
          Placement(visible = true, transformation(origin = {140.0, 80.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular NRMM(x_vals = 0:10, y_vals = {0.0, 1.0, 1.8, 2.4, 2.9, 3.3, 3.6, 3.8, 3.9, 3.95, 4.0}) annotation(
          Placement(visible = true, transformation(origin = {201.0, 80.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Sources.Source Source3 annotation(
          Placement(visible = true, transformation(origin = {50.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CI_Generation annotation(
          Placement(visible = true, transformation(origin = {80.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Reverse_Level Capital_Investment(x0 = Cap_Invest_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CI_Discard annotation(
          Placement(visible = true, transformation(origin = {180.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink3 annotation(
          Placement(visible = true, transformation(origin = {210.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIG_norm(k = CIGN) annotation(
          Placement(visible = true, transformation(origin = {65.0, -77.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_2 annotation(
          Placement(visible = true, transformation(origin = {40.0, -100.0}, extent = {{-14.0, -16.0}, {14.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CID_norm(k = CIDN) annotation(
          Placement(visible = true, transformation(origin = {165.0, -77.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular CIM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {0.1, 1.0, 1.8, 2.4, 2.8, 3.0, 3.0}) annotation(
          Placement(visible = true, transformation(origin = {113.0, -100.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain MSL(k = 1.0 / ECIRN) annotation(
          Placement(visible = true, transformation(origin = {277.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain NRFR(k = 1.0 / NRI) annotation(
          Placement(visible = true, transformation(origin = {137.0, 51.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain ECIR(k = 1.0 / (1.0 - CIAFN)) annotation(
          Placement(visible = true, transformation(origin = {243.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_1 annotation(
          Placement(visible = true, transformation(origin = {215.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular NREM(x_vals = 0:0.25:1, y_vals = {0.0, 0.15, 0.5, 0.85, 1.0}) annotation(
          Placement(visible = true, transformation(origin = {175.0, 51.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -180)));
        Modelica.Blocks.Math.Division CIR annotation(
          Placement(visible = true, transformation(origin = {107.0, 6.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source4 annotation(
          Placement(visible = true, transformation(origin = {-150.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 P_Generation annotation(
          Placement(visible = true, transformation(origin = {-120.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Reverse_Level Pollution(x0 = Pollution_0) annotation(
          Placement(visible = true, transformation(origin = {-70.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 P_Absorption annotation(
          Placement(visible = true, transformation(origin = {-20.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink4 annotation(
          Placement(visible = true, transformation(origin = {10.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Linear NotCIAF(m = -1.0, b = 1.0) annotation(
          Placement(visible = true, transformation(origin = {189.0, 10.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain Pol_Ratio(k = 1.0 / POLS) annotation(
          Placement(visible = true, transformation(origin = {-29.0, -95.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular FCM(x_vals = 0:5, y_vals = {2.4, 1.0, 0.6, 0.4, 0.3, 0.2}) annotation(
          Placement(visible = true, transformation(origin = {-85.0, -47.0}, extent = {{-15.0, 15.0}, {15.0, -15.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_2 annotation(
          Placement(visible = true, transformation(origin = {-117.0, -66.0}, extent = {{15.0, -14.0}, {-15.0, 14.0}}, rotation = 90)));
        SystemDynamics.Auxiliary.Gain Food_Ratio(k = FC / FN) annotation(
          Placement(visible = true, transformation(origin = {-149.0, -66.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source5 annotation(
          Placement(visible = true, transformation(origin = {50.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CIAFG annotation(
          Placement(visible = true, transformation(origin = {80.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Reverse_Level CIAF(x0 = CIAF_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CIAFD annotation(
          Placement(visible = true, transformation(origin = {180.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink5 annotation(
          Placement(visible = true, transformation(origin = {210.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIAF_D(k = 1.0 / CIAFT) annotation(
          Placement(visible = true, transformation(origin = {163.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIAF_G(k = 1.0 / CIAFT) annotation(
          Placement(visible = true, transformation(origin = {95.0, -180.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_3 annotation(
          Placement(visible = true, transformation(origin = {120.0, -230.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division P_Abs annotation(
          Placement(visible = true, transformation(origin = {-43.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_4 annotation(
          Placement(visible = true, transformation(origin = {-160.0, -220.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular POLCM(x_vals = {0, 1, 2, 3, 4, 5, 100}, y_vals = {0.05, 1.0, 3.0, 5.4, 7.4, 8.0, 8.0}) annotation(
          Placement(visible = true, transformation(origin = {-117.0, -220.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular POLAT(x_vals = 0:10:60, y_vals = {0.6, 2.5, 5.0, 8.0, 11.5, 15.5, 20.0}) annotation(
          Placement(visible = true, transformation(origin = {-39.0, -220.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular CFIFR(x_vals = {0, 0.5, 1, 1.5, 2, 20}, y_vals = {1.0, 0.6, 0.3, 0.15, 0.1, 0.1}) annotation(
          Placement(visible = true, transformation(origin = {69.0, -230.0}, extent = {{15.0, 16.0}, {-15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular FPM(x_vals = 0:10:60, y_vals = {1.02, 0.9, 0.65, 0.35, 0.2, 0.1, 0.05}) annotation(
          Placement(visible = true, transformation(origin = {-33.0, -66.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_5 annotation(
          Placement(visible = true, transformation(origin = {229.0, -200.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIRA(k = 1.0 / CIAFN) annotation(
          Placement(visible = true, transformation(origin = {255.0, -225.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular FPCI(x_vals = {0, 1, 2, 3, 4, 5, 6, 100}, y_vals = {0.5, 1.0, 1.4, 1.7, 1.9, 2.05, 2.2, 2.2}) annotation(
          Placement(visible = true, transformation(origin = {-153.0, -107.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular CIQR(y_vals = {0.7, 0.8, 1.0, 1.5, 2.0, 2.0}, x_vals = {0, 0.5, 1, 1.5, 2, 10}) annotation(
          Placement(visible = true, transformation(origin = {167.0, -230.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        Modelica.Blocks.Math.Division QLMF annotation(
          Placement(visible = true, transformation(origin = {315.0, -223.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular QLM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {0.2, 1.0, 1.7, 2.3, 2.7, 2.9, 2.9}) annotation(
          Placement(visible = true, transformation(origin = {319.0, -169.0}, extent = {{15.0, 17.0}, {-15.0, -17.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular QLF(x_vals = {0, 1, 2, 3, 4, 20}, y_vals = {0.0, 1.0, 1.8, 2.4, 2.7, 2.7}) annotation(
          Placement(visible = true, transformation(origin = {381.0, -232.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_4 Prod_4_1 annotation(
          Placement(visible = true, transformation(origin = {375.0, -163.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular QLC(x_vals = 0:0.5:5, y_vals = {2.0, 1.3, 1.0, 0.75, 0.55, 0.45, 0.38, 0.3, 0.25, 0.22, 0.2}) annotation(
          Placement(visible = true, transformation(origin = {335.0, -113.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular QLP(x_vals = 0:10:60, y_vals = {1.04, 0.85, 0.6, 0.3, 0.15, 0.05, 0.02}) annotation(
          Placement(visible = true, transformation(origin = {375.0, -113.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Gain Quality_of_Life(k = QLS) annotation(
          Placement(visible = true, transformation(origin = {412.0, -163.0}, extent = {{-20.0, -21.0}, {20.0, 21.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World2.Utilities.Parameter_Change NR_norm annotation(
          Placement(visible = true, transformation(origin = {160.0, 105.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World2.Utilities.Parameter_Change Pol_norm annotation(
          Placement(visible = true, transformation(origin = {-140.0, -180.0}, extent = {{-14.1444, -14.1444}, {14.1444, 14.1444}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World2.Utilities.Parameter_Change DR_norm annotation(
          Placement(visible = true, transformation(origin = {-2.5, 102.5}, extent = {{-12.5, 12.5}, {12.5, -12.5}}, rotation = 180)));
      equation
        connect(Depletion.u, NR_norm.y) annotation(
          Line(visible = true, origin = {177.8333, 109.6667}, points = {{2.1667, 9.3333}, {2.1667, -4.6667}, {-4.3333, -4.6667}}, color = {0, 0, 191}));
        connect(NR_norm.u1, Prod_2_1.y) annotation(
          Line(visible = true, points = {{146.5, 111.0}, {140.0, 111.0}, {140.0, 91.2}}, color = {0, 0, 191}));
        connect(P_Generation.u, Pol_norm.y) annotation(
          Line(visible = true, points = {{-120.0, -161.0}, {-120.0, -180.0}, {-127.27, -180.0}}, color = {0, 0, 191}));
        connect(Pol_norm.u1, Prod_2_4.y) annotation(
          Line(visible = true, points = {{-152.73, -174.3422}, {-160.0, -174.3422}, {-160.0, -208.8}}, color = {0, 0, 191}));
        connect(DR_norm.u1, Prod_5_2.y) annotation(
          Line(visible = true, points = {{8.75, 107.5}, {20.0, 107.5}, {20.0, 89.5}}, color = {0, 0, 191}));
        connect(DR_norm.y, Death_Rate.u) annotation(
          Line(visible = true, origin = {-17.9167, 108.0}, points = {{4.1667, -5.5}, {-2.0833, -5.5}, {-2.0833, 11.0}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, BRFM.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-176.0, -66.0}, {-176.0, 22.2}}, color = {0, 0, 191}));
        connect(BRFM.y, Prod_5_1.u2) annotation(
          Line(visible = true, points = {{-176.0, 52.6}, {-176.0, 60.0}, {-167.36, 60.0}, {-167.36, 72.0}}, color = {0, 0, 191}));
        connect(BRPM.u, QLP.u) annotation(
          Line(visible = true, points = {{-135.0, 23.0}, {-135.0, -20.0}, {-214.0, -20.0}, {-214.0, 214.0}, {375.0, 214.0}, {375.0, -125.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, BRPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, -20.0}, {-135.0, -20.0}, {-135.0, 23.0}}, color = {0, 0, 191}));
        connect(BRPM.y, Prod_5_1.u3) annotation(
          Line(visible = true, points = {{-135.0, 51.5}, {-135.0, 60.0}, {-160.0, 60.0}, {-160.0, 68.8}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, BRCM.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-95.0, 8.0}, {-95.0, 23.0}}, color = {0, 0, 191}));
        connect(BRCM.y, Prod_5_1.u4) annotation(
          Line(visible = true, points = {{-95.0, 51.5}, {-95.0, 66.0}, {-152.64, 66.0}, {-152.64, 72.0}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, DRCM.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-25.0, 8.0}, {-25.0, 23.0}}, color = {0, 0, 191}));
        connect(DRCM.y, Prod_5_2.u2) annotation(
          Line(visible = true, points = {{-25.0, 51.5}, {-25.0, 60.0}, {12.64, 60.0}, {12.64, 71.5}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, DRPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, 8.0}, {15.0, 8.0}, {15.0, 23.0}}, color = {0, 0, 191}));
        connect(DRPM.y, Prod_5_2.u3) annotation(
          Line(visible = true, points = {{15.0, 51.5}, {15.0, 60.0}, {20.0, 60.0}, {20.0, 68.5}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, DRFM.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-176.0, -66.0}, {-176.0, 0.0}, {55.0, 0.0}, {55.0, 23.0}}, color = {0, 0, 191}));
        connect(DRFM.y, Prod_5_2.u4) annotation(
          Line(visible = true, points = {{55.0, 51.5}, {55.0, 60.0}, {27.36, 60.0}, {27.36, 71.5}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, QLC.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-206.0, 8.0}, {-206.0, 208.0}, {335.0, 208.0}, {335.0, -125.0}}, color = {0, 0, 191}));
        connect(FCM.u, Crowd_Rat.y) annotation(
          Line(visible = true, points = {{-73.0, -47.0}, {-60.0, -47.0}, {-60.0, 23.8}}, color = {0, 0, 191}));
        connect(Crowd_Rat.u, Population.y3) annotation(
          Line(visible = true, points = {{-60.0, 46.2}, {-60.0, 66.0}, {-70.0, 66.0}, {-70.0, 127.0}}, color = {0, 0, 191}));
        connect(Prod_2_5.u2, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{239.5, -200.0}, {260.0, -200.0}, {260.0, -20.0}, {160.0, -20.0}, {160.0, 30.0}, {203.8, 30.0}}, color = {0, 0, 191}));
        connect(Prod_3_1.y, ECIR.u) annotation(
          Line(visible = true, points = {{226.2, 30.0}, {232.5, 30.0}}, color = {0, 0, 191}));
        connect(CIR.y, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{90.5, 6.0}, {80.0, 6.0}, {80.0, 30.0}, {203.8, 30.0}}, color = {0, 0, 191}));
        connect(NotCIAF.y, Prod_3_1.u3) annotation(
          Line(visible = true, points = {{202.5, 10.0}, {215.0, 10.0}, {215.0, 19.5}}, color = {0, 0, 191}));
        connect(Prod_3_1.u1, NREM.y) annotation(
          Line(visible = true, points = {{215.0, 40.5}, {215.0, 51.0}, {191.5, 51.0}}, color = {0, 0, 191}));
        connect(QLP.y, Prod_4_1.u1) annotation(
          Line(visible = true, points = {{375.0, -96.5}, {375.0, -152.5}}, color = {0, 0, 191}));
        connect(QLC.y, Prod_4_1.u2) annotation(
          Line(visible = true, points = {{335.0, -96.5}, {335.0, -157.0}, {366.6, -157.0}}, color = {0, 0, 191}));
        connect(Prod_4_1.y, Quality_of_Life.u) annotation(
          Line(visible = true, points = {{385.5, -163.0}, {398.0, -163.0}}, color = {0, 0, 191}));
        connect(QLF.y, Prod_4_1.u4) annotation(
          Line(visible = true, points = {{364.5, -232.0}, {356.0, -232.0}, {356.0, -190.0}, {375.0, -190.0}, {375.0, -173.5}}, color = {0, 0, 191}));
        connect(QLM.y, Prod_4_1.u3) annotation(
          Line(visible = true, points = {{335.5, -169.0}, {366.6, -169.0}}, color = {0, 0, 191}));
        connect(QLF.y, QLMF.u2) annotation(
          Line(visible = true, points = {{364.5, -232.0}, {333.0, -232.0}}, color = {0, 0, 191}));
        connect(QLMF.y, CIQR.u) annotation(
          Line(visible = true, points = {{298.5, -223.0}, {290.0, -223.0}, {290.0, -256.0}, {190.0, -256.0}, {190.0, -230.0}, {179.0, -230.0}}, color = {0, 0, 191}));
        connect(P_Abs.u1, Pollution.y3) annotation(
          Line(visible = true, points = {{-61.0, -170.4}, {-70.0, -170.4}, {-70.0, -153.0}}, color = {0, 0, 191}));
        connect(CIG_norm.y, CI_Generation.u) annotation(
          Line(visible = true, points = {{75.5, -77.0}, {80.0, -77.0}, {80.0, -61.0}}, color = {0, 0, 191}));
        connect(CI_Discard.y1, Sink3.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, -40.0}, {199.0, -40.0}}, color = {191, 0, 191}));
        connect(Capital_Investment.u2, CI_Discard.y) annotation(
          Line(visible = true, points = {{152.0, -40.0}, {170.0, -40.0}}, color = {191, 0, 191}));
        connect(Source3.MassInPort1, CI_Generation.y) annotation(
          Line(visible = true, points = {{61.0, -40.0}, {70.0, -40.0}}, color = {191, 0, 191}));
        connect(CI_Generation.y1, Capital_Investment.u1) annotation(
          Line(visible = true, points = {{90.0, -40.0}, {108.0, -40.0}}, color = {191, 0, 191}));
        connect(FPM.u, POLAT.u) annotation(
          Line(visible = true, points = {{-21.0, -66.0}, {0.0, -66.0}, {0.0, -220.0}, {-27.0, -220.0}}, color = {0, 0, 191}));
        connect(CIRA.y, FPCI.u) annotation(
          Line(visible = true, points = {{265.5, -225.0}, {280.0, -225.0}, {280.0, -252.0}, {-210.0, -252.0}, {-210.0, -107.0}, {-165.0, -107.0}}, color = {0, 0, 191}));
        connect(Prod_2_1.u1, Population.y1) annotation(
          Line(visible = true, points = {{128.8, 80.0}, {100.0, 80.0}, {100.0, 194.0}, {-46.0, 194.0}, {-46.0, 151.0}, {-53.0, 151.0}}, color = {0, 0, 191}));
        connect(NRMM.u, DRMM.u) annotation(
          Line(visible = true, points = {{213.0, 80.0}, {300.0, 80.0}, {300.0, 171.0}, {63.0, 171.0}}, color = {0, 0, 191}));
        connect(NRMM.u, BRMM.u) annotation(
          Line(visible = true, points = {{213.0, 80.0}, {300.0, 80.0}, {300.0, 200.0}, {-70.0, 200.0}, {-70.0, 185.0}, {-93.0, 185.0}}, color = {0, 0, 191}));
        connect(CFIFR.u, QLF.u) annotation(
          Line(visible = true, points = {{57.0, -230.0}, {40.0, -230.0}, {40.0, -260.0}, {400.0, -260.0}, {400.0, -232.0}, {393.0, -232.0}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, QLF.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-220.0, -66.0}, {-220.0, -260.0}, {400.0, -260.0}, {400.0, -232.0}, {393.0, -232.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, FPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, -66.0}, {-21.0, -66.0}}, color = {0, 0, 191}));
        connect(CIR.y, POLCM.u) annotation(
          Line(visible = true, points = {{90.5, 6.0}, {80.0, 6.0}, {80.0, -6.0}, {10.0, -6.0}, {10.0, -116.0}, {-100.0, -116.0}, {-100.0, -220.0}, {-105.0, -220.0}}, color = {0, 0, 191}));
        connect(QLM.u, CIM.u) annotation(
          Line(visible = true, points = {{307.0, -169.0}, {300.0, -169.0}, {300.0, -100.0}, {125.0, -100.0}}, color = {0, 0, 191}));
        connect(QLM.y, QLMF.u1) annotation(
          Line(visible = true, points = {{335.5, -169.0}, {344.0, -169.0}, {344.0, -214.0}, {333.0, -214.0}}, color = {0, 0, 191}));
        connect(MSL.y, QLM.u) annotation(
          Line(visible = true, points = {{287.5, 30.0}, {300.0, 30.0}, {300.0, -169.0}, {307.0, -169.0}}, color = {0, 0, 191}));
        connect(NRMM.y, Prod_2_1.u2) annotation(
          Line(visible = true, points = {{184.5, 80.0}, {151.2, 80.0}}, color = {0, 0, 191}));
        connect(MSL.y, NRMM.u) annotation(
          Line(visible = true, points = {{287.5, 30.0}, {300.0, 30.0}, {300.0, 80.0}, {213.0, 80.0}}, color = {0, 0, 191}));
        connect(ECIR.y, MSL.u) annotation(
          Line(visible = true, points = {{253.5, 30.0}, {266.5, 30.0}}, color = {0, 0, 191}));
        connect(NotCIAF.u, CIAF.y1) annotation(
          Line(visible = true, points = {{175.5, 10.0}, {168.0, 10.0}, {168.0, -8.0}, {240.0, -8.0}, {240.0, -110.0}, {154.0, -110.0}, {154.0, -129.0}, {147.0, -129.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, CIR.u2) annotation(
          Line(visible = true, points = {{30.2, -100.0}, {20.0, -100.0}, {20.0, -14.0}, {140.0, -14.0}, {140.0, -3.6}, {125.0, -3.6}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, Population.y1) annotation(
          Line(visible = true, points = {{30.2, -100.0}, {20.0, -100.0}, {20.0, -14.0}, {320.0, -14.0}, {320.0, 194.0}, {-46.0, 194.0}, {-46.0, 151.0}, {-53.0, 151.0}}, color = {0, 0, 191}));
        connect(Prod_2_4.u1, Population.y) annotation(
          Line(visible = true, points = {{-171.2, -220.0}, {-200.0, -220.0}, {-200.0, 164.0}, {-94.0, 164.0}, {-94.0, 151.0}, {-87.0, 151.0}}, color = {0, 0, 191}));
        connect(CID_norm.u, Capital_Investment.y2) annotation(
          Line(visible = true, points = {{154.5, -77.0}, {145.0, -77.0}, {145.0, -53.0}}, color = {0, 0, 191}));
        connect(CID_norm.y, CI_Discard.u) annotation(
          Line(visible = true, points = {{175.5, -77.0}, {180.0, -77.0}, {180.0, -61.0}}, color = {0, 0, 191}));
        connect(CIM.y, Prod_2_2.u2) annotation(
          Line(visible = true, points = {{96.5, -100.0}, {49.8, -100.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.y, CIG_norm.u) annotation(
          Line(visible = true, points = {{40.0, -88.8}, {40.0, -77.0}, {54.5, -77.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.u, Pollution.y1) annotation(
          Line(visible = true, points = {{-39.5, -95.0}, {-46.0, -95.0}, {-46.0, -129.0}, {-53.0, -129.0}}, color = {0, 0, 191}));
        connect(POLCM.y, Prod_2_4.u2) annotation(
          Line(visible = true, points = {{-133.5, -220.0}, {-148.8, -220.0}}, color = {0, 0, 191}));
        connect(POLAT.y, P_Abs.u2) annotation(
          Line(visible = true, points = {{-55.5, -220.0}, {-70.0, -220.0}, {-70.0, -189.6}, {-61.0, -189.6}}, color = {0, 0, 191}));
        connect(P_Abs.y, P_Absorption.u) annotation(
          Line(visible = true, points = {{-26.5, -180.0}, {-20.0, -180.0}, {-20.0, -161.0}}, color = {0, 0, 191}));
        connect(CFIFR.y, Prod_2_3.u1) annotation(
          Line(visible = true, points = {{85.5, -230.0}, {108.8, -230.0}}, color = {0, 0, 191}));
        connect(CIQR.y, Prod_2_3.u2) annotation(
          Line(visible = true, points = {{150.5, -230.0}, {131.2, -230.0}}, color = {0, 0, 191}));
        connect(CIAF_G.y, CIAFG.u) annotation(
          Line(visible = true, points = {{84.5, -180.0}, {80.0, -180.0}, {80.0, -161.0}}, color = {0, 0, 191}));
        connect(CIAF_G.u, Prod_2_3.y) annotation(
          Line(visible = true, points = {{105.5, -180.0}, {120.0, -180.0}, {120.0, -218.8}}, color = {0, 0, 191}));
        connect(CIRA.u, Prod_2_5.y) annotation(
          Line(visible = true, points = {{244.5, -225.0}, {229.0, -225.0}, {229.0, -211.2}}, color = {0, 0, 191}));
        connect(Prod_2_5.u1, CIAF.y3) annotation(
          Line(visible = true, points = {{218.5, -200.0}, {130.0, -200.0}, {130.0, -153.0}}, color = {0, 0, 191}));
        connect(CIAF_D.u, CIAF.y2) annotation(
          Line(visible = true, points = {{152.5, -180.0}, {145.0, -180.0}, {145.0, -153.0}}, color = {0, 0, 191}));
        connect(CIAF_D.y, CIAFD.u) annotation(
          Line(visible = true, points = {{173.5, -180.0}, {180.0, -180.0}, {180.0, -161.0}}, color = {0, 0, 191}));
        connect(CIAFD.y1, Sink5.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, -140.0}, {199.0, -140.0}}, color = {191, 0, 191}));
        connect(CIAF.u2, CIAFD.y) annotation(
          Line(visible = true, points = {{152.0, -140.0}, {170.0, -140.0}}, color = {191, 0, 191}));
        connect(CIAFG.y1, CIAF.u1) annotation(
          Line(visible = true, points = {{90.0, -140.0}, {108.0, -140.0}}, color = {191, 0, 191}));
        connect(Source5.MassInPort1, CIAFG.y) annotation(
          Line(visible = true, points = {{61.0, -140.0}, {70.0, -140.0}}, color = {191, 0, 191}));
        connect(P_Absorption.y1, Sink4.MassInPort1) annotation(
          Line(visible = true, points = {{-10.0, -140.0}, {-1.0, -140.0}}, color = {191, 0, 191}));
        connect(Pollution.u2, P_Absorption.y) annotation(
          Line(visible = true, points = {{-48.0, -140.0}, {-30.0, -140.0}}, color = {191, 0, 191}));
        connect(P_Generation.y1, Pollution.u1) annotation(
          Line(visible = true, points = {{-110.0, -140.0}, {-92.0, -140.0}}, color = {191, 0, 191}));
        connect(Source4.MassInPort1, P_Generation.y) annotation(
          Line(visible = true, points = {{-139.0, -140.0}, {-130.0, -140.0}}, color = {191, 0, 191}));
        connect(FPCI.y, Prod_3_2.u3) annotation(
          Line(visible = true, points = {{-136.5, -107.0}, {-117.0, -107.0}, {-117.0, -76.5}}, color = {0, 0, 191}));
        connect(FPM.y, Prod_3_2.u2) annotation(
          Line(visible = true, points = {{-49.5, -66.0}, {-107.2, -66.0}}, color = {0, 0, 191}));
        connect(Prod_3_2.u1, FCM.y) annotation(
          Line(visible = true, points = {{-117.0, -55.5}, {-117.0, -47.0}, {-101.5, -47.0}}, color = {0, 0, 191}));
        connect(Prod_3_2.y, Food_Ratio.u) annotation(
          Line(visible = true, points = {{-126.8, -66.0}, {-138.5, -66.0}}, color = {0, 0, 191}));
        connect(CIR.u1, Capital_Investment.y1) annotation(
          Line(visible = true, points = {{125.0, 15.6}, {154.0, 15.6}, {154.0, -29.0}, {147.0, -29.0}}, color = {0, 0, 191}));
        connect(NRFR.y, NREM.u) annotation(
          Line(visible = true, points = {{147.5, 51.0}, {163.0, 51.0}}, color = {0, 0, 191}));
        connect(DRMM.y, Prod_5_2.u5) annotation(
          Line(visible = true, points = {{34.5, 171.0}, {26.0, 171.0}, {26.0, 104.0}, {40.0, 104.0}, {40.0, 79.0}, {31.2, 79.0}}, color = {0, 0, 191}));
        connect(Prod_5_2.u1, Population.y2) annotation(
          Line(visible = true, points = {{8.8, 79.0}, {-55.0, 79.0}, {-55.0, 127.0}}, color = {0, 0, 191}));
        connect(BRMM.y, Prod_5_1.u1) annotation(
          Line(visible = true, points = {{-121.5, 185.0}, {-180.0, 185.0}, {-180.0, 80.0}, {-171.2, 80.0}}, color = {0, 0, 191}));
        connect(Prod_5_1.u5, Population.y4) annotation(
          Line(visible = true, points = {{-148.8, 80.0}, {-85.0, 80.0}, {-85.0, 127.0}}, color = {0, 0, 191}));
        connect(Prod_5_1.y, BR_norm.u) annotation(
          Line(visible = true, points = {{-160.0, 91.2}, {-160.0, 103.0}, {-145.5, 103.0}}, color = {0, 0, 191}));
        connect(BR_norm.y, Birth_Rate.u) annotation(
          Line(visible = true, points = {{-124.5, 103.0}, {-120.0, 103.0}, {-120.0, 119.0}}, color = {0, 0, 191}));
        connect(Source1.MassInPort1, Birth_Rate.y) annotation(
          Line(visible = true, points = {{-139.0, 140.0}, {-130.0, 140.0}}, color = {191, 0, 191}));
        connect(Birth_Rate.y1, Population.u1) annotation(
          Line(visible = true, points = {{-110.0, 140.0}, {-92.0, 140.0}}, color = {191, 0, 191}));
        connect(Population.u2, Death_Rate.y) annotation(
          Line(visible = true, points = {{-48.0, 140.0}, {-30.0, 140.0}}, color = {191, 0, 191}));
        connect(Death_Rate.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, points = {{-10.0, 140.0}, {-1.0, 140.0}}, color = {191, 0, 191}));
        connect(Source2.MassInPort1, Generation.y) annotation(
          Line(visible = true, points = {{61.0, 140.0}, {70.0, 140.0}}, color = {191, 0, 191}));
        connect(Gen_Const.y, Generation.u) annotation(
          Line(visible = true, points = {{80.0, 111.5}, {80.0, 119.0}}, color = {0, 0, 191}));
        connect(NRFR.u, Natural_Resources.y4) annotation(
          Line(visible = true, points = {{126.5, 51.0}, {115.0, 51.0}, {115.0, 127.0}}, color = {0, 0, 191}));
        connect(Generation.y1, Natural_Resources.u1) annotation(
          Line(visible = true, points = {{90.0, 140.0}, {108.0, 140.0}}, color = {191, 0, 191}));
        connect(Natural_Resources.u2, Depletion.y) annotation(
          Line(visible = true, points = {{152.0, 140.0}, {170.0, 140.0}}, color = {191, 0, 191}));
        connect(Depletion.y1, Sink2.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, 140.0}, {199.0, 140.0}}, color = {191, 0, 191}));
        Pop = Population.y;
        Pol = Pollution.y;
        Pol_rat = Pol_Ratio.y;
        Cap_inv = Capital_Investment.y;
        Qual_life = Quality_of_Life.y;
        Nat_res = Natural_Resources.y;
        NRUN = if years > 1970 then 0.25 else 1.0;
        NR_norm.u2 = NRUN;
        POLN = if years > 1970 then 0.25 else 1.0;
        Pol_norm.u2 = POLN;
        DRN = if years > 1970 then 0.02 else 0.028;
        DR_norm.u2 = DRN;
        Pop_meas = Functions.Utilities.Piecewise(x = years, x_grid = time_vals, y_grid = pop_vals);
        dir = if time > time_reverse then -1 else 1;
        Population.dir = dir;
        Pollution.dir = dir;
        Natural_Resources.dir = dir;
        Capital_Investment.dir = dir;
        CIAF.dir = dir;
        der(years) = dir;
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-220.0, -264.0}, {442.0, 220.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-152.0, 70.0}, {368.0, 140.0}}, textString = "4th Modification", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-148.0, -26.0}, {372.0, 44.0}}, textString = "Simulation", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-150.0, -106.0}, {370.0, -36.0}}, textString = "made", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-150.0, -192.0}, {370.0, -122.0}}, textString = "reversible in time", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-62.0, 6.0}, {-58.0, 10.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{98.0, 192.0}, {102.0, 196.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{138.0, -16.0}, {142.0, -12.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -22.0}, {2.0, -18.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-178.0, -2.0}, {-174.0, 2.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{78.0, 4.0}, {82.0, 8.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -97.0}, {2.0, -93.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-178.0, -68.0}, {-174.0, -64.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -68.0}, {2.0, -64.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{158.0, 28.0}, {162.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{38.0, -262.0}, {42.0, -258.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, -102.0}, {302.0, -98.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 28.0}, {302.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 78.0}, {302.0, 82.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 169.0}, {302.0, 173.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{342.0, -171.0}, {346.0, -167.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{354.0, -234.0}, {358.0, -230.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-97.0, 6.0}, {-93.0, 10.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-137.0, -22.0}, {-133.0, -18.0}})}),
          experiment(StopTime = 233, Tolerance = 0.0000000001),
          experimentSetupOutput,
          Documentation(info = "<html>
This is yet another modification of <a href=\"http://en.wikipedia.org/wiki/Jay_Wright_Forrester\">Jay Forrester's</a> <font color=red><b>WORLD2</b></font> model. We wish to introduce time reversal to the simulation.  To this end, we replace the regular continuous levels of the System Dynamics methodology by reversible levels. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Forrester, J.W. (1971), <a href=\"http://www.amazon.com/World-Dynamics-Jay-W-Forrester/dp/1883823382/ref=ed_oe_h/103-2487145-1208659\">World Dynamics</a>, Pegasus Communications, 160p.
</ol> <p>
 
<hr> <p>
 
Simulate the model across 233 years with time reversal starting at year 200, i.e., we simulate the world model forward through time from the year 1900 until the year 2100, and then backward through time from the year 2100 until the year 2067.  For this experiment, you need to set the simulation accuracy to 1e-10. <p>
 
Plot the simulated world population against the calendar years. <p>
<img src=\"modelica://SystemDynamics/Resources/Images/SD_Fig5.png\"> <p>
 
You shall notice that time reversal in the world model is numerically problematic.  The simulation is numerically unstable in backward direction.  The time-reversed model simulates correctly for a few years, but as numerical errors get the trajectory away from its designed path, the backward trajectory starts diverging quickly from the forward trajectory. <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_5;

      model Scenario_6 "6th Scenario"
        parameter Real Population_0 = 1650000000.0 "World population in 1900";
        parameter Real Pollution_0 = 200000000.0 "Pollution in 1900";
        parameter Real Nat_Resources_0(unit = "ton") = 900000000000.0 "Unrecoverable natural resources in 1900";
        parameter Real Cap_Invest_0(unit = "dollar") = 400000000.0 "Capital investment in 1900";
        parameter Real CIAF_0 = 0.2 "Proportion of capital investment in agriculture in 1900";
        parameter Real BRN(unit = "1/yr") = 0.04 "Normal birth rate";
        parameter Real CIAFN(unit = "dollar") = 0.3 "CIAF normalization";
        parameter Real CIAFT(unit = "yr") = 15.0 "CIAF time constant";
        parameter Real CIDN(unit = "dollar/yr") = 0.025 "Normal capital discard";
        parameter Real CIGN(unit = "dollar/yr") = 0.05 "Normal capital generation";
        parameter Real DRN(unit = "1/yr") = 0.028 "Normal death rate";
        parameter Real ECIRN(unit = "dollar") = 1.0 "Capital normalization";
        parameter Real FC(unit = "kg/yr") = 1.0 "Food coefficient";
        parameter Real FN(unit = "kg/yr") = 1.0 "Food normalization";
        parameter Real Land_Area(unit = "hectare") = 135000000.0 "Area of arable land";
        parameter Real NRI(unit = "ton") = 900000000000.0 "Initial natural resources";
        parameter Real POLN(unit = "1/yr") = 1.0 "Normal pollution";
        parameter Real POLS = 3599900000.0 "Standard pollution";
        parameter Real Pop_dens_norm(unit = "1/hectare") = 26.5 "Normal population density";
        parameter Real QLS = 1.0 "Standard quality of life";
        output Real Pop "World population";
        output Real Pol "Pollution";
        output Real Pol_rat "Pollution ratio";
        output Real Cap_inv(unit = "dollar") "Capital investment";
        output Real Qual_life "Quality of life";
        output Real Nat_res(unit = "ton") "Natural unrecoverable resources";
        parameter Real NRUN2(unit = "1/yr") = 1.0 "Resource utilization after 1970";
        Real NRUN(unit = "1/yr") "Normal resource utilization";
        Real rel_dPop(unit = "1/yr") "Relative derivative of population";
        Real min_dPop(unit = "1/yr") "Minimal derivative of population";
        Real min_QL(start = 1) "Minimum quality of life";
        Real Perf_Index "Preformance index";
        constant Real dPop_fact(unit = "1/yr") = 1 "Dimensionality factor";
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-150.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Birth_Rate annotation(
          Placement(visible = true, transformation(origin = {-120.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Population(x0 = Population_0) annotation(
          Placement(visible = true, transformation(origin = {-70.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Death_Rate annotation(
          Placement(visible = true, transformation(origin = {-20.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {10.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source2 annotation(
          Placement(visible = true, transformation(origin = {50.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Generation annotation(
          Placement(visible = true, transformation(origin = {80.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Natural_Resources(x0 = Nat_Resources_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Depletion annotation(
          Placement(visible = true, transformation(origin = {180.0, 140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink2 annotation(
          Placement(visible = true, transformation(origin = {210.0, 140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Gen_Const(k = 0) annotation(
          Placement(visible = true, transformation(origin = {80.0, 101.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular BRMM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {1.2, 1.0, 0.85, 0.75, 0.7, 0.7, 0.7}) annotation(
          Placement(visible = true, transformation(origin = {-105.0, 185.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular DRMM(x_vals = {0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 20}, y_vals = {3.0, 1.8, 1.0, 0.8, 0.7, 0.6, 0.53, 0.5, 0.5, 0.5, 0.5, 0.5}) annotation(
          Placement(visible = true, transformation(origin = {51.0, 171.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain BR_norm(k = BRN) annotation(
          Placement(visible = true, transformation(origin = {-135.0, 103.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_5 Prod_5_1 annotation(
          Placement(visible = true, transformation(origin = {-160.0, 80.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain DR_norm(k = DRN) annotation(
          Placement(visible = true, transformation(origin = {-3.0, 103.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_5 Prod_5_2 annotation(
          Placement(visible = true, transformation(origin = {20.0, 79.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular BRFM(x_vals = {0, 1, 2, 3, 4, 20}, y_vals = {0.0, 1.0, 1.6, 1.9, 2.0, 2.0}) annotation(
          Placement(visible = true, transformation(origin = {-176.0, 35.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular BRPM(x_vals = 0:10:60, y_vals = {1.02, 0.9, 0.7, 0.4, 0.25, 0.15, 0.1}) annotation(
          Placement(visible = true, transformation(origin = {-135.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular BRCM(x_vals = 0:5, y_vals = {1.05, 1.0, 0.9, 0.7, 0.6, 0.55}) annotation(
          Placement(visible = true, transformation(origin = {-95.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRCM(x_vals = 0:5, y_vals = {0.9, 1.0, 1.2, 1.5, 1.9, 3.0}) annotation(
          Placement(visible = true, transformation(origin = {-25.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRPM(x_vals = 0:10:60, y_vals = {0.92, 1.3, 2.0, 3.2, 4.8, 6.8, 9.2}) annotation(
          Placement(visible = true, transformation(origin = {15.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular DRFM(x_vals = {0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 20}, y_vals = {30.0, 3.0, 2.0, 1.4, 1.0, 0.7, 0.6, 0.5, 0.5, 0.5}) annotation(
          Placement(visible = true, transformation(origin = {55.0, 35.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -270)));
        SystemDynamics.Auxiliary.Gain Crowd_Rat(k = 1.0 / (Land_Area * Pop_dens_norm)) annotation(
          Placement(visible = true, transformation(origin = {-60.0, 35.0}, extent = {{-16.0, -15.0}, {16.0, 15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_1 annotation(
          Placement(visible = true, transformation(origin = {140.0, 80.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular NRMM(x_vals = 0:10, y_vals = {0.0, 1.0, 1.8, 2.4, 2.9, 3.3, 3.6, 3.8, 3.9, 3.95, 4.0}) annotation(
          Placement(visible = true, transformation(origin = {201.0, 80.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Sources.Source Source3 annotation(
          Placement(visible = true, transformation(origin = {50.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CI_Generation annotation(
          Placement(visible = true, transformation(origin = {80.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Capital_Investment(x0 = Cap_Invest_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CI_Discard annotation(
          Placement(visible = true, transformation(origin = {180.0, -40.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink3 annotation(
          Placement(visible = true, transformation(origin = {210.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIG_norm(k = CIGN) annotation(
          Placement(visible = true, transformation(origin = {65.0, -77.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_2 annotation(
          Placement(visible = true, transformation(origin = {40.0, -100.0}, extent = {{-14.0, -16.0}, {14.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CID_norm(k = CIDN) annotation(
          Placement(visible = true, transformation(origin = {165.0, -77.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular CIM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {0.1, 1.0, 1.8, 2.4, 2.8, 3.0, 3.0}) annotation(
          Placement(visible = true, transformation(origin = {113.0, -100.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain MSL(k = 1.0 / ECIRN) annotation(
          Placement(visible = true, transformation(origin = {277.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain NRFR(k = 1.0 / NRI) annotation(
          Placement(visible = true, transformation(origin = {137.0, 51.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain ECIR(k = 1.0 / (1.0 - CIAFN)) annotation(
          Placement(visible = true, transformation(origin = {243.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_1 annotation(
          Placement(visible = true, transformation(origin = {215.0, 30.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular NREM(x_vals = 0:0.25:1, y_vals = {0.0, 0.15, 0.5, 0.85, 1.0}) annotation(
          Placement(visible = true, transformation(origin = {175.0, 51.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -180)));
        Modelica.Blocks.Math.Division CIR annotation(
          Placement(visible = true, transformation(origin = {107.0, 6.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source4 annotation(
          Placement(visible = true, transformation(origin = {-150.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 P_Generation annotation(
          Placement(visible = true, transformation(origin = {-120.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Pollution(x0 = Pollution_0) annotation(
          Placement(visible = true, transformation(origin = {-70.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 P_Absorption annotation(
          Placement(visible = true, transformation(origin = {-20.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink4 annotation(
          Placement(visible = true, transformation(origin = {10.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Linear NotCIAF(m = -1.0, b = 1.0) annotation(
          Placement(visible = true, transformation(origin = {189.0, 10.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain Pol_Ratio(k = 1.0 / POLS) annotation(
          Placement(visible = true, transformation(origin = {-29.0, -95.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular FCM(x_vals = 0:5, y_vals = {2.4, 1.0, 0.6, 0.4, 0.3, 0.2}) annotation(
          Placement(visible = true, transformation(origin = {-85.0, -47.0}, extent = {{-15.0, 15.0}, {15.0, -15.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_3 Prod_3_2 annotation(
          Placement(visible = true, transformation(origin = {-117.0, -66.0}, extent = {{15.0, -14.0}, {-15.0, 14.0}}, rotation = 90)));
        SystemDynamics.Auxiliary.Gain Food_Ratio(k = FC / FN) annotation(
          Placement(visible = true, transformation(origin = {-149.0, -66.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source5 annotation(
          Placement(visible = true, transformation(origin = {50.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CIAFG annotation(
          Placement(visible = true, transformation(origin = {80.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Levels.Level CIAF(x0 = CIAF_0) annotation(
          Placement(visible = true, transformation(origin = {130.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 CIAFD annotation(
          Placement(visible = true, transformation(origin = {180.0, -140.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink5 annotation(
          Placement(visible = true, transformation(origin = {210.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIAF_D(k = 1.0 / CIAFT) annotation(
          Placement(visible = true, transformation(origin = {163.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIAF_G(k = 1.0 / CIAFT) annotation(
          Placement(visible = true, transformation(origin = {95.0, -180.0}, extent = {{15.0, -16.0}, {-15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_3 annotation(
          Placement(visible = true, transformation(origin = {120.0, -230.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division P_Abs annotation(
          Placement(visible = true, transformation(origin = {-43.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain Pol_norm(k = POLN) annotation(
          Placement(visible = true, transformation(origin = {-135.0, -180.0}, extent = {{-15.0, -16.0}, {15.0, 16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_4 annotation(
          Placement(visible = true, transformation(origin = {-160.0, -220.0}, extent = {{-16.0, -16.0}, {16.0, 16.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular POLCM(x_vals = {0, 1, 2, 3, 4, 5, 100}, y_vals = {0.05, 1.0, 3.0, 5.4, 7.4, 8.0, 8.0}) annotation(
          Placement(visible = true, transformation(origin = {-117.0, -220.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular POLAT(x_vals = 0:10:60, y_vals = {0.6, 2.5, 5.0, 8.0, 11.5, 15.5, 20.0}) annotation(
          Placement(visible = true, transformation(origin = {-39.0, -220.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular CFIFR(x_vals = {0, 0.5, 1, 1.5, 2, 20}, y_vals = {1.0, 0.6, 0.3, 0.15, 0.1, 0.1}) annotation(
          Placement(visible = true, transformation(origin = {69.0, -230.0}, extent = {{15.0, 16.0}, {-15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular FPM(x_vals = 0:10:60, y_vals = {1.02, 0.9, 0.65, 0.35, 0.2, 0.1, 0.05}) annotation(
          Placement(visible = true, transformation(origin = {-33.0, -66.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_2 Prod_2_5 annotation(
          Placement(visible = true, transformation(origin = {229.0, -200.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Gain CIRA(k = 1.0 / CIAFN) annotation(
          Placement(visible = true, transformation(origin = {255.0, -225.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular FPCI(x_vals = {0, 1, 2, 3, 4, 5, 6, 100}, y_vals = {0.5, 1.0, 1.4, 1.7, 1.9, 2.05, 2.2, 2.2}) annotation(
          Placement(visible = true, transformation(origin = {-153.0, -107.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular CIQR(y_vals = {0.7, 0.8, 1.0, 1.5, 2.0, 2.0}, x_vals = {0, 0.5, 1, 1.5, 2, 10}) annotation(
          Placement(visible = true, transformation(origin = {167.0, -230.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        Modelica.Blocks.Math.Division QLMF annotation(
          Placement(visible = true, transformation(origin = {315.0, -223.0}, extent = {{15.0, -15.0}, {-15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular QLM(x_vals = {0, 1, 2, 3, 4, 5, 20}, y_vals = {0.2, 1.0, 1.7, 2.3, 2.7, 2.9, 2.9}) annotation(
          Placement(visible = true, transformation(origin = {319.0, -169.0}, extent = {{15.0, 17.0}, {-15.0, -17.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular QLF(x_vals = {0, 1, 2, 3, 4, 20}, y_vals = {0.0, 1.0, 1.8, 2.4, 2.7, 2.7}) annotation(
          Placement(visible = true, transformation(origin = {381.0, -232.0}, extent = {{-15.0, 16.0}, {15.0, -16.0}}, rotation = -180)));
        SystemDynamics.Auxiliary.Prod_4 Prod_4_1 annotation(
          Placement(visible = true, transformation(origin = {375.0, -163.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular QLC(x_vals = 0:0.5:5, y_vals = {2.0, 1.3, 1.0, 0.75, 0.55, 0.45, 0.38, 0.3, 0.25, 0.22, 0.2}) annotation(
          Placement(visible = true, transformation(origin = {335.0, -113.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular QLP(x_vals = 0:10:60, y_vals = {1.04, 0.85, 0.6, 0.3, 0.15, 0.05, 0.02}) annotation(
          Placement(visible = true, transformation(origin = {375.0, -113.0}, extent = {{15.0, 15.0}, {-15.0, -15.0}}, rotation = -90)));
        SystemDynamics.Auxiliary.Gain Quality_of_Life(k = QLS) annotation(
          Placement(visible = true, transformation(origin = {412.0, -163.0}, extent = {{-20.0, -21.0}, {20.0, 21.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World2.Utilities.Parameter_Change NR_norm annotation(
          Placement(visible = true, transformation(origin = {158.8111, 105.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
      equation
        connect(Depletion.u, NR_norm.y) annotation(
          Line(visible = true, origin = {177.437, 109.6667}, points = {{2.563, 9.3333}, {2.563, -4.6667}, {-5.1259, -4.6667}}, color = {0, 0, 191}));
        connect(NR_norm.u1, Prod_2_1.y) annotation(
          Line(visible = true, points = {{145.3111, 111.0}, {140.0, 111.0}, {140.0, 91.2}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, BRFM.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-176.0, -66.0}, {-176.0, 22.2}}, color = {0, 0, 191}));
        connect(BRFM.y, Prod_5_1.u2) annotation(
          Line(visible = true, points = {{-176.0, 52.6}, {-176.0, 60.0}, {-167.36, 60.0}, {-167.36, 72.0}}, color = {0, 0, 191}));
        connect(BRPM.u, QLP.u) annotation(
          Line(visible = true, points = {{-135.0, 23.0}, {-135.0, -20.0}, {-214.0, -20.0}, {-214.0, 214.0}, {375.0, 214.0}, {375.0, -125.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, BRPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, -20.0}, {-135.0, -20.0}, {-135.0, 23.0}}, color = {0, 0, 191}));
        connect(BRPM.y, Prod_5_1.u3) annotation(
          Line(visible = true, points = {{-135.0, 51.5}, {-135.0, 60.0}, {-160.0, 60.0}, {-160.0, 68.8}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, BRCM.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-95.0, 8.0}, {-95.0, 23.0}}, color = {0, 0, 191}));
        connect(BRCM.y, Prod_5_1.u4) annotation(
          Line(visible = true, points = {{-95.0, 51.5}, {-95.0, 66.0}, {-152.64, 66.0}, {-152.64, 72.0}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, DRCM.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-25.0, 8.0}, {-25.0, 23.0}}, color = {0, 0, 191}));
        connect(DRCM.y, Prod_5_2.u2) annotation(
          Line(visible = true, points = {{-25.0, 51.5}, {-25.0, 60.0}, {12.64, 60.0}, {12.64, 71.5}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, DRPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, 8.0}, {15.0, 8.0}, {15.0, 23.0}}, color = {0, 0, 191}));
        connect(DRPM.y, Prod_5_2.u3) annotation(
          Line(visible = true, points = {{15.0, 51.5}, {15.0, 60.0}, {20.0, 60.0}, {20.0, 68.5}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, DRFM.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-176.0, -66.0}, {-176.0, 0.0}, {55.0, 0.0}, {55.0, 23.0}}, color = {0, 0, 191}));
        connect(DRFM.y, Prod_5_2.u4) annotation(
          Line(visible = true, points = {{55.0, 51.5}, {55.0, 60.0}, {27.36, 60.0}, {27.36, 71.5}}, color = {0, 0, 191}));
        connect(Crowd_Rat.y, QLC.u) annotation(
          Line(visible = true, points = {{-60.0, 23.8}, {-60.0, 8.0}, {-206.0, 8.0}, {-206.0, 208.0}, {335.0, 208.0}, {335.0, -125.0}}, color = {0, 0, 191}));
        connect(FCM.u, Crowd_Rat.y) annotation(
          Line(visible = true, points = {{-73.0, -47.0}, {-60.0, -47.0}, {-60.0, 23.8}}, color = {0, 0, 191}));
        connect(Crowd_Rat.u, Population.y3) annotation(
          Line(visible = true, points = {{-60.0, 46.2}, {-60.0, 66.0}, {-70.0, 66.0}, {-70.0, 127.0}}, color = {0, 0, 191}));
        connect(Prod_2_5.u2, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{239.5, -200.0}, {260.0, -200.0}, {260.0, -20.0}, {160.0, -20.0}, {160.0, 30.0}, {203.8, 30.0}}, color = {0, 0, 191}));
        connect(Prod_3_1.y, ECIR.u) annotation(
          Line(visible = true, points = {{226.2, 30.0}, {232.5, 30.0}}, color = {0, 0, 191}));
        connect(CIR.y, Prod_3_1.u2) annotation(
          Line(visible = true, points = {{90.5, 6.0}, {80.0, 6.0}, {80.0, 30.0}, {203.8, 30.0}}, color = {0, 0, 191}));
        connect(NotCIAF.y, Prod_3_1.u3) annotation(
          Line(visible = true, points = {{202.5, 10.0}, {215.0, 10.0}, {215.0, 19.5}}, color = {0, 0, 191}));
        connect(Prod_3_1.u1, NREM.y) annotation(
          Line(visible = true, points = {{215.0, 40.5}, {215.0, 51.0}, {191.5, 51.0}}, color = {0, 0, 191}));
        connect(QLP.y, Prod_4_1.u1) annotation(
          Line(visible = true, points = {{375.0, -96.5}, {375.0, -152.5}}, color = {0, 0, 191}));
        connect(QLC.y, Prod_4_1.u2) annotation(
          Line(visible = true, points = {{335.0, -96.5}, {335.0, -157.0}, {366.6, -157.0}}, color = {0, 0, 191}));
        connect(Prod_4_1.y, Quality_of_Life.u) annotation(
          Line(visible = true, points = {{385.5, -163.0}, {398.0, -163.0}}, color = {0, 0, 191}));
        connect(QLF.y, Prod_4_1.u4) annotation(
          Line(visible = true, points = {{364.5, -232.0}, {356.0, -232.0}, {356.0, -190.0}, {375.0, -190.0}, {375.0, -173.5}}, color = {0, 0, 191}));
        connect(QLM.y, Prod_4_1.u3) annotation(
          Line(visible = true, points = {{335.5, -169.0}, {366.6, -169.0}}, color = {0, 0, 191}));
        connect(QLF.y, QLMF.u2) annotation(
          Line(visible = true, points = {{364.5, -232.0}, {333.0, -232.0}}, color = {0, 0, 191}));
        connect(QLMF.y, CIQR.u) annotation(
          Line(visible = true, points = {{298.5, -223.0}, {290.0, -223.0}, {290.0, -256.0}, {190.0, -256.0}, {190.0, -230.0}, {179.0, -230.0}}, color = {0, 0, 191}));
        connect(P_Abs.u1, Pollution.y3) annotation(
          Line(visible = true, points = {{-61.0, -170.4}, {-70.0, -170.4}, {-70.0, -153.0}}, color = {0, 0, 191}));
        connect(CIG_norm.y, CI_Generation.u) annotation(
          Line(visible = true, points = {{75.5, -77.0}, {80.0, -77.0}, {80.0, -61.0}}, color = {0, 0, 191}));
        connect(CI_Discard.y1, Sink3.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, -40.0}, {199.0, -40.0}}, color = {191, 0, 191}));
        connect(Capital_Investment.u2, CI_Discard.y) annotation(
          Line(visible = true, points = {{152.0, -40.0}, {170.0, -40.0}}, color = {191, 0, 191}));
        connect(Source3.MassInPort1, CI_Generation.y) annotation(
          Line(visible = true, points = {{61.0, -40.0}, {70.0, -40.0}}, color = {191, 0, 191}));
        connect(CI_Generation.y1, Capital_Investment.u1) annotation(
          Line(visible = true, points = {{90.0, -40.0}, {108.0, -40.0}}, color = {191, 0, 191}));
        connect(FPM.u, POLAT.u) annotation(
          Line(visible = true, points = {{-21.0, -66.0}, {0.0, -66.0}, {0.0, -220.0}, {-27.0, -220.0}}, color = {0, 0, 191}));
        connect(CIRA.y, FPCI.u) annotation(
          Line(visible = true, points = {{265.5, -225.0}, {280.0, -225.0}, {280.0, -252.0}, {-210.0, -252.0}, {-210.0, -107.0}, {-165.0, -107.0}}, color = {0, 0, 191}));
        connect(Prod_2_1.u1, Population.y1) annotation(
          Line(visible = true, points = {{128.8, 80.0}, {100.0, 80.0}, {100.0, 194.0}, {-46.0, 194.0}, {-46.0, 151.0}, {-53.0, 151.0}}, color = {0, 0, 191}));
        connect(NRMM.u, DRMM.u) annotation(
          Line(visible = true, points = {{213.0, 80.0}, {300.0, 80.0}, {300.0, 171.0}, {63.0, 171.0}}, color = {0, 0, 191}));
        connect(NRMM.u, BRMM.u) annotation(
          Line(visible = true, points = {{213.0, 80.0}, {300.0, 80.0}, {300.0, 200.0}, {-70.0, 200.0}, {-70.0, 185.0}, {-93.0, 185.0}}, color = {0, 0, 191}));
        connect(CFIFR.u, QLF.u) annotation(
          Line(visible = true, points = {{57.0, -230.0}, {40.0, -230.0}, {40.0, -260.0}, {400.0, -260.0}, {400.0, -232.0}, {393.0, -232.0}}, color = {0, 0, 191}));
        connect(Food_Ratio.y, QLF.u) annotation(
          Line(visible = true, points = {{-159.5, -66.0}, {-220.0, -66.0}, {-220.0, -260.0}, {400.0, -260.0}, {400.0, -232.0}, {393.0, -232.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.y, FPM.u) annotation(
          Line(visible = true, points = {{-18.5, -95.0}, {0.0, -95.0}, {0.0, -66.0}, {-21.0, -66.0}}, color = {0, 0, 191}));
        connect(CIR.y, POLCM.u) annotation(
          Line(visible = true, points = {{90.5, 6.0}, {80.0, 6.0}, {80.0, -6.0}, {10.0, -6.0}, {10.0, -116.0}, {-100.0, -116.0}, {-100.0, -220.0}, {-105.0, -220.0}}, color = {0, 0, 191}));
        connect(QLM.u, CIM.u) annotation(
          Line(visible = true, points = {{307.0, -169.0}, {300.0, -169.0}, {300.0, -100.0}, {125.0, -100.0}}, color = {0, 0, 191}));
        connect(QLM.y, QLMF.u1) annotation(
          Line(visible = true, points = {{335.5, -169.0}, {344.0, -169.0}, {344.0, -214.0}, {333.0, -214.0}}, color = {0, 0, 191}));
        connect(MSL.y, QLM.u) annotation(
          Line(visible = true, points = {{287.5, 30.0}, {300.0, 30.0}, {300.0, -169.0}, {307.0, -169.0}}, color = {0, 0, 191}));
        connect(NRMM.y, Prod_2_1.u2) annotation(
          Line(visible = true, points = {{184.5, 80.0}, {151.2, 80.0}}, color = {0, 0, 191}));
        connect(MSL.y, NRMM.u) annotation(
          Line(visible = true, points = {{287.5, 30.0}, {300.0, 30.0}, {300.0, 80.0}, {213.0, 80.0}}, color = {0, 0, 191}));
        connect(ECIR.y, MSL.u) annotation(
          Line(visible = true, points = {{253.5, 30.0}, {266.5, 30.0}}, color = {0, 0, 191}));
        connect(NotCIAF.u, CIAF.y1) annotation(
          Line(visible = true, points = {{175.5, 10.0}, {168.0, 10.0}, {168.0, -8.0}, {240.0, -8.0}, {240.0, -110.0}, {154.0, -110.0}, {154.0, -129.0}, {147.0, -129.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, CIR.u2) annotation(
          Line(visible = true, points = {{30.2, -100.0}, {20.0, -100.0}, {20.0, -14.0}, {140.0, -14.0}, {140.0, -3.6}, {125.0, -3.6}}, color = {0, 0, 191}));
        connect(Prod_2_2.u1, Population.y1) annotation(
          Line(visible = true, points = {{30.2, -100.0}, {20.0, -100.0}, {20.0, -14.0}, {320.0, -14.0}, {320.0, 194.0}, {-46.0, 194.0}, {-46.0, 151.0}, {-53.0, 151.0}}, color = {0, 0, 191}));
        connect(Prod_2_4.u1, Population.y) annotation(
          Line(visible = true, points = {{-171.2, -220.0}, {-200.0, -220.0}, {-200.0, 164.0}, {-94.0, 164.0}, {-94.0, 151.0}, {-87.0, 151.0}}, color = {0, 0, 191}));
        connect(CID_norm.u, Capital_Investment.y2) annotation(
          Line(visible = true, points = {{154.5, -77.0}, {145.0, -77.0}, {145.0, -53.0}}, color = {0, 0, 191}));
        connect(CID_norm.y, CI_Discard.u) annotation(
          Line(visible = true, points = {{175.5, -77.0}, {180.0, -77.0}, {180.0, -61.0}}, color = {0, 0, 191}));
        connect(CIM.y, Prod_2_2.u2) annotation(
          Line(visible = true, points = {{96.5, -100.0}, {49.8, -100.0}}, color = {0, 0, 191}));
        connect(Prod_2_2.y, CIG_norm.u) annotation(
          Line(visible = true, points = {{40.0, -88.8}, {40.0, -77.0}, {54.5, -77.0}}, color = {0, 0, 191}));
        connect(Pol_Ratio.u, Pollution.y1) annotation(
          Line(visible = true, points = {{-39.5, -95.0}, {-46.0, -95.0}, {-46.0, -129.0}, {-53.0, -129.0}}, color = {0, 0, 191}));
        connect(POLCM.y, Prod_2_4.u2) annotation(
          Line(visible = true, points = {{-133.5, -220.0}, {-148.8, -220.0}}, color = {0, 0, 191}));
        connect(Prod_2_4.y, Pol_norm.u) annotation(
          Line(visible = true, points = {{-160.0, -208.8}, {-160.0, -180.0}, {-145.5, -180.0}}, color = {0, 0, 191}));
        connect(Pol_norm.y, P_Generation.u) annotation(
          Line(visible = true, points = {{-124.5, -180.0}, {-120.0, -180.0}, {-120.0, -161.0}}, color = {0, 0, 191}));
        connect(POLAT.y, P_Abs.u2) annotation(
          Line(visible = true, points = {{-55.5, -220.0}, {-70.0, -220.0}, {-70.0, -189.6}, {-61.0, -189.6}}, color = {0, 0, 191}));
        connect(P_Abs.y, P_Absorption.u) annotation(
          Line(visible = true, points = {{-26.5, -180.0}, {-20.0, -180.0}, {-20.0, -161.0}}, color = {0, 0, 191}));
        connect(CFIFR.y, Prod_2_3.u1) annotation(
          Line(visible = true, points = {{85.5, -230.0}, {108.8, -230.0}}, color = {0, 0, 191}));
        connect(CIQR.y, Prod_2_3.u2) annotation(
          Line(visible = true, points = {{150.5, -230.0}, {131.2, -230.0}}, color = {0, 0, 191}));
        connect(CIAF_G.y, CIAFG.u) annotation(
          Line(visible = true, points = {{84.5, -180.0}, {80.0, -180.0}, {80.0, -161.0}}, color = {0, 0, 191}));
        connect(CIAF_G.u, Prod_2_3.y) annotation(
          Line(visible = true, points = {{105.5, -180.0}, {120.0, -180.0}, {120.0, -218.8}}, color = {0, 0, 191}));
        connect(CIRA.u, Prod_2_5.y) annotation(
          Line(visible = true, points = {{244.5, -225.0}, {229.0, -225.0}, {229.0, -211.2}}, color = {0, 0, 191}));
        connect(Prod_2_5.u1, CIAF.y3) annotation(
          Line(visible = true, points = {{218.5, -200.0}, {130.0, -200.0}, {130.0, -153.0}}, color = {0, 0, 191}));
        connect(CIAF_D.u, CIAF.y2) annotation(
          Line(visible = true, points = {{152.5, -180.0}, {145.0, -180.0}, {145.0, -153.0}}, color = {0, 0, 191}));
        connect(CIAF_D.y, CIAFD.u) annotation(
          Line(visible = true, points = {{173.5, -180.0}, {180.0, -180.0}, {180.0, -161.0}}, color = {0, 0, 191}));
        connect(CIAFD.y1, Sink5.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, -140.0}, {199.0, -140.0}}, color = {191, 0, 191}));
        connect(CIAF.u2, CIAFD.y) annotation(
          Line(visible = true, points = {{152.0, -140.0}, {170.0, -140.0}}, color = {191, 0, 191}));
        connect(CIAFG.y1, CIAF.u1) annotation(
          Line(visible = true, points = {{90.0, -140.0}, {108.0, -140.0}}, color = {191, 0, 191}));
        connect(Source5.MassInPort1, CIAFG.y) annotation(
          Line(visible = true, points = {{61.0, -140.0}, {70.0, -140.0}}, color = {191, 0, 191}));
        connect(P_Absorption.y1, Sink4.MassInPort1) annotation(
          Line(visible = true, points = {{-10.0, -140.0}, {-1.0, -140.0}}, color = {191, 0, 191}));
        connect(Pollution.u2, P_Absorption.y) annotation(
          Line(visible = true, points = {{-48.0, -140.0}, {-30.0, -140.0}}, color = {191, 0, 191}));
        connect(P_Generation.y1, Pollution.u1) annotation(
          Line(visible = true, points = {{-110.0, -140.0}, {-92.0, -140.0}}, color = {191, 0, 191}));
        connect(Source4.MassInPort1, P_Generation.y) annotation(
          Line(visible = true, points = {{-139.0, -140.0}, {-130.0, -140.0}}, color = {191, 0, 191}));
        connect(FPCI.y, Prod_3_2.u3) annotation(
          Line(visible = true, points = {{-136.5, -107.0}, {-117.0, -107.0}, {-117.0, -76.5}}, color = {0, 0, 191}));
        connect(FPM.y, Prod_3_2.u2) annotation(
          Line(visible = true, points = {{-49.5, -66.0}, {-107.2, -66.0}}, color = {0, 0, 191}));
        connect(Prod_3_2.u1, FCM.y) annotation(
          Line(visible = true, points = {{-117.0, -55.5}, {-117.0, -47.0}, {-101.5, -47.0}}, color = {0, 0, 191}));
        connect(Prod_3_2.y, Food_Ratio.u) annotation(
          Line(visible = true, points = {{-126.8, -66.0}, {-138.5, -66.0}}, color = {0, 0, 191}));
        connect(CIR.u1, Capital_Investment.y1) annotation(
          Line(visible = true, points = {{125.0, 15.6}, {154.0, 15.6}, {154.0, -29.0}, {147.0, -29.0}}, color = {0, 0, 191}));
        connect(NRFR.y, NREM.u) annotation(
          Line(visible = true, points = {{147.5, 51.0}, {163.0, 51.0}}, color = {0, 0, 191}));
        connect(DRMM.y, Prod_5_2.u5) annotation(
          Line(visible = true, points = {{34.5, 171.0}, {26.0, 171.0}, {26.0, 104.0}, {40.0, 104.0}, {40.0, 79.0}, {31.2, 79.0}}, color = {0, 0, 191}));
        connect(DR_norm.y, Death_Rate.u) annotation(
          Line(visible = true, points = {{-13.5, 103.0}, {-20.0, 103.0}, {-20.0, 119.0}}, color = {0, 0, 191}));
        connect(Prod_5_2.y, DR_norm.u) annotation(
          Line(visible = true, points = {{20.0, 89.5}, {20.0, 103.0}, {7.5, 103.0}}, color = {0, 0, 191}));
        connect(Prod_5_2.u1, Population.y2) annotation(
          Line(visible = true, points = {{8.8, 79.0}, {-55.0, 79.0}, {-55.0, 127.0}}, color = {0, 0, 191}));
        connect(BRMM.y, Prod_5_1.u1) annotation(
          Line(visible = true, points = {{-121.5, 185.0}, {-180.0, 185.0}, {-180.0, 80.0}, {-171.2, 80.0}}, color = {0, 0, 191}));
        connect(Prod_5_1.u5, Population.y4) annotation(
          Line(visible = true, points = {{-148.8, 80.0}, {-85.0, 80.0}, {-85.0, 127.0}}, color = {0, 0, 191}));
        connect(Prod_5_1.y, BR_norm.u) annotation(
          Line(visible = true, points = {{-160.0, 91.2}, {-160.0, 103.0}, {-145.5, 103.0}}, color = {0, 0, 191}));
        connect(BR_norm.y, Birth_Rate.u) annotation(
          Line(visible = true, points = {{-124.5, 103.0}, {-120.0, 103.0}, {-120.0, 119.0}}, color = {0, 0, 191}));
        connect(Source1.MassInPort1, Birth_Rate.y) annotation(
          Line(visible = true, points = {{-139.0, 140.0}, {-130.0, 140.0}}, color = {191, 0, 191}));
        connect(Birth_Rate.y1, Population.u1) annotation(
          Line(visible = true, points = {{-110.0, 140.0}, {-92.0, 140.0}}, color = {191, 0, 191}));
        connect(Population.u2, Death_Rate.y) annotation(
          Line(visible = true, points = {{-48.0, 140.0}, {-30.0, 140.0}}, color = {191, 0, 191}));
        connect(Death_Rate.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, points = {{-10.0, 140.0}, {-1.0, 140.0}}, color = {191, 0, 191}));
        connect(Source2.MassInPort1, Generation.y) annotation(
          Line(visible = true, points = {{61.0, 140.0}, {70.0, 140.0}}, color = {191, 0, 191}));
        connect(Gen_Const.y, Generation.u) annotation(
          Line(visible = true, points = {{80.0, 111.5}, {80.0, 119.0}}, color = {0, 0, 191}));
        connect(NRFR.u, Natural_Resources.y4) annotation(
          Line(visible = true, points = {{126.5, 51.0}, {115.0, 51.0}, {115.0, 127.0}}, color = {0, 0, 191}));
        connect(Generation.y1, Natural_Resources.u1) annotation(
          Line(visible = true, points = {{90.0, 140.0}, {108.0, 140.0}}, color = {191, 0, 191}));
        connect(Natural_Resources.u2, Depletion.y) annotation(
          Line(visible = true, points = {{152.0, 140.0}, {170.0, 140.0}}, color = {191, 0, 191}));
        connect(Depletion.y1, Sink2.MassInPort1) annotation(
          Line(visible = true, points = {{190.0, 140.0}, {199.0, 140.0}}, color = {191, 0, 191}));
        Pop = Population.y;
        Pol = Pollution.y;
        Pol_rat = Pol_Ratio.y;
        Cap_inv = Capital_Investment.y;
        Qual_life = Quality_of_Life.y;
        Nat_res = Natural_Resources.y;
        NRUN = if time > 1970 then NRUN2 else 1.0;
        NR_norm.u2 = NRUN;
        rel_dPop = (Birth_Rate.rate - Death_Rate.rate) / Population.level;
        when sample(100, 1) then
          min_dPop = min([pre(min_dPop), rel_dPop]);
          min_QL = min([pre(min_QL), Quality_of_Life.y]);
        end when;
        Perf_Index = min_QL + 5 * min_dPop / dPop_fact;
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-220.0, -264.0}, {442.0, 220.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-152.0, 70.0}, {368.0, 140.0}}, textString = "5th Modification", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-148.0, -26.0}, {372.0, 44.0}}, textString = "Optimization", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-150.0, -106.0}, {370.0, -36.0}}, textString = "of use of", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, extent = {{-150.0, -192.0}, {370.0, -122.0}}, textString = "natural resources", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-62.0, 6.0}, {-58.0, 10.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{98.0, 192.0}, {102.0, 196.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{138.0, -16.0}, {142.0, -12.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -22.0}, {2.0, -18.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-178.0, -2.0}, {-174.0, 2.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{78.0, 4.0}, {82.0, 8.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -97.0}, {2.0, -93.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-178.0, -68.0}, {-174.0, -64.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-2.0, -68.0}, {2.0, -64.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{158.0, 28.0}, {162.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{38.0, -262.0}, {42.0, -258.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, -102.0}, {302.0, -98.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 28.0}, {302.0, 32.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 78.0}, {302.0, 82.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{298.0, 169.0}, {302.0, 173.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{342.0, -171.0}, {346.0, -167.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{354.0, -234.0}, {358.0, -230.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-97.0, 6.0}, {-93.0, 10.0}}), Ellipse(visible = true, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-137.0, -22.0}, {-133.0, -18.0}})}),
          experiment(StartTime = 1900, StopTime = 2100),
          experimentSetupOutput,
          Documentation(info = "<html>
The 6<sup>th</sup> scenario starts out from the 2<sup>nd</sup> scenario.  We now wish to vary the resource utilization rate after the year 1970. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Forrester, J.W. (1971), <a href=\"http://www.amazon.com/World-Dynamics-Jay-W-Forrester/dp/1883823382/ref=ed_oe_h/103-2487145-1208659\">World Dynamics</a>, Pegasus Communications, 160p.
</ol> <p>
 
<hr> <p>
 
Simulate the model six times across 200 years while keeping all six trajectories (plot setup menu).  For the six simulation runs, choose different levels of resource utilization after the year 1970: <br>
<font color=red><b>NRUN2 = {0.25, 0.5, 0.75, 1.0, 1.25, 1.5}</b></font>. <p>
 
Compute a performance index: <br>
<font color=red><b>Perf_Index = min_QL + 5*min_dPop;</b></font> <br>
where <b>min_QL</b> is the minimal quality of life observed between 2000 and 2100, and <b>min_dPop</b> is the largest negative population gradient observed in the same time period. <p>
 
Plot the performance index across the calendar years between 2000 and 2100 for all six scenarios on a single graph: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/SD_Fig6.png\"> <p>
 
<b>NRUN2 = 0.25</b> and <b>NRUN2 = 0.5</b> lead to massive die-off, whereas the other scenarios avoid this problem.  However in the short run, those scenarios that offer the worst long-term performance are characterized by the best short-term performance.  This is the predicament that humanity is currently facing. <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_6;

      package Utilities "Utility models of Forrester's WORLD2 model"
        extends Modelica.Icons.Library;

        block Parameter_Change "Parameter variation of WORLD2 model"
          extends Interfaces.Nonlin_2;
        equation
          y = u1 * u2;
        end Parameter_Change;
        annotation(
          preferedView = "info",
          Documentation(info = "<html>
Utility models of Forrester's <font color=red><b>WORLD2</b></font> model.
</html>"));
      end Utilities;
      annotation(
        preferedView = "info",
        Documentation(info = "<html>
This model implements <a href=\"http://en.wikipedia.org/wiki/Jay_Wright_Forrester\">Jay Forrester's</a> <font color=red><b>WORLD2</b></font> model as described in his 1971 book on <a href=\"http://www.amazon.com/World-Dynamics-Jay-W-Forrester/dp/1883823382/ref=ed_oe_h/103-2487145-1208659\">World Dynamics</a>.  <p>
 
It is a very simply model that contains only five state variables: <br>
 
<ol>
<li>total human population,
<li>total persistent pollution,
<li>remaining non-recoverable natural resources,
<li>total capital investment, and
<li>fraction of capital investment allocated to the agricultural sector.
</ol> <p>
 
The aim of the model is to demonstrate, in very simple terms, that physical systems remain always constrained.  The production of goods (especially food) on this globe is limited by the available resources, and energy constraints will prevent production to grow indefinitely. <p>
 
While these are very simple facts, it is useful to investigate, when our globe will reach its limits.  Forrester showed that this will inevitably happen during the first half of the 21st century.  After that, humanity will invariably have to learn to transform itself from a society of (seemingly perpetual) exponential growth to one of (truly perpetual) stagnation, at least as long as humanity limits itself to the resources available on this one planet. <p>
 
Forrester listed his entire model in his book, which made it easy for other researcher to reproduce his results.  Many people have done so using a variety of different tools.  Whereas the original model had been coded in <font color=red><b>Dynamo</b></font>, a rather clumsy and old-fashioned alphanumerical M&S environment, the most popular tool for coding System Dynamics models today is <font color=red><b>STELLA</b></font>. <p>
 
In this library, we offer a <font color=red><b>Modelica</b></font> implementation of Forrester's <font color=red><b>WORLD2</b></font> model. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Forrester, J.W. (1971), <a href=\"http://www.amazon.com/World-Dynamics-Jay-W-Forrester/dp/1883823382/ref=ed_oe_h/103-2487145-1208659\">World Dynamics</a>, Pegasus Communications, 160p.
</ol> <p>
 
<hr> <p>
</html>", revisions = ""),
        Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {160, 160, 160}), Text(lineColor = {0, 0, 255}, extent = {{-80, 90}, {76, 36}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "WORLD2"), Text(lineColor = {0, 0, 255}, extent = {{-73.9, 25.05}, {72, -18}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "world model as proposed"), Text(lineColor = {0, 0, 255}, extent = {{-65.8, 38.1}, {64, 12}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "describes the original"), Text(lineColor = {0, 0, 255}, extent = {{-77.7, -14.85}, {82, -64}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "his book World Dynamics."), Text(lineColor = {0, 0, 255}, extent = {{-61.6, -4.8}, {56, -31}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "by Jay Forrester in")}));
    end World2;

    package World3 "Meadows' World Model (2004 Edition)"
      extends Modelica.Icons.Example;

      block Arable_Land_Dynamics "Arable land dynamics"
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real t_land_life_time(unit = "yr") = 4000 "Land life time";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        SystemDynamics.Rates.RRate Land_Devel_Rt "p.289 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-27.0, 0.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Levels.Level2b Arable_Land(x0 = arable_land_init) "p.279 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {35.0, 0.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Land_Rem_Urb_Ind_Use "p.322 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {106.0, 6.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Land_Erosion_Rt "p.318 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {65.0, -40.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 90)));
        SystemDynamics.Sources.Sink sink annotation(
          Placement(visible = true, transformation(origin = {65.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Levels.Level1b Pot_Arable_Land(x0 = pot_arable_land_init) "p.279 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-82.5489, 0.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Levels.Level1a Urban_Ind_Land(x0 = urban_ind_land_init) "p.322 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {164.0, 6.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Land_Devel_Rt Land_Dev_Rt "p.289 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-27.0, -38.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Land_Rem_Urb_Ind_Use Land_Rem_UI_Use(urb_ind_land_dev_time = urb_ind_land_dev_time) "p.322 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {104.0827, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        Modelica.Blocks.Math.Division Land_Er_Rt "p.318 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {30.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Avg_Life_Land(k = avg_life_land_norm) "p.316 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, -73.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular Dev_Cost_Per_Hect(x_vals = 0.0:0.1:1.0, y_vals = {100000, 7400, 5200, 3500, 2400, 1500, 750, 300, 150, 75, 50}) "p.291 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-78.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Gain1(k = 1 / pot_arable_land_tot) "p.291 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-130.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Marg_Prod_Land_Dev Marg_Prod_Land_Dev(social_discount = social_discount) "p.312 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-18.0827, 83.8496}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Fr_Inp_Al_Land_Dev(x_vals = 0.0:0.25:2.0, y_vals = {0.0, 0.05, 0.15, 0.3, 0.5, 0.7, 0.85, 0.95, 1.0}) "p.311 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {67.0, 78.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Div1 "p.311 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {30.0, 78.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Land_Fr_Cult(k = 1 / pot_arable_land_tot) "p.278 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {35.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Urb_Ind_Land_Req "p.321 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {100.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Urb_Ind_Land_PC(x_vals = 0:200:1600, y_vals = {0.005, 0.008, 0.015, 0.025, 0.04, 0.055, 0.07, 0.08, 0.09}) "p.321 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {60.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Land_Life_Mlt_Yield S_Land_Life_Mlt_Yield(t_land_life_time = t_land_life_time) "p.317 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-34.0, -98.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Land_Life_Mlt_Yield_1(y_vals = {1.2, 1.0, 0.63, 0.36, 0.16, 0.055, 0.04, 0.025, 0.015, 0.01, 0.01}, x_vals = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 50}) "p.317 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -76.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Land_Life_Mlt_Yield_2(y_vals = {1.2, 1.0, 0.63, 0.36, 0.29, 0.26, 0.24, 0.22, 0.21, 0.2, 0.2}, x_vals = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 50}) "p.318 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -104.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Gain2(k = 1 / inherent_land_fert) "p.317 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-157.0, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort land_yield(unit = "kg/(hectare.yr)") "Land yield" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort marg_prod_agr_inp(unit = "kg/dollar") "Development of marginally producing land" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ind_out_pc "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort tot_agric_invest(unit = "dollar/yr") "Total investment in the agricultural sector" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort arable_land(unit = "hectare") "Arable land" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort urban_ind_land(unit = "hectare") "Land occupied by human dwellings and industry" annotation(
          Placement(visible = true, transformation(origin = {210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort fr_inp_al_land_dev "Fraction of capital invested in agriculture allocated to the devlopment of arable land" annotation(
          Placement(visible = true, transformation(origin = {210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Fr_Inp_Al_Land_Dev.y, fr_inp_al_land_dev) annotation(
          Line(visible = true, points = {{78.0, 78.0}, {180.0, 78.0}, {180.0, 50.0}, {210.0, 50.0}}, color = {0, 0, 191}));
        connect(Fr_Inp_Al_Land_Dev.u, Div1.y) annotation(
          Line(visible = true, origin = {50.0, 78.0}, points = {{9.0, 0.0}, {-9.0, 0.0}}, color = {0, 0, 191}));
        connect(Fr_Inp_Al_Land_Dev.y, Land_Dev_Rt.u2) annotation(
          Line(visible = true, points = {{78.0, 78.0}, {100.0, 78.0}, {100.0, 60.0}, {-8.0, 60.0}, {-8.0, -60.0}, {-27.0, -60.0}, {-27.0, -47.0}}, color = {0, 0, 191}));
        connect(Div1.u2, marg_prod_agr_inp) annotation(
          Line(visible = true, points = {{18.0, 72.0}, {-20.0, 72.0}, {-20.0, 50.0}, {-210.0, 50.0}}, color = {0, 0, 191}));
        connect(Marg_Prod_Land_Dev.y, Div1.u1) annotation(
          Line(visible = true, origin = {9.7293, 83.9248}, points = {{-18.812, -0.0752}, {5.2707, -0.0752}, {5.2707, 0.0752}, {8.2707, 0.0752}}, color = {0, 0, 191}));
        connect(Marg_Prod_Land_Dev.u1, land_yield) annotation(
          Line(visible = true, points = {{-27.0827, 87.8496}, {-46.0, 87.8496}, {-46.0, 110.0}, {-210.0, 110.0}}, color = {0, 0, 191}));
        connect(Dev_Cost_Per_Hect.y, Marg_Prod_Land_Dev.u2) annotation(
          Line(visible = true, origin = {-39.062, 79.9248}, points = {{-27.938, 0.0752}, {7.9793, 0.0752}, {7.9793, -0.0752}, {11.9793, -0.0752}}, color = {0, 0, 191}));
        connect(Gain1.y, Dev_Cost_Per_Hect.u) annotation(
          Line(visible = true, origin = {-102.5, 80.0}, points = {{-16.5, 0.0}, {16.5, 0.0}}, color = {0, 0, 191}));
        connect(Dev_Cost_Per_Hect.y, Land_Dev_Rt.u1) annotation(
          Line(visible = true, points = {{-67.0, 80.0}, {-46.0, 80.0}, {-46.0, -60.0}, {-33.0, -60.0}, {-33.0, -47.0}}, color = {0, 0, 191}));
        connect(Gain1.u, Pot_Arable_Land.y) annotation(
          Line(visible = true, points = {{-142.0, 80.0}, {-170.0, 80.0}, {-170.0, 8.25}, {-103.5326, 8.25}, {-95.2989, 8.25}}, color = {0, 0, 191}));
        connect(Land_Fr_Cult.u, Arable_Land.y) annotation(
          Line(visible = true, points = {{23.0, 40.0}, {0.0, 40.0}, {0.0, 8.25}, {22.25, 8.25}}, color = {0, 0, 191}));
        connect(arable_land, Arable_Land.y1) annotation(
          Line(visible = true, points = {{210.0, -10.0}, {190.0, -10.0}, {190.0, 30.0}, {70.0, 30.0}, {70.0, -17.6389}, {46.25, -17.6389}, {46.25, -9.75}}, color = {0, 0, 191}));
        connect(Land_Er_Rt.u1, Arable_Land.y2) annotation(
          Line(visible = true, points = {{18.0, -34.0}, {10.0, -34.0}, {10.0, -18.0223}, {35.0, -18.0223}, {35.0, -9.75}}, color = {0, 0, 191}));
        connect(Land_Rem_Urb_Ind_Use.y, Arable_Land.u2) annotation(
          Line(visible = true, points = {{98.5, 6.0}, {53.8, 6.0}, {51.5, 6.0}}, color = {95, 0, 191}));
        connect(Land_Erosion_Rt.y, Arable_Land.u3) annotation(
          Line(visible = true, points = {{65.0, -47.5}, {65.0, -6.4}, {51.5, -6.0}}, color = {95, 0, 191}));
        connect(Land_Devel_Rt.y1, Arable_Land.u1) annotation(
          Line(visible = true, points = {{-19.5, 0.0}, {-10.0, 0.0}, {-10.0, 0.0}, {18.5, 0.0}}, color = {95, 0, 191}));
        connect(Land_Dev_Rt.y, Land_Devel_Rt.u) annotation(
          Line(visible = true, origin = {-27.0, -22.375}, points = {{0.0, -6.625}, {0.0, 6.625}}, color = {0, 0, 191}));
        connect(Pot_Arable_Land.u1, Land_Devel_Rt.y) annotation(
          Line(visible = true, points = {{-66.0489, 0.0}, {-50.0, 0.0}, {-50.0, 0.0}, {-34.5, 0.0}}, color = {95, 0, 191}));
        connect(P_Land_Life_Mlt_Yield_1.y, S_Land_Life_Mlt_Yield.u1) annotation(
          Line(visible = true, points = {{-89.0, -76.0}, {-64.0, -76.0}, {-64.0, -92.0}, {-64.0, -94.0}, {-60.0, -94.0}, {-43.0, -94.0}}, color = {0, 0, 191}));
        connect(P_Land_Life_Mlt_Yield_2.y, S_Land_Life_Mlt_Yield.u2) annotation(
          Line(visible = true, points = {{-89.0, -104.0}, {-64.0, -104.0}, {-64.0, -102.0}, {-43.0, -102.0}}, color = {0, 0, 191}));
        connect(Gain2.u, land_yield) annotation(
          Line(visible = true, points = {{-169.0, -90.0}, {-186.0, -90.0}, {-186.0, 110.0}, {-210.0, 110.0}}, color = {0, 0, 191}));
        connect(Gain2.y, P_Land_Life_Mlt_Yield_2.u) annotation(
          Line(visible = true, points = {{-146.0, -90.0}, {-130.0, -90.0}, {-130.0, -104.0}, {-108.0, -104.0}}, color = {0, 0, 191}));
        connect(Gain2.y, P_Land_Life_Mlt_Yield_1.u) annotation(
          Line(visible = true, points = {{-146.0, -90.0}, {-130.0, -90.0}, {-130.0, -76.0}, {-108.0, -76.0}}, color = {0, 0, 191}));
        connect(S_Land_Life_Mlt_Yield.y, Avg_Life_Land.u) annotation(
          Line(visible = true, points = {{-25.0, -98.0}, {10.0, -98.0}, {10.0, -61.0}}, color = {0, 0, 191}));
        connect(Urb_Ind_Land_PC.u, ind_out_pc) annotation(
          Line(visible = true, points = {{52.0, -110.0}, {20.0, -110.0}, {20.0, -120.0}, {-190.0, -120.0}, {-190.0, -70.0}, {-210.0, -70.0}}, color = {0, 0, 191}));
        connect(Urb_Ind_Land_PC.y, Urb_Ind_Land_Req.u1) annotation(
          Line(visible = true, origin = {82.0, -110.0}, points = {{-11.0, 0.0}, {11.0, 0.0}}, color = {0, 0, 191}));
        connect(Urb_Ind_Land_Req.u2, population) annotation(
          Line(visible = true, points = {{107.0, -110.0}, {120.0, -110.0}, {120.0, -130.0}, {-210.0, -130.0}}, color = {0, 0, 191}));
        connect(Urb_Ind_Land_Req.y, Land_Rem_UI_Use.u1) annotation(
          Line(visible = true, points = {{100.0, -103.0}, {100.0, -54.4}, {100.0827, -49.0}}, color = {0, 0, 191}));
        connect(sink.MassInPort1, Land_Erosion_Rt.y1) annotation(
          Line(visible = true, points = {{65.0, -59.0}, {65.0, -32.5}}, color = {95, 0, 191}));
        connect(Land_Er_Rt.u2, Avg_Life_Land.y) annotation(
          Line(visible = true, points = {{18.0, -46.0}, {10.0, -46.0}, {10.0, -84.0}}, color = {0, 0, 191}));
        connect(urban_ind_land, Urban_Ind_Land.y2) annotation(
          Line(visible = true, points = {{210.0, -70.0}, {175.25, -70.0}, {175.25, -3.75}}, color = {0, 0, 191}));
        connect(Land_Rem_UI_Use.u2, Urban_Ind_Land.y4) annotation(
          Line(visible = true, points = {{108.0827, -49.0}, {108.0827, -70.0}, {152.75, -70.0}, {152.75, -3.75}}, color = {0, 0, 191}));
        connect(Urban_Ind_Land.u1, Land_Rem_Urb_Ind_Use.y1) annotation(
          Line(visible = true, origin = {130.5, 6.0}, points = {{17.0, 0.0}, {-17.0, 0.0}}, color = {95, 0, 191}));
        connect(Land_Rem_UI_Use.y, Land_Rem_Urb_Ind_Use.u) annotation(
          Line(visible = true, origin = {105.0414, -16.5625}, points = {{-0.9586, -14.4375}, {-0.9586, 3.8125}, {0.9586, 3.8125}, {0.9586, 6.8125}}, color = {0, 0, 191}));
        connect(Land_Er_Rt.y, Land_Erosion_Rt.u) annotation(
          Line(visible = true, points = {{41.0, -40.0}, {80.75, -40.0}}, color = {0, 0, 191}));
        connect(tot_agric_invest, Land_Dev_Rt.u3) annotation(
          Line(visible = true, points = {{-210.0, -10.0}, {-170.0, -10.0}, {-170.0, -50.0}, {-60.0, -50.0}, {-60.0, -70.0}, {-21.0, -70.0}, {-21.0, -47.0}}, color = {0, 0, 191}));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 50.0}, fillPattern = FillPattern.Solid, extent = {{-73.6862, -36.6918}, {73.6862, 36.6918}}, textString = "Arable", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {0.0, -50.0}, fillPattern = FillPattern.Solid, extent = {{-87.9194, -20.8986}, {87.9194, 20.8986}}, textString = "Dynamics", fontSize = 102.0, fontName = "Arial"), Text(visible = true, fillPattern = FillPattern.Solid, extent = {{-72.1931, -36.6918}, {72.1931, 36.6918}}, textString = "Land", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-47.0, 79.0}, {-45.0, 81.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-131.0, -91.0}, {-129.0, -89.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-187.0, 109.0}, {-185.0, 111.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{99.0, 77.0}, {101.0, 79.0}})}),
          Documentation(info = "<html>
This model quantifies the land that is being used to produce food, i.e., the arable land.  The model contains three state variables, representing the potential arable land, i.e., land that could be developed to grow crop, but so far hasn't been developed; the arable land that is currently being used for agriculture; and finally, the land that is being used for urban development and industry (including mining).  Some of the potential arable land is getting developed over time, whereas some of the arable land is being lost either to urban development or to erosion. <p>
 
The arable land is measured in units of hectares.
</html>"));
      end Arable_Land_Dynamics;

      block Food_Production "Food production"
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2 "Controlled average life of agricultural input";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        SystemDynamics.Interfaces.MassInPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Indic_Food_PC_1(x_vals = 0:200:1600, y_vals = {230, 480, 690, 850, 970, 1070, 1150, 1210, 1250}) "p.286 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-142.0, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Indic_Food_PC_2(x_vals = 0:200:1600, y_vals = {230, 480, 690, 850, 970, 1070, 1150, 1210, 1250}) "p.286 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-142.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Indic_Food_PC S_Indic_Food_PC(t_policy_year = t_policy_year) "p.286 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-79.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Fr_IO_Al_Agr_1(x_vals = 0:0.5:2.5, y_vals = {0.4, 0.2, 0.1, 0.025, 0, 0}) "p.287 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {18.0, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Div1 annotation(
          Placement(visible = true, transformation(origin = {-30.0, -104.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Fr_IO_Al_Agr_2(x_vals = 0:0.5:2.5, y_vals = {0.4, 0.2, 0.1, 0.025, 0, 0}) "p.287 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {18.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_FIOA_Agr S_FIOA_Agr(t_policy_year = t_policy_year) "p.287 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {76.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Tot_Agric_Invest "p.287 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {120.0, -110.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort industrial_output(unit = "dollar/yr") "Annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-150.0, 10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Chg_Agr_Inp annotation(
          Placement(visible = true, transformation(origin = {-100.0, 10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Levels.Level1a Agr_Inp(x0 = agr_inp_init) annotation(
          Placement(visible = true, transformation(origin = {-40.0, 10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Ch_Agr_Inp Ch_Agr_Inp "p.292 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -26.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Current_Agr_Inp Current_Agr_Inp "p.292 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-141.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort fr_inp_al_land_dev "Fraction of capital invested in agriculture allocated to the devlopment of arable land" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Avg_Life_Agr_Inp S_Avg_Life_Agr_Inp(t_policy_year = t_policy_year, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2) "p.293 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, -50.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Fr_Inp_For_Land_Maint(x_vals = 0:4, y_vals = {0, 0.04, 0.07, 0.09, 0.1}) "p.332 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-126.5, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source2 annotation(
          Placement(visible = true, transformation(origin = {-40.0, 90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Chg_Perc_Food_Ratio annotation(
          Placement(visible = true, transformation(origin = {10.0, 90.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Levels.Level1a Perc_Food_Ratio(x0 = perc_food_ratio_init) annotation(
          Placement(visible = true, transformation(origin = {60.0, 90.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Agr_Inp_Per_Hect Agr_Inp_Per_Hect "p.294 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-53.3528, 44.0583}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort arable_land(unit = "hectare") "Arable land" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Marg_Land_Yield_Mlt_Cap(y_vals = {0.075, 0.03, 0.015, 0.011, 0.009, 0.008, 0.007, 0.006, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005}, x_vals = {0, 40, 80, 120, 160, 200, 240, 280, 320, 360, 400, 440, 480, 520, 560, 600, 10000}) "p.313 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {23.5, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Land_Yield_Mlt_Cap(y_vals = {1, 3, 4.5, 5, 5.3, 5.6, 5.9, 6.1, 6.35, 6.6, 6.9, 7.2, 7.4, 7.6, 7.8, 8, 8.2, 8.4, 8.6, 8.8, 9, 9.2, 9.4, 9.6, 9.8, 10, 10}, x_vals = {0, 40, 80, 120, 160, 200, 240, 280, 320, 360, 400, 440, 480, 520, 560, 600, 640, 680, 720, 760, 800, 840, 880, 920, 960, 1000, 10000}) "p.306 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {21.5, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_4 Land_Yield "p.307 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {90.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.WorldDynamics.World3.Utilities.Marg_Prod_Agr_Inp Marg_Prod_Agr_Inp "p.313 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {160.0, -5.9417}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort marg_prod_agr_inp(unit = "kg/dollar") "Development of marginally producing land" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort land_yield(unit = "kg/(hectare.yr)") "Land yield" annotation(
          Placement(visible = true, transformation(origin = {210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Food Food(land_fr_harvested = land_fr_harvested, processing_loss = processing_loss) "p.280 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-158.0, 100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Food_PC "p.281 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-126.0, 94.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Food_Ratio(k = 1 / subsist_food_pc) "p.332 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-83.0, 94.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Ch_Perc_Food_Ratio Ch_Perc_Food_Ratio(food_short_perc_del = food_short_perc_del) "p.333 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {121.825, 106.9111}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Land_Yield_Fact S_Land_Yield_Fact(t_policy_year = t_policy_year, p_land_yield_fact_1 = p_land_yield_fact_1) "p.307 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {115.0, 50.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH3 P_Land_Yield_Fact_2(averaging_time(unit = "yr") = tech_dev_del_TDD) annotation(
          Placement(visible = true, transformation(origin = {157.0, 50.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort yield_tech_LYTD "Technology induced absolute yield enhancement" annotation(
          Placement(visible = true, transformation(origin = {-170.0, 150.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 90), iconTransformation(origin = {-60.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Interfaces.MassInPort land_fertility(unit = "kg/(hectare.yr)") "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {-170.0, -170.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90), iconTransformation(origin = {-60.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassInPort s_yield_mlt_air_poll "Land yield multiplier from air pollution" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -170.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90), iconTransformation(origin = {-20.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassOutPort food_ratio "Food ratio" annotation(
          Placement(visible = true, transformation(origin = {210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort tot_agric_invest(unit = "dollar/yr") "Total investment in the agricultural sector" annotation(
          Placement(visible = true, transformation(origin = {170.0, 150.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90), iconTransformation(origin = {60.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassOutPort agr_inp_per_hect(unit = "dollar/(hectare.yr)") "Agricultural investments per hectare" annotation(
          Placement(visible = true, transformation(origin = {210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort s_fioa_agr "Fraction of total investments allocated to the agricultural sector" annotation(
          Placement(visible = true, transformation(origin = {210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort p_fr_inp_for_land_maint "Fraction of investments in the agricultural sector allocated to land maintenance" annotation(
          Placement(visible = true, transformation(origin = {170.0, -170.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 90), iconTransformation(origin = {60.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular Yield_Tech_Mult_Icor_COYM(y_vals = {1, 1, 1.05, 1.12, 1.25, 1.35, 1.5, 1.5}, x_vals = {0, 1, 1.2, 1.4, 1.6, 1.8, 2, 50}) annotation(
          Placement(visible = true, transformation(origin = {50.0, 50.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort yield_tech_mult_icor_COYM "Technology induced relative enhancement of land yield" annotation(
          Placement(visible = true, transformation(origin = {110.0, -170.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 90), iconTransformation(origin = {20.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Interfaces.MassOutPort food_pc(unit = "kg/yr") "Per capita annually consumed food" annotation(
          Placement(visible = true, transformation(origin = {110.0, 150.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90), iconTransformation(origin = {20.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
      equation
        connect(Marg_Prod_Agr_Inp.y, marg_prod_agr_inp) annotation(
          Line(visible = true, points = {{169.0, -5.9417}, {190.0, -5.9417}, {190.0, -10.0}, {210.0, -10.0}}, color = {0, 0, 191}));
        connect(S_FIOA_Agr.u1, P_Fr_IO_Al_Agr_1.y) annotation(
          Line(visible = true, points = {{67.0, -106.0}, {54.0, -106.0}, {54.0, -90.0}, {29.0, -90.0}}, color = {0, 0, 191}));
        connect(S_FIOA_Agr.u2, P_Fr_IO_Al_Agr_2.y) annotation(
          Line(visible = true, points = {{67.0, -114.0}, {54.0, -114.0}, {54.0, -130.0}, {29.0, -130.0}}, color = {0, 0, 191}));
        connect(S_Indic_Food_PC.u2, P_Indic_Food_PC_2.y) annotation(
          Line(visible = true, points = {{-88.0, -114.0}, {-106.0, -114.0}, {-106.0, -130.0}, {-131.0, -130.0}}, color = {0, 0, 191}));
        connect(S_Indic_Food_PC.u1, P_Indic_Food_PC_1.y) annotation(
          Line(visible = true, points = {{-88.0, -106.0}, {-106.0, -106.0}, {-106.0, -90.0}, {-131.0, -90.0}}, color = {0, 0, 191}));
        connect(Tot_Agric_Invest.y, Current_Agr_Inp.u2) annotation(
          Line(visible = true, points = {{120.0, -101.6}, {120.0, -64.0}, {-168.0, -64.0}, {-168.0, -54.0}, {-150.0, -54.0}}, color = {0, 0, 191}));
        connect(Current_Agr_Inp.u1, fr_inp_al_land_dev) annotation(
          Line(visible = true, points = {{-150.0, -46.0}, {-180.0, -46.0}, {-180.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}));
        connect(Ch_Agr_Inp.u3, Agr_Inp.y4) annotation(
          Line(visible = true, points = {{-94.0, -35.0}, {-94.0, -50.0}, {-51.25, -50.0}, {-51.25, -5.9972}, {-51.25, 0.25}}, color = {0, 0, 191}));
        connect(Agr_Inp_Per_Hect.u3, Agr_Inp.y) annotation(
          Line(visible = true, points = {{-62.3528, 38.0583}, {-76.0, 38.0583}, {-76.0, 20.0}, {-76.0, 18.25}, {-52.75, 18.25}}, color = {0, 0, 191}));
        connect(Marg_Land_Yield_Mlt_Cap.u, Agr_Inp_Per_Hect.y) annotation(
          Line(visible = true, points = {{15.5, -10.0}, {-10.0, -10.0}, {-10.0, 44.0583}, {-44.3528, 44.0583}}, color = {0, 0, 191}));
        connect(Land_Yield_Mlt_Cap.u, Agr_Inp_Per_Hect.y) annotation(
          Line(visible = true, points = {{13.5, 20.0}, {-10.0, 20.0}, {-10.0, 44.0583}, {-44.3528, 44.0583}}, color = {0, 0, 191}));
        connect(arable_land, Agr_Inp_Per_Hect.u2) annotation(
          Line(visible = true, points = {{-210.0, 50.0}, {-180.0, 50.0}, {-180.0, 30.0}, {-90.0, 30.0}, {-90.0, 44.0583}, {-62.3528, 44.0583}}, color = {0, 0, 191}));
        connect(Agr_Inp_Per_Hect.u1, P_Fr_Inp_For_Land_Maint.y) annotation(
          Line(visible = true, points = {{-62.3528, 50.0583}, {-78.95, 50.2}, {-78.95, 50.0}, {-115.5, 50.0}}, color = {0, 0, 191}));
        connect(S_FIOA_Agr.y, s_fioa_agr) annotation(
          Line(visible = true, points = {{85.0, -110.0}, {100.0, -110.0}, {100.0, -130.0}, {210.0, -130.0}}, color = {0, 0, 191}));
        connect(Tot_Agric_Invest.u1, S_FIOA_Agr.y) annotation(
          Line(visible = true, origin = {98.3, -110.0}, points = {{13.3, 0.0}, {-13.3, 0.0}}, color = {0, 0, 191}));
        connect(P_Fr_IO_Al_Agr_2.u, Div1.y) annotation(
          Line(visible = true, points = {{10.0, -130.0}, {-10.0, -130.0}, {-10.0, -104.0}, {-19.0, -104.0}}, color = {0, 0, 191}));
        connect(P_Fr_IO_Al_Agr_1.u, Div1.y) annotation(
          Line(visible = true, points = {{10.0, -90.0}, {-10.0, -90.0}, {-10.0, -104.0}, {-19.0, -104.0}}, color = {0, 0, 191}));
        connect(Div1.u2, S_Indic_Food_PC.y) annotation(
          Line(visible = true, origin = {-56.0, -110.0}, points = {{14.0, 0.0}, {-14.0, 0.0}}, color = {0, 0, 191}));
        connect(P_Indic_Food_PC_2.u, ind_out_pc) annotation(
          Line(visible = true, points = {{-150.0, -130.0}, {-180.0, -130.0}, {-180.0, -70.0}, {-210.0, -70.0}}, color = {0, 0, 191}));
        connect(P_Indic_Food_PC_1.u, ind_out_pc) annotation(
          Line(visible = true, points = {{-150.0, -90.0}, {-180.0, -90.0}, {-180.0, -70.0}, {-210.0, -70.0}}, color = {0, 0, 191}));
        connect(S_Avg_Life_Agr_Inp.y, Marg_Prod_Agr_Inp.u4) annotation(
          Line(visible = true, points = {{-9.0, -50.0}, {-40.0, -50.0}, {-40.0, -30.0}, {110.0, -30.0}, {110.0, -11.9417}, {151.0, -11.9417}}, color = {0, 0, 191}));
        connect(S_Avg_Life_Agr_Inp.y, Ch_Agr_Inp.u2) annotation(
          Line(visible = true, points = {{-9.0, -50.0}, {-40.0, -50.0}, {-40.0, -60.0}, {-100.0, -60.0}, {-100.0, -35.0}}, color = {0, 0, 191}));
        connect(Current_Agr_Inp.y, Ch_Agr_Inp.u1) annotation(
          Line(visible = true, origin = {-114.6667, -45.0}, points = {{-17.3333, -5.0}, {8.6667, -5.0}, {8.6667, 10.0}}, color = {0, 0, 191}));
        connect(Ch_Agr_Inp.y, Chg_Agr_Inp.u) annotation(
          Line(visible = true, origin = {-100.0, -11.375}, points = {{0.0, -5.625}, {0.0, 5.625}}, color = {0, 0, 191}));
        connect(Source1.MassInPort1, Chg_Agr_Inp.y) annotation(
          Line(visible = true, origin = {-123.25, 10.0}, points = {{-15.75, 0.0}, {15.75, 0.0}}, color = {95, 0, 191}));
        connect(Chg_Agr_Inp.y1, Agr_Inp.u1) annotation(
          Line(visible = true, origin = {-74.5, 10.0}, points = {{-18.0, 0.0}, {18.0, 0.0}}, color = {95, 0, 191}));
        connect(Marg_Land_Yield_Mlt_Cap.u, agr_inp_per_hect) annotation(
          Line(visible = true, points = {{15.5, -10.0}, {-10.0, -10.0}, {-10.0, -26.0}, {166.0, -26.0}, {166.0, -70.0}, {210.0, -70.0}}, color = {0, 0, 191}));
        connect(Marg_Land_Yield_Mlt_Cap.y, Marg_Prod_Agr_Inp.u3) annotation(
          Line(visible = true, points = {{34.5, -10.0}, {98.675, -10.0}, {98.675, -7.9417}, {151.0, -7.9417}}, color = {0, 0, 191}));
        connect(Land_Yield.y, Marg_Prod_Agr_Inp.u1) annotation(
          Line(visible = true, points = {{97.0, 30.0}, {130.0, 30.0}, {130.0, 0.0}, {151.0, 0.0583}}, color = {0, 0, 191}));
        connect(Land_Yield_Mlt_Cap.y, Marg_Prod_Agr_Inp.u2) annotation(
          Line(visible = true, points = {{32.5, 20.0}, {64.0, 20.0}, {64.0, -4.0}, {151.0, -3.9417}}, color = {0, 0, 191}));
        connect(Land_Yield.u3, s_yield_mlt_air_poll) annotation(
          Line(visible = true, points = {{84.4, 26.0}, {76.0, 26.0}, {76.0, -40.0}, {160.0, -40.0}, {160.0, -152.0}, {-110.0, -152.0}, {-110.0, -170.0}}, color = {0, 0, 191}));
        connect(Land_Yield.u2, land_fertility) annotation(
          Line(visible = true, points = {{84.4, 34.0}, {70.0, 34.0}, {70.0, -46.0}, {154.0, -46.0}, {154.0, -148.0}, {-170.0, -148.0}, {-170.0, -170.0}}, color = {0, 0, 191}));
        connect(Ch_Perc_Food_Ratio.y, Chg_Perc_Food_Ratio.u) annotation(
          Line(visible = true, points = {{130.825, 106.9111}, {160.0, 106.9111}, {160.0, 68.0}, {10.0, 68.0}, {10.0, 74.25}}, color = {0, 0, 191}));
        connect(Perc_Food_Ratio.y1, Ch_Perc_Food_Ratio.u2) annotation(
          Line(visible = true, points = {{72.75, 98.25}, {90.0, 98.25}, {90.0, 102.9111}, {112.825, 102.9111}}, color = {95, 0, 191}));
        connect(Food_Ratio.y, Ch_Perc_Food_Ratio.u1) annotation(
          Line(visible = true, points = {{-72.0, 94.0}, {-60.0, 94.0}, {-60.0, 111.0}, {90.0, 111.0}, {95.9556, 111.0}, {112.825, 110.9111}}, color = {0, 0, 191}));
        connect(P_Fr_Inp_For_Land_Maint.u, Perc_Food_Ratio.y) annotation(
          Line(visible = true, points = {{-134.5, 50.0}, {-162.0, 50.0}, {-162.0, 72.0}, {-52.0, 72.0}, {-52.0, 106.0}, {40.0, 106.0}, {40.0, 98.25}, {47.25, 98.25}}, color = {0, 0, 191}));
        connect(Chg_Perc_Food_Ratio.y1, Perc_Food_Ratio.u1) annotation(
          Line(visible = true, origin = {30.5, 90.0}, points = {{-13.0, 0.0}, {13.0, 0.0}}, color = {95, 0, 191}));
        connect(Land_Yield.y, Food.u1) annotation(
          Line(visible = true, points = {{97.0, 30.0}, {180.0, 30.0}, {180.0, 124.0}, {-180.0, 124.0}, {-180.0, 104.0}, {-167.0, 104.0}}, color = {0, 0, 191}));
        connect(Food.u2, arable_land) annotation(
          Line(visible = true, points = {{-167.0, 96.0}, {-180.0, 96.0}, {-180.0, 50.0}, {-210.0, 50.0}}, color = {0, 0, 191}));
        connect(Land_Yield.u4, Land_Yield_Mlt_Cap.y) annotation(
          Line(visible = true, points = {{90.0, 23.0}, {90.0, -4.0}, {64.0, -4.0}, {64.0, 20.0}, {32.5, 20.0}}, color = {0, 0, 191}));
        connect(S_Land_Yield_Fact.y, Land_Yield.u1) annotation(
          Line(visible = true, points = {{106.0, 50.0}, {90.0, 50.0}, {90.0, 37.0}}, color = {0, 0, 191}));
        connect(Land_Yield.y, land_yield) annotation(
          Line(visible = true, points = {{97.0, 30.0}, {180.0, 30.0}, {180.0, 50.0}, {210.0, 50.0}}, color = {0, 0, 191}));
        connect(P_Land_Yield_Fact_2.u, yield_tech_LYTD) annotation(
          Line(visible = true, points = {{168.0, 50.0}, {176.0, 50.0}, {176.0, 128.0}, {-170.0, 128.0}, {-170.0, 150.0}}, color = {0, 0, 191}));
        connect(P_Land_Yield_Fact_2.y, S_Land_Yield_Fact.u) annotation(
          Line(visible = true, origin = {135.0, 50.0}, points = {{11.0, 0.0}, {-11.0, 0.0}}, color = {0, 0, 191}));
        connect(S_Land_Yield_Fact.y, Yield_Tech_Mult_Icor_COYM.u) annotation(
          Line(visible = true, origin = {82.0, 50.0}, points = {{24.0, -0.0}, {-24.0, 0.0}}, color = {0, 0, 191}));
        connect(Yield_Tech_Mult_Icor_COYM.y, yield_tech_mult_icor_COYM) annotation(
          Line(visible = true, points = {{39.0, 50.0}, {-14.0, 50.0}, {-14.0, -24.0}, {106.0, -24.0}, {106.0, -140.0}, {110.0, -140.0}, {110.0, -170.0}}, color = {0, 0, 191}));
        connect(P_Fr_Inp_For_Land_Maint.y, p_fr_inp_for_land_maint) annotation(
          Line(visible = true, points = {{-115.5, 50.0}, {-80.0, 50.0}, {-80.0, -56.0}, {-50.0, -56.0}, {-50.0, -156.0}, {170.0, -156.0}, {170.0, -170.0}}, color = {0, 0, 191}));
        connect(Source2.MassInPort1, Chg_Perc_Food_Ratio.y) annotation(
          Line(visible = true, origin = {-13.25, 90.0}, points = {{-15.75, 0.0}, {15.75, 0.0}}, color = {95, 0, 191}));
        connect(Food_Ratio.y, food_ratio) annotation(
          Line(visible = true, points = {{-72.0, 94.0}, {-60.0, 94.0}, {-60.0, 132.0}, {184.0, 132.0}, {184.0, 110.0}, {210.0, 110.0}}, color = {0, 0, 191}));
        connect(Food_Ratio.u, Food_PC.y) annotation(
          Line(visible = true, origin = {-105.0, 94.0}, points = {{10.0, 0.0}, {-10.0, 0.0}}, color = {0, 0, 191}));
        connect(Food_PC.u1, Food.y) annotation(
          Line(visible = true, origin = {-143.5, 100.0}, points = {{5.5, 0.0}, {-5.5, 0.0}}, color = {0, 0, 191}));
        connect(Tot_Agric_Invest.u2, industrial_output) annotation(
          Line(points = {{128.4, -110.0}, {140.0, -110.0}, {140.0, -144.0}, {-190.0, -144.0}, {-190.0, -130.0}, {-210.0, -130.0}}, color = {0, 0, 191}, visible = true));
        connect(population, Food_PC.u2) annotation(
          Line(points = {{-210.0, 110.0}, {-190.0, 110.0}, {-190.0, 80.0}, {-146.0, 80.0}, {-146.0, 88.0}, {-138.0, 88.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_PC.y, Div1.u1) annotation(
          Line(points = {{-115.0, 94.0}, {-110.0, 94.0}, {-110.0, 76.0}, {-174.0, 76.0}, {-174.0, -68.0}, {-46.0, -68.0}, {-46.0, -98.0}, {-42.0, -98.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_PC.y, food_pc) annotation(
          Line(points = {{-115.0, 94.0}, {-110.0, 94.0}, {-110.0, 136.0}, {110.0, 136.0}, {110.0, 150.0}}, color = {0, 0, 191}, visible = true));
        connect(Tot_Agric_Invest.y, tot_agric_invest) annotation(
          Line(points = {{120.0, -101.6}, {120.0, -64.0}, {194.0, -64.0}, {194.0, 136.0}, {170.0, 136.0}, {170.0, 150.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 30.0}, fillPattern = FillPattern.Solid, extent = {{-47.3724, -36.6918}, {47.3724, 36.6918}}, textString = "Food", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {0.0, -30.0}, fillPattern = FillPattern.Solid, extent = {{-95.13, -24.9532}, {95.13, 24.9532}}, textString = "Production", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-181.0, -91.0}, {-179.0, -89.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-11.0, -105.0}, {-9.0, -103.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-11.0, 19.0}, {-9.0, 21.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-41.0, -51.0}, {-39.0, -49.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{89.0, -5.0}, {91.0, -3.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-181.0, 49.0}, {-179.0, 51.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-111.0, 93.0}, {-109.0, 95.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{179.0, 49.0}, {181.0, 51.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{129.0, 29.0}, {131.0, 31.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-61.0, 110.0}, {-59.0, 112.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{99.0, -111.0}, {101.0, -109.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-81.0, 49.0}, {-79.0, 51.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{89.0, 49.0}, {91.0, 51.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{119.0, -65.0}, {121.0, -63.0}})}),
          Documentation(info = "<html>
This model describes the production of food.  Food is a controlled variable, as farmers decide what to grow and how much to grow on the basis of their perception of what they can sell.  Consequently, the model uses the perceived food ratio as a state variable.  If the farmers decide that too much food is being produced already, they'll produce less next year, and vice versa. <p>
 
A second state variable describes the capital that is being invested in growing food.  Since that capital (for example, the capital expended in buying food harvesting machines) cannot be allocated or freed instantaneously, it makes sense to maintain also that variable as a state variable. <p>
 
The agricultural input is measured in dollars/year, whereas the food ratio is dimensionless.
</html>"));
      end Food_Production;

      block Human_Ecological_Footprint "Ecological footprint"
        SystemDynamics.Interfaces.MassInPort urban_ind_land(unit = "hectare") "Land occupied by human dwellings and industry" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort arable_land(unit = "hectare") "Arable land" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 64.2333}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ppoll_gen_rt(unit = "1/yr") "Persistent pollution generation rate" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -58.4806}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Arable_Land_In_Gha(k = 0.000000001) annotation(
          Placement(visible = true, transformation(origin = {-31.0, 64.2333}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Urban_Land_In_Gha(k = 0.000000001) annotation(
          Placement(visible = true, transformation(origin = {-27.1694, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Absorption_Land_In_Gha annotation(
          Placement(visible = true, transformation(origin = {-20.0, -57.775}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Gha_Per_Unit_Of_Pollution(k = 0.000000004) annotation(
          Placement(visible = true, transformation(origin = {68.0, -68.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.HEF_Human_Ecological_Footprint HEF_Human_Ecological_Footprint annotation(
          Placement(visible = true, transformation(origin = {20.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort hef_human_ecological_footprint(unit = "hectare") "Ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Gha_Per_Unit_Of_Pollution.y, Absorption_Land_In_Gha.u2) annotation(
          Line(visible = true, origin = {34.7556, -45.43}, points = {{33.2444, -15.57}, {33.2444, 12.43}, {-10.7667, 12.43}, {-10.7667, -12.345}, {-47.7556, -12.345}}, color = {0, 0, 191}));
        connect(Absorption_Land_In_Gha.y, HEF_Human_Ecological_Footprint.u3) annotation(
          Line(visible = true, points = {{-20.0, -50.775}, {-20.0, -40.0}, {0.0, -40.0}, {0.0, -6.0}, {11.0, -6.0}}, color = {0, 0, 191}));
        connect(Absorption_Land_In_Gha.u1, ppoll_gen_rt) annotation(
          Line(visible = true, origin = {-82.6375, -58.1278}, points = {{55.6375, 0.3528}, {-14.1375, 0.3528}, {-14.1375, -0.3528}, {-27.3625, -0.3528}}, color = {0, 0, 191}));
        connect(Urban_Land_In_Gha.y, HEF_Human_Ecological_Footprint.u2) annotation(
          Line(visible = true, origin = {-2.5847, 0.0}, points = {{-13.5847, 0.0}, {13.5847, 0.0}}, color = {0, 0, 191}));
        connect(Urban_Land_In_Gha.u, urban_ind_land) annotation(
          Line(visible = true, origin = {-74.5847, 0.0}, points = {{35.4153, 0.0}, {-35.4153, 0.0}}, color = {0, 0, 191}));
        connect(Arable_Land_In_Gha.y, HEF_Human_Ecological_Footprint.u1) annotation(
          Line(visible = true, origin = {80.0, 3.8806}, points = {{-100.0, 60.3527}, {-80.0, 60.0}, {-80.0, 2.0}, {-69.0, 2.1194}}, color = {0, 0, 191}));
        connect(arable_land, Arable_Land_In_Gha.u) annotation(
          Line(visible = true, origin = {-76.5, 64.2333}, points = {{-33.5, 0.0}, {33.5, 0.0}}, color = {0, 0, 191}));
        connect(HEF_Human_Ecological_Footprint.y, hef_human_ecological_footprint) annotation(
          Line(points = {{-40.5, 0.0}, {40.5, 0.0}}, color = {0, 0, 191}, visible = true, origin = {69.5, 0.0}));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 50.0}, fillPattern = FillPattern.Solid, extent = {{-78.6862, -24.4985}, {78.6862, 24.4985}}, textString = "Human", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {1.7338, -49.1014}, fillPattern = FillPattern.Solid, extent = {{-96.4561, -20.8986}, {96.4561, 20.8986}}, textString = "Footprint", fontSize = 102.0, fontName = "Arial"), Text(visible = true, fillPattern = FillPattern.Solid, extent = {{-88.0175, -25.4584}, {88.0175, 25.4584}}, textString = "Ecological", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
          Documentation(info = "<html>
The <a href=\"http://www.footprintnetwork.org/gfn_sub.php?content=footprint_overview\">ecological footprint</a> is a concept developed by <a href=\"http://www.footprintnetwork.org/gfn_sub.php?content=whoweare\">Mathis Wackernagel</a> and his co-workers.  It attempts to quantify the percentage of the planet's carrying capacity being used up by humanity at any given point in time. Wackernagel showed that, since the 1980s, humanity is spending more resources per time unit than the planet can regenerate in a sustainable fashion. <p>
 
The human ecological footprint is measured in hectares per person.
</html>"));
      end Human_Ecological_Footprint;

      block Human_Fertility "Human fertility"
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 4000 "Year of continued fertility change";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 4000 "Time to zero population growth";
        SystemDynamics.Interfaces.MassInPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH1 Avg_Ind_Out_PC(averaging_time(unit = "yr") = income_expect_avg_time, smooth_init(unit = "dollar/yr") = 43.3) "p.122 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-125.0, -100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Fam_Income_Expect Fam_Income_Expect "p.122 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-65.0, -96.1504}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Fam_Resp_To_Soc_Norm(x_vals = (-0.2):0.1:0.2, y_vals = {0.5, 0.6, 0.7, 0.85, 1}) "p.122 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-4.3835, -96.1504}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH3 Del_Ind_Out_PC(averaging_time(unit = "yr") = social_adj_del, smooth_init(unit = "dollar/yr") = 0) "p.119 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-125.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Soc_Fam_Size_Norm(x_vals = 0:200:800, y_vals = {1.25, 0.94, 0.715, 0.59, 0.5}) "p.119 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-67.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Des_Compl_Fam_Size Des_Compl_Fam_Size(t_zero_pop_grow_time = t_zero_pop_grow_time, des_compl_fam_size_norm = des_compl_fam_size_norm) "p.113 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {72.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort life_expectancy(unit = "yr") "Average life expectancy of human population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH3 Perc_Life_Expectancy(averaging_time(unit = "yr") = lifet_perc_del, smooth_init(unit = "yr") = 0) "p.112 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-125.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Compl_Mlt_Perc_Lifet(x_vals = 0:10:90, y_vals = {3, 2.1, 1.6, 1.4, 1.3, 1.2, 1.1, 1.05, 1, 1}) "p.112 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-67.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Des_Tot_Fert "p.107 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-10.0, -30.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = -90)));
        SystemDynamics.Functions.Tabular Fecundity_Mult(x_vals = 0:10:90, y_vals = {0, 0.2, 0.4, 0.6, 0.7, 0.75, 0.79, 0.84, 0.87, 0.87}) "p.104 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-124.8043, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Max_Tot_Fert(k = max_tot_fert_norm) "p.104 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-50.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Need_For_Fert_Cont Need_For_Fert_Cont "p.131 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {41.5, -24.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Fr_Serv_Al_Fert_Cont(x_vals = 0:2:10, y_vals = {0, 0.005, 0.015, 0.025, 0.03, 0.035}) "p.132 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {99.0, -24.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort serv_out_pc(unit = "dollar/yr") "Per capita annual expenditure in services" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Fert_Cont_Al_PC "p.132 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-140.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH3 Fert_Cont_Facil_PC(averaging_time(unit = "yr") = hlth_serv_impact_del, smooth_init(unit = "dollar/yr") = 0) "p.133 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-113.0, 90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Fert_Cont_Eff_Table(y_vals = {0.75, 0.85, 0.9, 0.95, 0.98, 0.99, 1, 1}, x_vals = {0, 0.5, 1, 1.5, 2, 2.5, 3, 15}) "p.133 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-63.0, 90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Fert_Cont_Eff Fert_Cont_Eff(t_fert_cont_eff_time = t_fert_cont_eff_time) "p.133 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-6.0, 90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Total_Fertility Total_Fertility "p.97 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {120.0, 100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort total_fertility "Average human fertility" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Fam_Income_Expect.u1, ind_out_pc) annotation(
          Line(visible = true, points = {{-74.0, -92.1504}, {-100.0, -92.1504}, {-100.0, -80.0}, {-210.0, -80.0}}, color = {0, 0, 191}));
        connect(Des_Compl_Fam_Size.u2, Fam_Resp_To_Soc_Norm.y) annotation(
          Line(visible = true, points = {{63.0, -84.0}, {40.0, -84.0}, {40.0, -96.1504}, {6.6165, -96.1504}}, color = {0, 0, 191}));
        connect(Fam_Resp_To_Soc_Norm.u, Fam_Income_Expect.y) annotation(
          Line(visible = true, origin = {-34.1917, -96.1504}, points = {{21.8083, 0.0}, {-21.8083, 0.0}}, color = {0, 0, 191}));
        connect(Fam_Income_Expect.u2, Avg_Ind_Out_PC.y) annotation(
          Line(visible = true, points = {{-74.0, -100.1504}, {-100.0, -100.0}, {-100.0, -100.0}, {-114.0, -100.0}}, color = {0, 0, 191}));
        connect(Max_Tot_Fert.u, Fecundity_Mult.y) annotation(
          Line(visible = true, origin = {-87.9022, 20.0}, points = {{25.9022, 0.0}, {-25.9022, 0.0}}, color = {0, 0, 191}));
        connect(Fecundity_Mult.u, life_expectancy) annotation(
          Line(visible = true, points = {{-132.8043, 20.0}, {-150.0, 20.0}, {-150.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}));
        connect(Fr_Serv_Al_Fert_Cont.y, Fert_Cont_Al_PC.u2) annotation(
          Line(visible = true, points = {{110.0, -24.0}, {140.0, -24.0}, {140.0, 60.0}, {-133.0, 60.0}}, color = {0, 0, 191}));
        connect(Fr_Serv_Al_Fert_Cont.u, Need_For_Fert_Cont.y) annotation(
          Line(visible = true, origin = {70.75, -24.0}, points = {{20.25, 0.0}, {-20.25, 0.0}}, color = {0, 0, 191}));
        connect(Need_For_Fert_Cont.u1, Max_Tot_Fert.y) annotation(
          Line(visible = true, points = {{32.5, -20.0}, {10.0, -20.0}, {10.0, 20.0}, {-39.0, 20.0}}, color = {0, 0, 191}));
        connect(Des_Tot_Fert.y, Need_For_Fert_Cont.u2) annotation(
          Line(visible = true, origin = {21.975, -29.0}, points = {{-23.575, -1.0}, {6.525, -1.0}, {6.525, 1.0}, {10.525, 1.0}}, color = {0, 0, 191}));
        connect(Soc_Fam_Size_Norm.y, Des_Compl_Fam_Size.u1) annotation(
          Line(visible = true, points = {{-56.0, -60.0}, {40.0, -60.0}, {40.0, -76.0}, {63.0, -76.0}}, color = {0, 0, 191}));
        connect(Des_Compl_Fam_Size.y, Des_Tot_Fert.u2) annotation(
          Line(visible = true, points = {{81.0, -80.0}, {110.0, -80.0}, {110.0, -50.0}, {-10.0, -50.0}, {-10.0, -38.4}}, color = {0, 0, 191}));
        connect(Soc_Fam_Size_Norm.u, Del_Ind_Out_PC.y) annotation(
          Line(visible = true, origin = {-94.5, -60.0}, points = {{19.5, 0.0}, {-19.5, 0.0}}, color = {0, 0, 191}));
        connect(Compl_Mlt_Perc_Lifet.y, Des_Tot_Fert.u1) annotation(
          Line(visible = true, points = {{-56.0, -20.0}, {-30.0, -20.0}, {-30.0, -10.0}, {-10.0, -10.0}, {-10.0, -21.6}}, color = {0, 0, 191}));
        connect(Compl_Mlt_Perc_Lifet.u, Perc_Life_Expectancy.y) annotation(
          Line(visible = true, origin = {-94.5, -20.0}, points = {{19.5, 0.0}, {-19.5, 0.0}}, color = {0, 0, 191}));
        connect(Avg_Ind_Out_PC.u, ind_out_pc) annotation(
          Line(visible = true, points = {{-136.0, -100.0}, {-150.0, -100.0}, {-150.0, -80.0}, {-210.0, -80.0}}, color = {0, 0, 191}));
        connect(Del_Ind_Out_PC.u, ind_out_pc) annotation(
          Line(visible = true, points = {{-136.0, -60.0}, {-150.0, -60.0}, {-150.0, -80.0}, {-210.0, -80.0}}, color = {0, 0, 191}));
        connect(Perc_Life_Expectancy.u, life_expectancy) annotation(
          Line(visible = true, points = {{-136.0, -20.0}, {-150.0, -20.0}, {-150.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}));
        connect(Max_Tot_Fert.y, Total_Fertility.u2) annotation(
          Line(visible = true, points = {{-39.0, 20.0}, {80.0, 20.0}, {80.0, 100.0}, {111.0, 100.0}}, color = {0, 0, 191}));
        connect(Des_Tot_Fert.y, Total_Fertility.u3) annotation(
          Line(visible = true, points = {{-1.6, -30.0}, {10.0, -30.0}, {10.0, -40.0}, {150.0, -40.0}, {150.0, 70.0}, {90.0, 70.0}, {90.0, 94.0}, {111.0, 94.0}}, color = {0, 0, 191}));
        connect(Fert_Cont_Eff.y, Total_Fertility.u1) annotation(
          Line(visible = true, points = {{3.0, 90.0}, {70.0, 90.0}, {70.0, 106.0}, {111.0, 106.0}}, color = {0, 0, 191}));
        connect(Total_Fertility.y, total_fertility) annotation(
          Line(visible = true, points = {{129.0, 100.0}, {180.0, 100.0}, {180.0, -10.0}, {210.0, -10.0}}, color = {0, 0, 191}));
        connect(Fert_Cont_Eff.u, Fert_Cont_Eff_Table.y) annotation(
          Line(visible = true, origin = {-33.5, 90.0}, points = {{18.5, 0.0}, {-18.5, 0.0}}, color = {0, 0, 191}));
        connect(Fert_Cont_Eff_Table.u, Fert_Cont_Facil_PC.y) annotation(
          Line(visible = true, origin = {-86.5, 90.0}, points = {{15.5, 0.0}, {-15.5, 0.0}}, color = {0, 0, 191}));
        connect(Fert_Cont_Facil_PC.u, Fert_Cont_Al_PC.y) annotation(
          Line(visible = true, origin = {-134.6667, 82.3333}, points = {{10.6667, 7.6667}, {-5.3333, 7.6667}, {-5.3333, -15.3333}}, color = {0, 0, 191}));
        connect(Fert_Cont_Al_PC.u1, serv_out_pc) annotation(
          Line(visible = true, origin = {-178.5, 60.0}, points = {{31.5, 0.0}, {-31.5, 0.0}}, color = {0, 0, 191}));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {-0.0, 30.0}, fillPattern = FillPattern.Solid, extent = {{-65.7919, -36.6918}, {65.7919, 36.6918}}, textString = "Human", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {0.0, -30.0}, fillPattern = FillPattern.Solid, extent = {{-65.0807, -36.6918}, {65.0807, 36.6918}}, textString = "Fertility", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-151.0, -81.0}, {-149.0, -79.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-151.0, -11.0}, {-149.0, -9.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{9.0, 19.0}, {11.0, 21.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{9.0, -31.0}, {11.0, -29.0}})}),
          Documentation(info = "<html>
This model estimates the human fertility factor used by the population dynamics model. <p>
 
The human fertility factor is dimensionless.
</html>"),
          experiment(StopTime = 200),
          experimentSetupOutput);
      end Human_Fertility;

      block Human_Welfare_Index "Human welfare index"
        SystemDynamics.Interfaces.MassInPort life_expectancy(unit = "yr") "Average life expectancy of human population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Life_Expectancy_Index(x_vals = {0, 25, 35, 45, 55, 65, 75, 85, 95}, y_vals = {0, 0, 0.16, 0.33, 0.5, 0.67, 0.84, 1, 1}) annotation(
          Placement(visible = true, transformation(origin = {-140.5, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular GDP_Per_Capita(x_vals = 0:200:1000, y_vals = {120, 600, 1200, 1800, 2500, 3200}) annotation(
          Placement(visible = true, transformation(origin = {-140.5, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Education_Index(x_vals = 0:1000:7000, y_vals = {0, 0.81, 0.88, 0.92, 0.95, 0.98, 0.99, 1}) annotation(
          Placement(visible = true, transformation(origin = {-40.5, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.GDP_Index GDP_Index annotation(
          Placement(visible = true, transformation(origin = {-48.1039, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.HWI_Human_Welfare_Index HWI_Human_Welfare_Index annotation(
          Placement(visible = true, transformation(origin = {43.7138, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort hwi_human_welfare_index "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Education_Index.y, HWI_Human_Welfare_Index.u2) annotation(
          Line(visible = true, points = {{-29.5, -10.0}, {3.625, -10.0}, {3.625, -10.0}, {34.7138, -10.0}}, color = {0, 0, 191}));
        connect(GDP_Per_Capita.y, Education_Index.u) annotation(
          Line(visible = true, points = {{-129.5, -80.0}, {-90.0, -80.0}, {-90.0, -10.0}, {-48.5, -10.0}}, color = {0, 0, 191}));
        connect(GDP_Index.u, GDP_Per_Capita.y) annotation(
          Line(visible = true, origin = {-93.302, -80.0}, points = {{36.1981, 0.0}, {-36.198, 0.0}}, color = {0, 0, 191}));
        connect(GDP_Per_Capita.u, ind_out_pc) annotation(
          Line(visible = true, origin = {-179.25, -80.0}, points = {{30.75, 0.0}, {-30.75, 0.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy_Index.y, HWI_Human_Welfare_Index.u1) annotation(
          Line(visible = true, points = {{-129.5, 60.0}, {0.0, 60.0}, {0.0, -4.0}, {34.7138, -4.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy_Index.u, life_expectancy) annotation(
          Line(visible = true, origin = {-179.25, 60.0}, points = {{30.75, 0.0}, {-30.75, 0.0}}, color = {0, 0, 191}));
        connect(GDP_Index.y, HWI_Human_Welfare_Index.u3) annotation(
          Line(points = {{-39.1039, -80.0}, {0.0, -80.0}, {0.0, -16.0}, {34.7138, -16.0}}, color = {0, 0, 191}, visible = true));
        connect(HWI_Human_Welfare_Index.y, hwi_human_welfare_index) annotation(
          Line(points = {{80.5, -10.0}, {210.0, -10.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 50.0}, fillPattern = FillPattern.Solid, extent = {{-63.6862, -26.9167}, {63.6862, 26.9167}}, textString = "Human", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {0.0, -50.0}, fillPattern = FillPattern.Solid, extent = {{-62.9121, -20.8986}, {62.9121, 20.8986}}, textString = "Index", fontSize = 102.0, fontName = "Arial"), Text(visible = true, fillPattern = FillPattern.Solid, extent = {{-62.5202, -26.0486}, {62.5202, 26.0486}}, textString = "Welfare", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-91.0, -81.0}, {-89.0, -79.0}})}),
          Documentation(info = "<html>
The <a href=\"http://links.jstor.org/sici?sici=0004-5608(198812)78%3A4%3C580%3AWVIHWA%3E2.0.CO%3B2-A\">human welfare index</a> is a measure of how well humans are living on average.  It is similar in concept to the <b>quality of life</b> variable introduced by Forrester in his <font color=red><b>WORLD2</b></font> model.  Yet, the human welfare index has been better standardized, and therefore, has replaced the former <b>quality of life</b> variable in the enhanced <font color=red><b>WORLD3</b></font> model. <p>
 
The human welfare index is dimensionless.
</html>"));
      end Human_Welfare_Index;

      block Industrial_Investment "Investments in the military/industrial sector"
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 400 "Desired annual industrial per capita output";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 14 "Controlled average life of industrial capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real t_ind_equil_time(unit = "yr") = 4000 "Year of industrial equilibrium";
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        SystemDynamics.Levels.Level Industrial_Capital(x0 = industrial_capital_init) "p.218 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-60.0, -10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Ind_Cap_Invest "p.222 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-120.0, -10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Ind_Cap_Deprec "p.221 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, -10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Ind_Cap_Inv "p.222 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-120.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Ind_Cap_Dep "p.221 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, -49.0}, extent = {{-10.0, -11.0}, {10.0, 11.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Industrial_Output Industrial_Output "p.216 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-70.0, 40.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Ind_Cap_Out_Ratio S_Ind_Cap_Out_Ratio(t_policy_year = t_policy_year, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1) "p.216 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-5.0, 40.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_3 P_Ind_Cap_Out_Ratio_2 annotation(
          Placement(visible = true, transformation(origin = {50.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Avg_Life_Ind_Cap S_Avg_Life_Ind_Cap(t_policy_year = t_policy_year, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2) "p.221 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {41.0, -70.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-170.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {50.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.FIOA_Ind FIOA_Ind "p.223 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-140.0, -75.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_FIOA_Cons S_FIOA_Cons(t_ind_equil_time = t_ind_equil_time) "p.223 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-97.0, -110.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_FIOA_Cons_Const S_FIOA_Cons_Const(p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, t_policy_year = t_policy_year) "p.223 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-40.0, -100.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_FIOA_Cons_Var(x_vals = 0:0.2:2, y_vals = {0.3, 0.32, 0.34, 0.36, 0.38, 0.43, 0.73, 0.77, 0.81, 0.82, 0.83}) "p.225 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-36.0, -130.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Gain1(k = 1 / ind_out_pc_des) annotation(
          Placement(visible = true, transformation(origin = {21.0, -130.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Ind_Out_PC "p.214 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {70.0, -130.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -170.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90), iconTransformation(origin = {-20.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassInPort s_fioa_serv "Fraction of total investments allocated to the service sector" annotation(
          Placement(visible = true, transformation(origin = {-170.0, -170.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90), iconTransformation(origin = {-60.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassInPort s_fioa_agr "Fraction of total investments allocated to the agricultural sector" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort capital_util_fr "Capital utilization fraction" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ppoll_tech_mult_icor_COPM "Technology induced reduction in persistent pollution release" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort yield_tech_mult_icor_COYM "Technology induced relative enhancement of land yield" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ind_cap_out_ratio_2_ICOR2T "Industrial capital output ratio" annotation(
          Placement(visible = true, transformation(origin = {-170.0, 150.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 90), iconTransformation(origin = {-60.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Interfaces.MassOutPort industrial_output(unit = "dollar/yr") "Annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 21.707}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort industrial_capital(unit = "dollar") "Total capital invested in the military/industrial sector" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Cons_Ind_Out annotation(
          Placement(visible = true, transformation(origin = {-100.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        Modelica.Blocks.Math.Division Cons_Ind_Out_PC annotation(
          Placement(visible = true, transformation(origin = {146.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort cons_ind_out_pc1(unit = "dollar/yr") "Per capita general industrial output" annotation(
          Placement(visible = true, transformation(origin = {210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(P_FIOA_Cons_Var.y, S_FIOA_Cons.u2) annotation(
          Line(visible = true, points = {{-47.0, -130.0}, {-74.0, -130.0}, {-74.0, -114.0}, {-88.0, -114.0}}, color = {0, 0, 191}));
        connect(S_FIOA_Cons_Const.y, S_FIOA_Cons.u1) annotation(
          Line(visible = true, points = {{-49.0, -100.0}, {-74.0, -100.0}, {-74.0, -106.0}, {-88.0, -106.0}}, color = {0, 0, 191}));
        connect(FIOA_Ind.u1, s_fioa_agr) annotation(
          Line(visible = true, points = {{-146.0, -84.0}, {-146.0, -130.0}, {-210.0, -130.0}}, color = {0, 0, 191}));
        connect(FIOA_Ind.u3, S_FIOA_Cons.y) annotation(
          Line(visible = true, points = {{-134.0, -84.0}, {-134.0, -110.0}, {-106.0, -110.0}}, color = {0, 0, 191}));
        connect(industrial_capital, Industrial_Capital.y2) annotation(
          Line(visible = true, points = {{210.0, -10.0}, {160.0, -10.0}, {160.0, -32.0}, {-48.75, -32.0}, {-48.75, -19.75}}, color = {0, 0, 191}));
        connect(Industrial_Output.u4, Industrial_Capital.y1) annotation(
          Line(visible = true, points = {{-61.0, 34.0}, {-36.0, 34.0}, {-36.0, -1.75}, {-47.25, -1.75}}, color = {0, 0, 191}));
        connect(S_Ind_Cap_Out_Ratio.y, Industrial_Output.u3) annotation(
          Line(visible = true, points = {{-14.0, 40.0}, {-36.0, 40.0}, {-36.0, 38.0}, {-61.0, 38.0}}, color = {0, 0, 191}));
        connect(Industrial_Output.u2, capital_util_fr) annotation(
          Line(visible = true, points = {{-61.0, 42.0}, {-40.0, 42.0}, {-40.0, 90.0}, {-190.0, 90.0}, {-190.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}));
        connect(Industrial_Output.u1, s_fr_cap_al_obt_res) annotation(
          Line(visible = true, points = {{-61.0, 46.0}, {-44.0, 46.0}, {-44.0, 80.0}, {-186.0, 80.0}, {-186.0, -70.0}, {-210.0, -70.0}}, color = {0, 0, 191}));
        connect(Cons_Ind_Out.y, Cons_Ind_Out_PC.u1) annotation(
          Line(visible = true, points = {{-93.0, -70.0}, {-80.0, -70.0}, {-80.0, -78.0}, {0.0, -78.0}, {0.0, -90.0}, {110.0, -90.0}, {110.0, 116.0}, {134.0, 116.0}}, color = {0, 0, 191}));
        connect(Ind_Out_PC.u2, Cons_Ind_Out_PC.u2) annotation(
          Line(visible = true, points = {{82.0, -136.0}, {120.0, -136.0}, {120.0, 104.0}, {134.0, 104.0}}, color = {0, 0, 191}));
        connect(Ind_Cap_Dep.u2, S_Avg_Life_Ind_Cap.y) annotation(
          Line(visible = true, origin = {15.0667, -67.0}, points = {{-8.4667, 6.0}, {-8.4667, -3.0}, {16.9333, -3.0}}, color = {0, 0, 191}));
        connect(Ind_Out_PC.y, Gain1.u) annotation(
          Line(visible = true, origin = {46.0, -130.0}, points = {{13.0, 0.0}, {-13.0, 0.0}}, color = {0, 0, 191}));
        connect(Gain1.y, P_FIOA_Cons_Var.u) annotation(
          Line(visible = true, origin = {-9.0, -130.0}, points = {{19.0, 0.0}, {-19.0, 0.0}}, color = {0, 0, 191}));
        connect(S_FIOA_Cons.y, Cons_Ind_Out.u2) annotation(
          Line(visible = true, points = {{-106.0, -110.0}, {-120.0, -110.0}, {-120.0, -86.0}, {-100.0, -86.0}, {-100.0, -77.0}}, color = {0, 0, 191}));
        connect(Industrial_Output.y, Cons_Ind_Out.u1) annotation(
          Line(visible = true, origin = {-93.0, 5.6667}, points = {{14.0, 34.3333}, {-7.0, 34.3333}, {-7.0, -68.6667}}, color = {0, 0, 191}));
        connect(FIOA_Ind.u2, s_fioa_serv) annotation(
          Line(visible = true, points = {{-140.0, -84.0}, {-140.0, -150.0}, {-170.0, -150.0}, {-170.0, -170.0}}, color = {0, 0, 191}));
        connect(Ind_Cap_Inv.u1, FIOA_Ind.y) annotation(
          Line(visible = true, points = {{-127.0, -50.0}, {-140.0, -50.0}, {-140.0, -66.0}}, color = {0, 0, 191}));
        connect(Industrial_Output.y, Ind_Cap_Inv.u2) annotation(
          Line(visible = true, points = {{-79.0, 40.0}, {-100.0, 40.0}, {-100.0, -50.0}, {-113.0, -50.0}}, color = {0, 0, 191}));
        connect(Ind_Cap_Inv.y, Ind_Cap_Invest.u) annotation(
          Line(visible = true, origin = {-120.0, -34.375}, points = {{0.0, -8.625}, {0.0, 8.625}}, color = {0, 0, 191}));
        connect(Sink1.MassInPort1, Ind_Cap_Deprec.y1) annotation(
          Line(visible = true, origin = {23.25, -10.0}, points = {{15.75, 0.0}, {-15.75, 0.0}}, color = {95, 0, 191}));
        connect(Ind_Cap_Dep.y, Ind_Cap_Deprec.u) annotation(
          Line(visible = true, points = {{0.0, -38.0}, {0.0, -33.5}, {0.0, -33.5}, {0.0, -25.75}}, color = {0, 0, 191}));
        connect(Industrial_Capital.u2, Ind_Cap_Deprec.y) annotation(
          Line(visible = true, origin = {-25.5, -10.0}, points = {{-18.0, 0.0}, {18.0, 0.0}}, color = {95, 0, 191}));
        connect(Ind_Cap_Dep.u1, Industrial_Capital.y3) annotation(
          Line(visible = true, points = {{-6.6, -61.0}, {-6.6, -70.0}, {-60.0, -70.0}, {-60.0, -19.75}}, color = {0, 0, 191}));
        connect(Ind_Cap_Invest.y1, Industrial_Capital.u1) annotation(
          Line(visible = true, origin = {-94.5, -10.0}, points = {{-18.0, 0.0}, {18.0, 0.0}}, color = {95, 0, 191}));
        connect(Source1.MassInPort1, Ind_Cap_Invest.y) annotation(
          Line(visible = true, origin = {-143.25, -10.0}, points = {{-15.75, 0.0}, {15.75, 0.0}}, color = {95, 0, 191}));
        connect(Industrial_Output.y, industrial_output) annotation(
          Line(visible = true, points = {{-79.0, 40.0}, {-100.0, 40.0}, {-100.0, 20.0}, {160.0, 20.0}, {160.0, 50.0}, {210.0, 50.0}}, color = {0, 0, 191}));
        connect(Ind_Out_PC.u1, Industrial_Output.y) annotation(
          Line(visible = true, points = {{82.0, -124.0}, {90.0, -124.0}, {90.0, 20.0}, {-100.0, 20.0}, {-100.0, 40.0}, {-79.0, 40.0}}, color = {0, 0, 191}));
        connect(P_Ind_Cap_Out_Ratio_2.y, S_Ind_Cap_Out_Ratio.u) annotation(
          Line(visible = true, origin = {23.5, 40.0}, points = {{19.5, 0.0}, {-19.5, 0.0}}, color = {0, 0, 191}));
        connect(P_Ind_Cap_Out_Ratio_2.u3, ppoll_tech_mult_icor_COPM) annotation(
          Line(visible = true, points = {{50.0, 47.0}, {50.0, 100.0}, {-194.0, 100.0}, {-194.0, 50.0}, {-210.0, 50.0}}, color = {0, 0, 191}));
        connect(P_Ind_Cap_Out_Ratio_2.u2, yield_tech_mult_icor_COYM) annotation(
          Line(visible = true, points = {{57.0, 40.0}, {70.0, 40.0}, {70.0, 110.0}, {-210.0, 110.0}}, color = {0, 0, 191}));
        connect(P_Ind_Cap_Out_Ratio_2.u1, ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(visible = true, points = {{50.0, 33.0}, {50.0, 26.0}, {90.0, 26.0}, {90.0, 120.0}, {-170.0, 120.0}, {-170.0, 150.0}}, color = {0, 0, 191}));
        connect(Cons_Ind_Out_PC.y, cons_ind_out_pc1) annotation(
          Line(visible = true, origin = {183.5, 110.0}, points = {{-26.5, 0.0}, {26.5, 0.0}}, color = {0, 0, 191}));
        connect(Ind_Out_PC.u2, population) annotation(
          Line(points = {{82.0, -136.0}, {90.0, -136.0}, {90.0, -150.0}, {-110.0, -150.0}, {-110.0, -170.0}}, color = {0, 0, 191}, visible = true));
        connect(Ind_Out_PC.y, ind_out_pc) annotation(
          Line(points = {{59.0, -130.0}, {52.0, -130.0}, {52.0, -160.0}, {160.0, -160.0}, {160.0, -70.0}, {210.0, -70.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 30.0}, fillPattern = FillPattern.Solid, extent = {{-86.8431, -36.6918}, {86.8431, 36.6918}}, textString = "Industrial", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {-0.0, -30.0}, fillPattern = FillPattern.Solid, extent = {{-92.5404, -36.6918}, {92.5404, 36.6918}}, textString = "Investment", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-101.0, 19.0}, {-99.0, 21.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{89.0, 19.0}, {91.0, 21.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{51.0, -131.0}, {53.0, -129.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-121.0, -111.0}, {-119.0, -109.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-101.0, -51.0}, {-99.0, -49.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{89.0, -137.0}, {91.0, -135.0}})}),
          Documentation(info = "<html>
This model calculates the capital invested in industry. <p>
 
Whereas the earlier <font color=red><b>WORLD2</b></font> model lumped all capital investment into a single state variable from which it then split off the percentage of capital invested in the agricultural sector as a second state variable (a funny choice for a state variable, since percentages don't accumulate), the more modern <font color=red><b>WORLD3</b></font> model differentiates between capital invested in industry, capital invested in the service sector, capital invested in agriculture, and other capital investment. <p>
 
The industrial capital is measured in U.S. dollars.
</html>"));
      end Industrial_Investment;

      block Labor_Utilization "Utilization of the labor force"
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        SystemDynamics.Levels.Level1a Labor_Util_Fr_Del(x0 = labor_util_fr_del_init) annotation(
          Placement(visible = true, transformation(origin = {0.0, -5.1833}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Rates.Rate_1 Chg_Lab_Util_Fr_Del annotation(
          Placement(visible = true, transformation(origin = {-40.0, -4.6542}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-70.0, -13.65}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Ch_Lab_Util_Fr_Del Ch_Lab_Util_Fr_Del(labor_util_fr_del_time = labor_util_fr_del_time) "p.241 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-40.0, -37.4563}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)),
          Dialog(group = "Variables"));
        SystemDynamics.Functions.Tabular Capital_Util_Fr(x_vals = (-1):2:11, y_vals = {1, 1, 0.9, 0.7, 0.3, 0.1, 0.1}) "p.241 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {57.225, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        Modelica.Blocks.Math.Division Labor_Util_Fr "p.241 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-44.7625, -72.0625}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)),
          Dialog(group = "Variables"));
        Modelica.Blocks.Math.Add3 Jobs "p.233 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-65.4417, 30.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Pot_Jobs_Agr_Sector "p.237 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-75.075, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular Jobs_Per_Hect(x_vals = {0, 2, 6, 10, 14, 18, 22, 26, 30, 10000}, y_vals = {2, 2, 0.5, 0.4, 0.3, 0.27, 0.24, 0.2, 0.2, 0.2}) "p.239 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-50.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Auxiliary.Prod_2 Pot_Jobs_Ind_Sector "p.233 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-22.0, 44.6542}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular Jobs_Per_Ind_Cap_Unit(x_vals = (-100):150:800, y_vals = {0.00037, 0.00037, 0.00018, 0.00012, 0.00009, 0.00007, 0.00006}) "p.236 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, 44.6542}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Auxiliary.Prod_2 Pot_Jobs_In_Serv_Sector "p.236 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {56.1333, 35.2917}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular Jobs_Per_Serv_Cap_Unit(x_vals = {0, 50, 200, 350, 500, 650, 800, 1200}, y_vals = {0.0011, 0.0011, 0.0006, 0.00035, 0.0002, 0.00015, 0.00015, 0.00015}) "p.237 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {80.0, 50.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Interfaces.MassInPort service_capital(unit = "dollar") "Total capital invested in service sector" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 41.5333}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort industrial_capital(unit = "dollar") "Total capital invested in the military/industrial sector" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort agr_inp_per_hect(unit = "dollar/(hectare.yr)") "Agricultural investments per hectare" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort arable_land(unit = "hectare") "Arable land" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort labor_force "Total human labor force" annotation(
          Placement(visible = true, transformation(origin = {-76.1597, -102.9722}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90), iconTransformation(origin = {-60.0, -110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassInPort serv_out_pc(unit = "dollar/yr") "Per capita annual expenditure in services" annotation(
          Placement(visible = true, transformation(origin = {-77.925, 103.0806}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 90), iconTransformation(origin = {-60.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Interfaces.MassOutPort capital_util_fr "Capital utilization fraction" annotation(
          Placement(visible = true, transformation(origin = {111.575, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Jobs_Per_Hect.u, agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-42.0, 80.0}, {-17.4625, 80.0}, {-17.4625, 93.1333}, {-90.0, 93.1333}, {-90.0, -40.0}, {-110.0, -40.0}}, color = {0, 0, 191}));
        connect(Pot_Jobs_In_Serv_Sector.u2, service_capital) annotation(
          Line(visible = true, points = {{49.1333, 35.2917}, {45.5083, 35.2917}, {45.5083, 100.0}, {-100.0, 100.0}, {-100.0, 80.0}, {-110.0, 80.0}}, color = {0, 0, 191}));
        connect(Capital_Util_Fr.u, Labor_Util_Fr_Del.y1) annotation(
          Line(visible = true, points = {{49.225, 0.0}, {30.0, 0.0}, {30.0, 3.0667}, {12.75, 3.0667}}, color = {0, 0, 191}));
        connect(Ch_Lab_Util_Fr_Del.u2, Labor_Util_Fr_Del.y4) annotation(
          Line(visible = true, points = {{-36.0, -46.4563}, {-36.0, -54.5042}, {-11.25, -54.5042}, {-11.25, -14.9333}}, color = {0, 0, 191}));
        connect(Labor_Util_Fr.y, Ch_Lab_Util_Fr_Del.u1) annotation(
          Line(visible = true, points = {{-44.7625, -61.0625}, {-44.0, -61.0625}, {-44.0, -46.4563}}, color = {0, 0, 191}));
        connect(Ch_Lab_Util_Fr_Del.y, Chg_Lab_Util_Fr_Del.u) annotation(
          Line(visible = true, origin = {-40.0, -24.4302}, points = {{0.0, -4.026}, {0.0, 4.026}}, color = {0, 0, 191}));
        connect(Chg_Lab_Util_Fr_Del.y1, Labor_Util_Fr_Del.u1) annotation(
          Line(visible = true, origin = {-22.0, -4.9188}, points = {{-10.5, 0.2645}, {2.5, 0.2645}, {2.5, -0.2645}, {5.5, -0.2645}}, color = {95, 0, 191}));
        connect(Source1.MassInPort1, Chg_Lab_Util_Fr_Del.y) annotation(
          Line(visible = true, origin = {-54.625, -9.1521}, points = {{-4.375, -4.4979}, {-1.375, -4.4979}, {-1.375, 4.4979}, {7.125, 4.4979}}, color = {95, 0, 191}));
        connect(Pot_Jobs_In_Serv_Sector.y, Jobs.u3) annotation(
          Line(visible = true, origin = {19.6083, 24.0972}, points = {{36.525, 4.1945}, {36.525, -2.0972}, {-73.05, -2.0972}}, color = {0, 0, 191}));
        connect(Jobs_Per_Serv_Cap_Unit.y, Pot_Jobs_In_Serv_Sector.u1) annotation(
          Line(visible = true, origin = {66.6, 42.6458}, points = {{2.4, 7.3542}, {0.5333, 7.3542}, {0.5333, -7.3541}, {-3.4667, -7.3541}}, color = {0, 0, 191}));
        connect(Pot_Jobs_Ind_Sector.u2, industrial_capital) annotation(
          Line(visible = true, points = {{-29.0, 44.6542}, {-40.0, 44.6542}, {-40.0, 94.1917}, {-94.1917, 94.1917}, {-94.1917, 0.0}, {-110.0, 0.0}}, color = {0, 0, 191}));
        connect(Jobs_Per_Ind_Cap_Unit.y, Pot_Jobs_Ind_Sector.u1) annotation(
          Line(visible = true, origin = {-8.0, 44.6542}, points = {{7.0, 0.0}, {-7.0, 0.0}}, color = {0, 0, 191}));
        connect(Pot_Jobs_Ind_Sector.y, Jobs.u2) annotation(
          Line(visible = true, origin = {-32.4806, 32.5514}, points = {{10.4806, 5.1028}, {10.4806, -2.5514}, {-20.9611, -2.5514}}, color = {0, 0, 191}));
        connect(Pot_Jobs_Agr_Sector.u2, arable_land) annotation(
          Line(visible = true, points = {{-82.075, 80.0}, {-83.6083, 80.0}, {-83.6083, -80.0}, {-110.0, -80.0}}, color = {0, 0, 191}));
        connect(Jobs_Per_Hect.y, Pot_Jobs_Agr_Sector.u1) annotation(
          Line(visible = true, origin = {-64.5375, 80.0}, points = {{3.5375, 0.0}, {-3.5375, 0.0}}, color = {0, 0, 191}));
        connect(Pot_Jobs_Agr_Sector.y, Jobs.u1) annotation(
          Line(visible = true, origin = {-60.895, 56.6}, points = {{-14.18, 16.4}, {-14.18, 10.4}, {10.4533, 10.4}, {10.4533, -18.6}, {7.4533, -18.6}}, color = {0, 0, 191}));
        connect(Labor_Util_Fr.u1, Jobs.y) annotation(
          Line(points = {{-50.7625, -84.0625}, {-50.7625, -90.0}, {-80.0, -90.0}, {-80.0, 30.0}, {-76.4417, 30.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Util_Fr.u2, labor_force) annotation(
          Line(points = {{-38.7625, -84.0625}, {-40.0, -94.7208}, {-76.2, -94.7208}, {-76.1597, -102.9722}}, color = {0, 0, 191}, visible = true));
        connect(Jobs_Per_Ind_Cap_Unit.u, ind_out_pc) annotation(
          Line(points = {{18.0, 44.6542}, {30.0, 44.6542}, {30.0, 95.7792}, {-97.3667, 95.7792}, {-97.3667, 41.5333}, {-110.0, 41.5333}}, color = {0, 0, 191}, visible = true));
        connect(Jobs_Per_Serv_Cap_Unit.u, serv_out_pc) annotation(
          Line(points = {{88.0, 50.0}, {97.3667, 50.0}, {97.3667, 96.8375}, {-77.925, 98.425}, {-77.925, 103.0806}}, color = {0, 0, 191}, visible = true));
        connect(capital_util_fr, Capital_Util_Fr.y) annotation(
          Line(points = {{111.575, 0.0}, {90.0, 0.0}, {87.3125, 0.0}, {68.225, 0.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 30.0}, fillPattern = FillPattern.Solid, extent = {{-47.3724, -36.6918}, {47.3724, 36.6918}}, textString = "Labor", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {0.0, -30.0}, fillPattern = FillPattern.Solid, extent = {{-95.4145, -36.6918}, {95.4145, 36.6918}}, textString = "Utilization", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
          Documentation(info = "<html>
This model computes the available labor work force that is available to be employed by agriculture, industry, and in the service sector. <p>
 
The labor utilization fraction is dimensionless.
</html>"));
      end Labor_Utilization;

      block Land_Fertility "Land fertility"
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0, 0} "Yield technology change multiplier";
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-66.2556, -17.775}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Land_Fert_Regen "p.328 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-35.3056, -17.775}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Levels.Level Land_Fertility(x0 = land_fertility_init) "p.324 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {1.852, -17.6868}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Rates.RRate Land_Fert_Degr "p.326 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {40.0, -27.3}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {63.0806, -27.3}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Land_Fert_Reg Land_Fert_Reg(inherent_land_fert = inherent_land_fert) "p.328 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-35.3056, -47.3694}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)),
          Dialog(group = "Variables"));
        SystemDynamics.Auxiliary.Prod_2 Land_Fert_Deg "p.326 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {40.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Land_Fert_Regen_Time(x_vals = 0:0.02:0.1, y_vals = {20, 13, 8, 4, 2, 2}) "p.330 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-60.0, -74.7625}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Functions.Tabular Land_Fert_Degr_Rt(x_vals = {0, 10, 20, 30, 100}, y_vals = {0, 0.1, 0.3, 0.5, 0.5}) "p.326 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {51.9556, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Interfaces.MassInPort p_fr_inp_for_land_maint "Fraction of investments in the agricultural sector allocated to land maintenance" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ppoll_index "Persistent pollution index" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort land_fertility(unit = "kg/(hectare.yr)") "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Yield_Tech_Chg_Rt_LYTDR annotation(
          Placement(visible = true, transformation(origin = {15.9833, 77.775}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Utilities.Yield_Tech_Chg_Rt Yield_Tech_Chg_Rt(t_policy_year = t_policy_year) annotation(
          Placement(visible = true, transformation(origin = {16.1257, 46.8312}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular P_Yield_Tech_Chg_Mlt_LYCM(y_vals = p_yield_tech_chg_mlt, x_vals = {-2, 0, 1, 2}) annotation(
          Placement(visible = true, transformation(origin = {-20.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Interfaces.MassInPort food_ratio "Food ratio" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Add1(k2 = -1) annotation(
          Placement(visible = true, transformation(origin = {-56.1556, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Des_Food_Ratio_DFR(k = des_food_ratio_dfr) annotation(
          Placement(visible = true, transformation(origin = {-73.9222, 73.5389}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Interfaces.MassOutPort yield_tech_LYTD "Technology induced absolute yield enhancement" annotation(
          Placement(visible = true, transformation(origin = {110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source2 annotation(
          Placement(visible = true, transformation(origin = {-27.9111, 77.775}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Levels.Level1a Yield_Tech_LYTD(x0 = yield_tech_init) annotation(
          Placement(visible = true, transformation(origin = {55.0, 70.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)),
          Dialog(group = "Variables"));
      equation
        connect(Land_Fert_Regen_Time.u, p_fr_inp_for_land_maint) annotation(
          Line(visible = true, points = {{-68.0, -74.7625}, {-80.0, -74.4979}, {-80.0, 0.0}, {-110.0, 0.0}}, color = {0, 0, 191}));
        connect(Land_Fert_Regen_Time.y, Land_Fert_Reg.u1) annotation(
          Line(visible = true, origin = {-42.5371, -68.6315}, points = {{-6.4629, -6.131}, {3.2315, -6.131}, {3.2315, 12.2621}}, color = {0, 0, 191}));
        connect(land_fertility, Land_Fertility.y1) annotation(
          Line(visible = true, points = {{110.0, -40.0}, {90.0, -40.0}, {90.0, -9.4368}, {14.6021, -9.4368}}, color = {0, 0, 191}));
        connect(Land_Fert_Deg.u1, Land_Fertility.y2) annotation(
          Line(visible = true, points = {{33.0, -60.0}, {13.1021, -60.0}, {13.1021, -27.4368}}, color = {0, 0, 191}));
        connect(Land_Fert_Reg.u2, Land_Fertility.y4) annotation(
          Line(visible = true, origin = {10.2306, 18.3444}, points = {{-41.5362, -74.7138}, {-41.5362, -86.3423}, {-19.6286, -86.3423}, {-19.6286, -45.7812}}, color = {0, 0, 191}));
        connect(Land_Fertility.u2, Land_Fert_Degr.y) annotation(
          Line(visible = true, origin = {23.713, -22.4934}, points = {{-5.361, 4.8066}, {-1.713, 4.8066}, {-1.713, -4.8066}, {8.787, -4.8066}}, color = {95, 0, 191}));
        connect(Land_Fert_Regen.y1, Land_Fertility.u1) annotation(
          Line(visible = true, origin = {-18.4374, -17.7309}, points = {{-9.3682, -0.0441}, {2.7894, -0.0441}, {2.7894, 0.0441}, {3.7894, 0.0441}}, color = {95, 0, 191}));
        connect(Land_Fert_Degr_Rt.y, Land_Fert_Deg.u2) annotation(
          Line(visible = true, points = {{62.9556, -90.0}, {80.0, -90.0}, {80.0, -60.0}, {47.0, -60.0}}, color = {0, 0, 191}));
        connect(Land_Fert_Deg.y, Land_Fert_Degr.u) annotation(
          Line(visible = true, origin = {40.0, -48.025}, points = {{0.0, -4.975}, {0.0, 4.975}}, color = {0, 0, 191}));
        connect(Land_Fert_Degr.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, origin = {49.0269, -27.3}, points = {{-1.5269, 0.0}, {-1.5269, 0.0}, {3.0537, 0.0}}, color = {95, 0, 191}));
        connect(Land_Fert_Reg.y, Land_Fert_Regen.u) annotation(
          Line(visible = true, origin = {-35.3056, -35.9472}, points = {{0.0, -2.4222}, {0.0, 2.4222}}, color = {0, 0, 191}));
        connect(Source1.MassInPort1, Land_Fert_Regen.y) annotation(
          Line(visible = true, origin = {-49.0306, -17.775}, points = {{-6.225, 0.0}, {6.225, 0.0}}, color = {95, 0, 191}));
        connect(yield_tech_LYTD, Yield_Tech_LYTD.y2) annotation(
          Line(visible = true, points = {{110.0, 40.0}, {66.25, 40.0}, {66.25, 60.25}}, color = {0, 0, 191}));
        connect(Yield_Tech_Chg_Rt.u2, Yield_Tech_LYTD.y4) annotation(
          Line(visible = true, points = {{20.1257, 37.8312}, {20.0, 20.0}, {44.25, 20.0}, {43.75, 60.25}}, color = {0, 0, 191}));
        connect(Yield_Tech_Chg_Rt_LYTDR.y1, Yield_Tech_LYTD.u1) annotation(
          Line(visible = true, origin = {33.2458, 73.8875}, points = {{-9.7625, 3.8875}, {2.2542, 3.8875}, {2.2542, -3.8875}, {5.2542, -3.8875}}, color = {95, 0, 191}));
        connect(Source2.MassInPort1, Yield_Tech_Chg_Rt_LYTDR.y) annotation(
          Line(visible = true, origin = {-4.2139, 77.775}, points = {{-12.6972, 0.0}, {12.6972, 0.0}}, color = {95, 0, 191}));
        connect(Yield_Tech_Chg_Rt.y, Yield_Tech_Chg_Rt_LYTDR.u) annotation(
          Line(visible = true, points = {{16.1257, 55.8312}, {15.9833, 62.025}}, color = {0, 0, 191}));
        connect(food_ratio, Add1.u2) annotation(
          Line(points = {{-110.0, 60.0}, {-90.0, 60.0}, {-90.0, 14.0}, {-68.1556, 14.0}}, color = {0, 0, 191}, visible = true));
        connect(Add1.u1, Des_Food_Ratio_DFR.y) annotation(
          Line(points = {{3.8444, -13.513}, {-1.9222, -13.513}, {-1.9222, 27.0259}}, color = {0, 0, 191}, visible = true, origin = {-72.0, 39.513}));
        connect(Add1.y, P_Yield_Tech_Chg_Mlt_LYCM.u) annotation(
          Line(points = {{-8.5778, 0.0}, {8.5778, 0.0}}, color = {0, 0, 191}, visible = true, origin = {-36.5778, 20.0}));
        connect(Yield_Tech_Chg_Rt.u1, P_Yield_Tech_Chg_Mlt_LYCM.y) annotation(
          Line(points = {{7.0419, 11.8875}, {7.0419, -5.9437}, {-14.0838, -5.9437}}, color = {0, 0, 191}, visible = true, origin = {5.0838, 25.9437}));
        connect(Land_Fert_Degr_Rt.u, ppoll_index) annotation(
          Line(points = {{43.9556, -90.0}, {-90.0, -90.0}, {-90.0, -50.0}, {-110.0, -50.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 30.0}, fillPattern = FillPattern.Solid, extent = {{-47.3724, -36.6918}, {47.3724, 36.6918}}, textString = "Land", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {0.0, -30.0}, fillPattern = FillPattern.Solid, extent = {{-65.0807, -36.6918}, {65.0807, 36.6918}}, textString = "Fertility", fontSize = 102.0, fontName = "Arial")}),
          Documentation(info = "<html>
This model computes the land fertility as a function of its utilization.  Land can be overused.  If that happens, the fertility of the land shrinks.  This is likely to happen as the overall world population continues to climb. <p>
 
The land fertility is measured in kilograms of equivalent vegetable food per hectare and year.  Arable land can be used to either grow vegetable food directly, or alternatively, to raise animals that then enter the human food chain.  Yet it takes more land per human to raise animals than to grow vegetable food.  For this reason, it is meaningful to convert proteins obtained from eating meat to equivalent units of vegetable food. <p>
 
Notice that this model uses two different types of rate models.  Whereas the yield technology rate is a so-called bi-flow, i.e., it can assume both positive and negative values leading to a change of flow direction, the land fertility integrator uses uni-flows, i.e., flows that are allowed to flow in the indicated direction only.
</html>", revisions = ""));
      end Land_Fertility;

      block Life_Expectancy "Life expectancy"
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health services impact delay";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        SystemDynamics.Auxiliary.Prod_5 Life_Expectancy annotation(
          Placement(visible = true, transformation(origin = {140.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Interfaces.MassOutPort life_expectancy(unit = "yr") "Average life expectancy of human population" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Const Life_Expect_Norm(k = life_expect_norm) annotation(
          Placement(visible = true, transformation(origin = {140.0, 103.0}, extent = {{-10.0, 10.0}, {10.0, -10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Lifet_Mult_Hlth_Serv Lifet_Mult_Hlth_Serv "p.76 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {85.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Lifet_Mlt_Hlth_Serv_1(x_vals = {0, 20, 40, 60, 80, 100, 200}, y_vals = {1, 1.1, 1.4, 1.6, 1.7, 1.8, 1.8}) "p.76 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, 100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Lifet_Mlt_Hlth_Serv_2(x_vals = {0, 20, 40, 60, 80, 100, 200}, y_vals = {1, 1.5, 1.9, 2, 2, 2, 2}) "p.76 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH1 Eff_Hlth_Serv_PC(averaging_time(unit = "yr") = hlth_serv_impact_del, smooth_init(unit = "dollar/yr") = 0) "p.71 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-58.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Hlth_Serv_Al_PC(x_vals = 0:250:2000, y_vals = {0, 20, 50, 95, 140, 175, 200, 220, 230}) "p.70 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-114.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort serv_out_pc(unit = "dollar/yr") "Per capita annual expenditure in services" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Lifet_Mlt_Crowd Lifet_Mlt_Crowd "p.90 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {81.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Crowd_Mult_Ind(x_vals = 0:200:1600, y_vals = {0.5, 0.05, -0.1, -0.08, -0.02, 0.05, 0.1, 0.15, 0.2}) "p.90 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Fr_Pop_Urban(x_vals = 0:2000000000.0:16000000000.0, y_vals = {0, 0.2, 0.4, 0.5, 0.58, 0.65, 0.72, 0.78, 0.8}) "p.88 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Lifet_Mlt_Food(x_vals = 0:5, y_vals = {0, 1, 1.43, 1.5, 1.5, 1.5}) "p.66 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Gain1(k = 1 / subsist_food_pc) annotation(
          Placement(visible = true, transformation(origin = {-51.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort food_pc(unit = "kg/yr") "Per capita annually consumed food" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Lifet_Mlt_PPoll(x_vals = 0:10:100, y_vals = {1, 0.99, 0.97, 0.95, 0.9, 0.85, 0.75, 0.65, 0.55, 0.4, 0.2}) "p.94 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, -100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ppoll_index "Persistent pollution index" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Life_Expect_Norm.y, Life_Expectancy.u1) annotation(
          Line(visible = true, origin = {140.0, 46.5}, points = {{0.0, 49.5}, {0.0, -49.5}}, color = {0, 0, 191}));
        connect(Lifet_Mlt_Hlth_Serv_1.y, Lifet_Mult_Hlth_Serv.u1) annotation(
          Line(visible = true, points = {{21.0, 100.0}, {50.0, 100.0}, {50.0, 84.0}, {76.0, 84.0}}, color = {0, 0, 191}));
        connect(Lifet_Mlt_Hlth_Serv_2.y, Lifet_Mult_Hlth_Serv.u2) annotation(
          Line(visible = true, points = {{21.0, 60.0}, {50.0, 60.0}, {50.0, 76.0}, {76.0, 76.0}}, color = {0, 0, 191}));
        connect(Lifet_Mult_Hlth_Serv.y, Life_Expectancy.u2) annotation(
          Line(visible = true, points = {{94.0, 80.0}, {120.0, 80.0}, {120.0, -5.4}, {135.0, -5.4}}, color = {0, 0, 191}));
        connect(Lifet_Mlt_Food.y, Life_Expectancy.u4) annotation(
          Line(visible = true, points = {{21.0, -60.0}, {120.0, -60.0}, {120.0, -14.6}, {135.0, -14.6}}, color = {0, 0, 191}));
        connect(Lifet_Mlt_PPoll.y, Life_Expectancy.u5) annotation(
          Line(visible = true, origin = {100.3333, -72.3333}, points = {{-79.3333, -27.6667}, {39.6667, -27.6667}, {39.6667, 55.3333}}, color = {0, 0, 191}));
        connect(Lifet_Mlt_Crowd.y, Life_Expectancy.u3) annotation(
          Line(visible = true, points = {{90.0, 0.0}, {110.0, 0.0}, {110.0, -10.0}, {133.0, -10.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy.y, life_expectancy) annotation(
          Line(visible = true, origin = {178.5, -10.0}, points = {{-31.5, 0.0}, {31.5, 0.0}}, color = {0, 0, 191}));
        connect(Crowd_Mult_Ind.y, Lifet_Mlt_Crowd.u1) annotation(
          Line(visible = true, points = {{21.0, 20.0}, {50.0, 20.0}, {50.0, 4.0}, {72.0, 4.0}}, color = {0, 0, 191}));
        connect(Fr_Pop_Urban.y, Lifet_Mlt_Crowd.u2) annotation(
          Line(visible = true, points = {{21.0, -20.0}, {50.0, -20.0}, {50.0, -4.0}, {72.0, -4.0}}, color = {0, 0, 191}));
        connect(Gain1.u, food_pc) annotation(
          Line(visible = true, points = {{-63.0, -60.0}, {-180.0, -60.0}, {-180.0, -70.0}, {-210.0, -70.0}}, color = {0, 0, 191}));
        connect(Gain1.y, Lifet_Mlt_Food.u) annotation(
          Line(visible = true, origin = {-19.0, -60.0}, points = {{-21.0, 0.0}, {21.0, 0.0}}, color = {0, 0, 191}));
        connect(Lifet_Mlt_PPoll.u, ppoll_index) annotation(
          Line(visible = true, points = {{2.0, -100.0}, {-180.0, -100.0}, {-180.0, -130.0}, {-210.0, -130.0}}, color = {0, 0, 191}));
        connect(Fr_Pop_Urban.u, population) annotation(
          Line(visible = true, points = {{2.0, -20.0}, {-180.0, -20.0}, {-180.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}));
        connect(Crowd_Mult_Ind.u, ind_out_pc) annotation(
          Line(visible = true, points = {{2.0, 20.0}, {-180.0, 20.0}, {-180.0, 50.0}, {-210.0, 50.0}}, color = {0, 0, 191}));
        connect(Eff_Hlth_Serv_PC.y, Lifet_Mlt_Hlth_Serv_2.u) annotation(
          Line(visible = true, points = {{-47.0, 80.0}, {-30.0, 80.0}, {-30.0, 60.0}, {2.0, 60.0}}, color = {0, 0, 191}));
        connect(Eff_Hlth_Serv_PC.y, Lifet_Mlt_Hlth_Serv_1.u) annotation(
          Line(visible = true, points = {{-47.0, 80.0}, {-30.0, 80.0}, {-30.0, 100.0}, {2.0, 100.0}}, color = {0, 0, 191}));
        connect(Hlth_Serv_Al_PC.y, Eff_Hlth_Serv_PC.u) annotation(
          Line(visible = true, origin = {-86.0, 80.0}, points = {{-17.0, 0.0}, {17.0, 0.0}}, color = {0, 0, 191}));
        connect(Hlth_Serv_Al_PC.u, serv_out_pc) annotation(
          Line(visible = true, points = {{-122.0, 80.0}, {-180.0, 80.0}, {-180.0, 110.0}, {-210.0, 110.0}}, color = {0, 0, 191}));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 30.0}, fillPattern = FillPattern.Solid, extent = {{-47.3724, -36.6918}, {47.3724, 36.6918}}, textString = "Life", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {-0.0, -30.0}, fillPattern = FillPattern.Solid, extent = {{-95.2722, -36.6918}, {95.2722, 36.6918}}, textString = "Expectancy", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-31.0, 79.0}, {-29.0, 81.0}})}),
          Documentation(info = "<html>
This model computes the average life expectancy of the human inhabitants of this planet as a function of their living conditions. <p>
 
The life expectancy is measured in numbers of years. <p>
 
This model is described on p.61 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
      end Life_Expectancy;

      block NR_Resource_Utilization "Utilization of non-recoverable natural resources"
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real nr_resources_init(unit = "ton") = 1000000000000.0 "Initial available non-recoverable resources";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        parameter Real t_fcaor_time(unit = "yr") = 4000 "Year of capital allocation to resource use efficiency";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_res_tech_chg_mlt[:] = {0, 0, 0, 0} "Resource technology change multiplier";
        SystemDynamics.Levels.Level1b NR_Resources(x0 = nr_resources_init) "p.387 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {40.0, 100.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate NR_Res_Use_Rate "p.389 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {100.0, 100.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {150.0, 100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_3 NR_Res_Use_Rt "p.389 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {100.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_NR_Res_Use_Fact S_NR_Res_Use_Fact(t_policy_year = t_policy_year, p_nr_res_use_fact_1 = p_nr_res_use_fact_1) "p.390 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {69.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH3 P_Nr_Res_Use_Fact_2(averaging_time(unit = "yr") = tech_dev_del_TDD) annotation(
          Placement(visible = true, transformation(origin = {14.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Levels.Level1a Res_Tech_NRTD(x0 = res_tech_init) annotation(
          Placement(visible = true, transformation(origin = {-40.0, -18.0827}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 Res_Tech_Ch_Rt_NRATE annotation(
          Placement(visible = true, transformation(origin = {-100.0, -18.0827}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-145.782, -18.0827}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Res_Tech_Ch_Rt_NRATE Res_Tech_Chg_Rt(t_policy_year = t_policy_year) annotation(
          Placement(visible = true, transformation(origin = {-100.0, -66.5489}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular P_Res_Tech_Chg_Mlt_NRCM(x_vals = {-10, -1, 0, 1}, y_vals = p_res_tech_chg_mlt) annotation(
          Placement(visible = true, transformation(origin = {-46.0, -130.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.P_Res_Tech_Chg P_Res_Tech_Chg(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR) annotation(
          Placement(visible = true, transformation(origin = {77.3158, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -180)));
        SystemDynamics.Functions.Tabular PC_Res_Use_Mlt(x_vals = 0:200:1600, y_vals = {0, 0.85, 2.6, 3.4, 3.8, 4.1, 4.4, 4.7, 5}) "p.390 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {46.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort pc_res_use_mlt(unit = "ton/yr") "Per capita resource utilization" annotation(
          Placement(visible = true, transformation(origin = {210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain NR_Res_Fr_Remain(k = 1 / nr_resources_init) "p.393 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-20.0, 100.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Fr_Cap_Al_Obt_Res_1(x_vals = 0:0.1:1, y_vals = {1, 0.9, 0.7, 0.5, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05}) "p.394 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-86.0, 120.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Fr_Cap_Al_Obt_Res_2(x_vals = 0:0.1:1, y_vals = p_fr_cap_al_obt_res_2) "p.394 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-86.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Fr_Cap_Al_Obt_Res S_Fr_Cap_Al_Obt_Res(t_fcaor_time = t_fcaor_time) "p.393 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-159.0, 100.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency" annotation(
          Placement(visible = true, transformation(origin = {210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular Ind_Cap_Out_Ratio_2(x_vals = {0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 2}, y_vals = {3.75, 3.6, 3.47, 3.36, 3.25, 3.16, 3.1, 3.06, 3.02, 3.01, 3, 3}) annotation(
          Placement(visible = true, transformation(origin = {131.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort ind_cap_out_ratio_2_ICOR2T "Industrial capital output ratio" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort industrial_output(unit = "dollar/yr") "Annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Res_Intens annotation(
          Placement(visible = true, transformation(origin = {112.0, -68.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassOutPort res_intens(unit = "ton/dollar") "Resource utilization intensity" annotation(
          Placement(visible = true, transformation(origin = {210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(P_Fr_Cap_Al_Obt_Res_1.y, S_Fr_Cap_Al_Obt_Res.u1) annotation(
          Line(visible = true, points = {{-97.0, 120.0}, {-128.0, 120.0}, {-128.0, 104.0}, {-150.0, 104.0}}, color = {0, 0, 191}));
        connect(P_Fr_Cap_Al_Obt_Res_2.y, S_Fr_Cap_Al_Obt_Res.u2) annotation(
          Line(visible = true, points = {{-97.0, 80.0}, {-128.0, 80.0}, {-128.0, 96.0}, {-150.0, 96.0}}, color = {0, 0, 191}));
        connect(P_Res_Tech_Chg.y, P_Res_Tech_Chg_Mlt_NRCM.u) annotation(
          Line(visible = true, origin = {15.1579, -130.0}, points = {{53.1579, 0.0}, {-53.1579, 0.0}}, color = {0, 0, 191}));
        connect(P_Res_Tech_Chg_Mlt_NRCM.y, Res_Tech_Chg_Rt.u1) annotation(
          Line(visible = true, origin = {-88.3333, -111.8496}, points = {{31.3333, -18.1504}, {-15.6667, -18.1504}, {-15.6667, 36.3007}}, color = {0, 0, 191}));
        connect(industrial_output, Res_Intens.u2) annotation(
          Line(visible = true, points = {{-210.0, -80.0}, {-180.0, -80.0}, {-180.0, -106.0}, {118.0, -106.0}, {118.0, -80.0}}, color = {0, 0, 191}));
        connect(Res_Intens.y, res_intens) annotation(
          Line(visible = true, points = {{112.0, -57.0}, {112.0, -40.0}, {190.0, -40.0}, {190.0, 50.0}, {210.0, 50.0}}, color = {0, 0, 191}));
        connect(P_Res_Tech_Chg.u, Res_Intens.u1) annotation(
          Line(visible = true, origin = {99.4386, -113.3333}, points = {{-13.1228, -16.6667}, {6.5614, -16.6667}, {6.5614, 33.3333}}, color = {0, 0, 191}));
        connect(Res_Tech_Ch_Rt_NRATE.y, Source1.MassInPort1) annotation(
          Line(visible = true, origin = {-121.141, -18.0827}, points = {{13.641, 0.0}, {-13.641, 0.0}}, color = {95, 0, 191}));
        connect(Res_Tech_NRTD.u1, Res_Tech_Ch_Rt_NRATE.y1) annotation(
          Line(visible = true, origin = {-74.5, -18.0827}, points = {{18.0, 0.0}, {-18.0, 0.0}}, color = {95, 0, 191}));
        connect(Res_Tech_Chg_Rt.y, Res_Tech_Ch_Rt_NRATE.u) annotation(
          Line(visible = true, origin = {-100.0, -45.6908}, points = {{0.0, -11.8581}, {0.0, 11.8581}}, color = {0, 0, 191}));
        connect(P_Nr_Res_Use_Fact_2.u, Res_Tech_NRTD.y1) annotation(
          Line(visible = true, points = {{3.0, -10.0}, {-9.2, -10.0}, {-9.2, -10.1}, {-27.25, -9.8327}}, color = {0, 0, 191}));
        connect(Res_Tech_Chg_Rt.u2, Res_Tech_NRTD.y4) annotation(
          Line(visible = true, points = {{-96.0, -75.5489}, {-96.0, -100.0}, {-51.25, -100.0}, {-51.25, -27.8327}}, color = {0, 0, 191}));
        connect(Ind_Cap_Out_Ratio_2.y, ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(visible = true, points = {{142.0, -10.0}, {184.25, -10.0}, {184.25, -10.0}, {210.0, -10.0}}, color = {0, 0, 191}));
        connect(Ind_Cap_Out_Ratio_2.u, S_NR_Res_Use_Fact.y) annotation(
          Line(visible = true, points = {{123.0, -10.0}, {106.125, -10.0}, {106.125, -10.0}, {101.25, -10.0}, {101.25, -10.0}, {78.0, -10.0}}, color = {0, 0, 191}));
        connect(P_Nr_Res_Use_Fact_2.y, S_NR_Res_Use_Fact.u) annotation(
          Line(visible = true, points = {{25.0, -10.0}, {37.95, -10.0}, {37.95, -10.0}, {60.0, -10.0}}, color = {0, 0, 191}));
        connect(S_NR_Res_Use_Fact.y, NR_Res_Use_Rt.u2) annotation(
          Line(visible = true, origin = {92.6667, 11.0}, points = {{-14.6667, -21.0}, {7.3333, -21.0}, {7.3333, 42.0}}, color = {0, 0, 191}));
        connect(NR_Res_Use_Rt.u3, population) annotation(
          Line(visible = true, points = {{107.0, 60.0}, {120.0, 60.0}, {120.0, 30.0}, {-180.0, 30.0}, {-180.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}));
        connect(PC_Res_Use_Mlt.y, NR_Res_Use_Rt.u1) annotation(
          Line(visible = true, origin = {75.0, 60.0}, points = {{-18.0, 0.0}, {18.0, 0.0}}, color = {0, 0, 191}));
        connect(NR_Res_Use_Rt.y, P_Res_Tech_Chg.u) annotation(
          Line(visible = true, points = {{100.0, 67.0}, {100.0, 80.0}, {170.0, 80.0}, {170.0, -130.0}, {86.3158, -130.0}}, color = {0, 0, 191}));
        connect(NR_Res_Use_Rt.y, NR_Res_Use_Rate.u) annotation(
          Line(visible = true, origin = {100.0, 75.625}, points = {{0.0, -8.625}, {0.0, 8.625}}, color = {0, 0, 191}));
        connect(PC_Res_Use_Mlt.y, pc_res_use_mlt) annotation(
          Line(visible = true, points = {{57.0, 60.0}, {80.0, 60.0}, {80.0, 20.0}, {180.0, 20.0}, {180.0, 110.0}, {210.0, 110.0}}, color = {0, 0, 191}));
        connect(PC_Res_Use_Mlt.u, ind_out_pc) annotation(
          Line(visible = true, origin = {-86.0, 60.0}, points = {{124.0, 0.0}, {-124.0, 0.0}}, color = {0, 0, 191}));
        connect(NR_Res_Use_Rate.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, origin = {123.25, 100.0}, points = {{-15.75, 0.0}, {15.75, 0.0}}, color = {95, 0, 191}));
        connect(NR_Res_Use_Rate.y, NR_Resources.u1) annotation(
          Line(visible = true, origin = {74.5, 100.0}, points = {{18.0, 0.0}, {-18.0, 0.0}}, color = {95, 0, 191}));
        connect(NR_Res_Fr_Remain.u, NR_Resources.y) annotation(
          Line(visible = true, points = {{-8.0, 100.0}, {16.0, 100.0}, {16.0, 108.25}, {27.25, 108.25}}, color = {0, 0, 191}));
        connect(NR_Res_Fr_Remain.y, P_Fr_Cap_Al_Obt_Res_2.u) annotation(
          Line(visible = true, points = {{-31.0, 100.0}, {-50.0, 100.0}, {-50.0, 80.0}, {-78.0, 80.0}}, color = {0, 0, 191}));
        connect(NR_Res_Fr_Remain.y, P_Fr_Cap_Al_Obt_Res_1.u) annotation(
          Line(visible = true, points = {{-31.0, 100.0}, {-50.0, 100.0}, {-50.0, 120.0}, {-78.0, 120.0}}, color = {0, 0, 191}));
        connect(S_Fr_Cap_Al_Obt_Res.y, s_fr_cap_al_obt_res) annotation(
          Line(visible = true, points = {{-168.0, 100.0}, {-190.0, 100.0}, {-190.0, -150.0}, {180.0, -150.0}, {180.0, -70.0}, {210.0, -70.0}}, color = {0, 0, 191}));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.0, 50.0}, fillPattern = FillPattern.Solid, extent = {{-47.3724, -36.6918}, {47.3724, 36.6918}}, textString = "NR", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {-0.0, -49.1014}, fillPattern = FillPattern.Solid, extent = {{-88.3557, -20.8986}, {88.3557, 20.8986}}, textString = "Utilization", fontSize = 102.0, fontName = "Arial"), Text(visible = true, fillPattern = FillPattern.Solid, extent = {{-78.7713, -36.6918}, {78.7713, 36.6918}}, textString = "Resource", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{99.0, 79.0}, {101.0, 81.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{79.0, 59.0}, {81.0, 61.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-51.0, 99.0}, {-49.0, 101.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{99.0, -11.0}, {101.0, -9.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{104.0, -131.0}, {106.0, -129.0}})}),
          Documentation(info = "<html>
This model describes the utilization of non-recoverable natural resources.  In the model (created in the early 1970s), the non-recoverable resources considered are mostly metals.  They are thus measured in metric tons. <p>
 
From today's perspective, it might make more sense to concentrate on the remaining fossil fuels, which is not the approach that Meadows and his coworkers took.  Yet, the effects of the dwindling resources on the overall economy are comparable, whether we can no longer produce goods, because we lack the raw materials or because we lack the energy to do so, results ultimately in the same predicament.  Due to the laws of exponential growth, we are running out of all kind of natural resources (fossil fuels, minerals, fresh water) almost simultaneously. <p>
 
In the case of minerals, recovery is partly possible, as discarded materials can be recycled.  However doing so requires energy for the re-concentration of these scrap materials.  The materials themselves don't get used up.  They only get dissipated further and further, until their density is so low that they cannot be collected any longer within reasonable cost limits. <p>
 
In the case of fossil fuels, these truly get used up.  These resources are non-recoverable within human time constants.  They were developed over many millions of years and essentially represent \"fossil sunshine.\"  Humanity is using all of these resources up within the very short time span (in geological terms) of a few hundred years.  <font color=red><b>Peak Oil</b></font>, i.e., the time when we shall have used up 50% of the available oil, and when supply can no longer keep up with demand, is now just around the corner. <p>
 
The fantastic recent developments of technology and the medical sciences, accompanied by an unprecedented growth of human population, would not have been possible without these resources, and won't be maintainable, once they shall have been used up. <p>
 
Whereas the earlier <font color=red><b>WORLD2</b></font> model only accounted for the dwindling resources themselves, the newer <font color=red><b>WORLD3</b></font> model offers a second state variable representing technological change.  Through more advanced technology, it is possible to use the available resources more efficiently, and that effect is accounted for by the second state variable in the model. <p>
 
In the <font color=red><b>WORLD3</b></font> model, the natural resources themselves are measured in metric tons, whereas the technology change has no units.
</html>", revisions = ""));
      end NR_Resource_Utilization;

      block Pollution_Dynamics "Pollution dynamics"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real p_ppoll_tech_chg_mlt[:] = {0, 0, 0, 0} "Persistent pollution technology change multiplier";
        SystemDynamics.Levels.Level Pers_Pollution(x0 = pers_pollution_init) "p.440 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-10.0, -10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate PPoll_Appear_Rt "p.435 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-70.0, -10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate PPoll_Assim_Rt "p.442 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {50.0, -10.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-110.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {90.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH3 PPoll_Appear_Rate(smooth_init(unit = "1/yr") = 0, averaging_time(unit = "yr") = ppoll_trans_del) "p.435 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-70.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.WorldDynamics.World3.Utilities.PPoll_Assim_Rt PPoll_Ass_Rt "p.442 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {50.0, -44.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular Assim_Half_Life_Mlt(x_vals = (-249):250:1001, y_vals = {1, 1, 11, 21, 31, 41}) "p.453 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {17.0, -112.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain PPoll_Index(k = 1 / ppoll_in_1970) "p.441 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-32.0, -112.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.PPoll_Gen_Rt PPoll_Gen_Rt "p.428 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-98.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.PPoll_Gen_Agr PPoll_Gen_Agr(agr_mtl_toxic_index = agr_mtl_toxic_index, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl) "p.433 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-147.0, -120.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.PPoll_Gen_Ind PPoll_Gen_Ind(frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index) "p.429 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-155.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Levels.Level1a PPoll_Tech_PTD(x0 = ppoll_tech_init) annotation(
          Placement(visible = true, transformation(origin = {140.0, 100.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.Rate_1 PPoll_Tech_Chg_Rt annotation(
          Placement(visible = true, transformation(origin = {80.0, 100.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Source Source2 annotation(
          Placement(visible = true, transformation(origin = {30.0, 100.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.PPoll_Tech_Chg_Rt PPoll_Tech_Ch_Rt(t_policy_year = t_policy_year) annotation(
          Placement(visible = true, transformation(origin = {80.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular P_PPoll_Tech_Chg_mlt_POLGFM(y_vals = p_ppoll_tech_chg_mlt, x_vals = {-100, -1, 0, 1}) annotation(
          Placement(visible = true, transformation(origin = {23.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.P_PPoll_Tech_Chg P_PPoll_Tech_Chg(des_ppoll_index_DPOLX = des_ppoll_index_DPOLX) annotation(
          Placement(visible = true, transformation(origin = {-40.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.SMTH3 P_PPoll_Gen_Fact_2(averaging_time(unit = "yr") = tech_dev_del_TDD) annotation(
          Placement(visible = true, transformation(origin = {-30.0, 90.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_PPoll_Gen_Fact S_PPoll_Gen_Fact(t_policy_year = t_policy_year, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1) "p.428 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-82.0, 90.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort pc_res_use_mlt(unit = "ton/yr") "Per capita resource utilization" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort arable_land(unit = "hectare") "Arable land" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort agr_inp_per_hect(unit = "dollar/(hectare.yr)") "Agricultural investments per hectare" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular PPoll_Tech_Mult_Icor_COPM(x_vals = {0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 2}, y_vals = {1.25, 1.2, 1.15, 1.11, 1.08, 1.05, 1.03, 1.02, 1.01, 1, 1, 1}) annotation(
          Placement(visible = true, transformation(origin = {-81.0, 120.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort ppoll_tech_mult_icor_COPM "Technology induced reduction in persistent pollution release" annotation(
          Placement(visible = true, transformation(origin = {210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort ppoll_index "Persistent pollution index" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort ppoll_gen_rt(unit = "1/yr") "Persistent pollution generation rate" annotation(
          Placement(visible = true, transformation(origin = {210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort industrial_output(unit = "dollar/yr") "Annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Poll_Intens_Ind Poll_Intens_Ind annotation(
          Placement(visible = true, transformation(origin = {-150.0, 67.6993}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassOutPort poll_intens_ind(unit = "1/dollar") "Persistent pollution intensity index" annotation(
          Placement(visible = true, transformation(origin = {210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Gain1(k = 1 / ind_out_in_1970) annotation(
          Placement(visible = true, transformation(origin = {-103.0, -140.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Yield_Mlt_Air_Poll_1(x_vals = 0:10:30, y_vals = {1, 1, 0.7, 0.4}) "p.310 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {104.0, -48.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Yield_Mlt_Air_Poll_2(x_vals = 0:10:30, y_vals = {1, 1, 0.98, 0.95}) "p.310 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {104.0, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Yield_Mlt_Air_Poll S_Yield_Mlt_Air_Poll(t_air_poll_time = t_air_poll_time) "p.310 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {170.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort s_yield_mlt_air_poll "Land yield multiplier to air pollution release" annotation(
          Placement(visible = true, transformation(origin = {210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -40.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Assim_Half_Life(k = assim_half_life_1970) "p.453 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {56.0, -84.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
      equation
        connect(S_Yield_Mlt_Air_Poll.u1, P_Yield_Mlt_Air_Poll_1.y) annotation(
          Line(visible = true, points = {{161.0, -66.0}, {140.0, -66.0}, {140.0, -48.0}, {115.0, -48.0}}, color = {0, 0, 191}));
        connect(P_Yield_Mlt_Air_Poll_2.y, S_Yield_Mlt_Air_Poll.u2) annotation(
          Line(visible = true, points = {{115.0, -90.0}, {140.0, -90.0}, {140.0, -74.0}, {161.0, -74.0}}, color = {0, 0, 191}));
        connect(arable_land, PPoll_Gen_Agr.u2) annotation(
          Line(visible = true, points = {{-210.0, -130.0}, {-180.0, -130.0}, {-180.0, -124.0}, {-156.0, -124.0}}, color = {0, 0, 191}));
        connect(agr_inp_per_hect, PPoll_Gen_Agr.u1) annotation(
          Line(visible = true, points = {{-210.0, -70.0}, {-190.0, -70.0}, {-190.0, -116.0}, {-156.0, -116.0}}, color = {0, 0, 191}));
        connect(PPoll_Gen_Ind.u2, population) annotation(
          Line(visible = true, points = {{-164.0, -84.0}, {-180.0, -84.0}, {-180.0, 50.0}, {-210.0, 50.0}}, color = {0, 0, 191}));
        connect(PPoll_Gen_Ind.u1, pc_res_use_mlt) annotation(
          Line(visible = true, points = {{-164.0, -76.0}, {-176.0, -76.0}, {-176.0, -74.0}, {-176.0, 110.0}, {-210.0, 110.0}}, color = {0, 0, 191}));
        connect(S_PPoll_Gen_Fact.y, PPoll_Gen_Rt.u1) annotation(
          Line(visible = true, points = {{-91.0, 90.0}, {-126.0, 90.0}, {-126.0, -74.0}, {-107.0, -74.0}}, color = {0, 0, 191}));
        connect(PPoll_Gen_Agr.y, PPoll_Gen_Rt.u3) annotation(
          Line(visible = true, points = {{-138.0, -120.0}, {-126.0, -120.0}, {-126.0, -86.0}, {-107.0, -86.0}}, color = {0, 0, 191}));
        connect(Assim_Half_Life.y, PPoll_Ass_Rt.u2) annotation(
          Line(visible = true, points = {{56.0, -95.0}, {56.0, -65.1}, {54.0, -65.1}, {54.0, -53.0}}, color = {0, 0, 191}));
        connect(PPoll_Ass_Rt.u1, Pers_Pollution.y2) annotation(
          Line(visible = true, points = {{46.0, -53.0}, {46.0, -64.0}, {1.25, -64.0}, {1.25, -19.75}}, color = {0, 0, 191}));
        connect(S_Yield_Mlt_Air_Poll.y, s_yield_mlt_air_poll) annotation(
          Line(visible = true, origin = {194.5, -70.0}, points = {{-15.5, 0.0}, {15.5, 0.0}}, color = {0, 0, 191}));
        connect(Gain1.y, P_Yield_Mlt_Air_Poll_2.u) annotation(
          Line(visible = true, points = {{-92.0, -140.0}, {76.0, -140.0}, {76.0, -90.0}, {96.0, -90.0}}, color = {0, 0, 191}));
        connect(Gain1.y, P_Yield_Mlt_Air_Poll_1.u) annotation(
          Line(visible = true, points = {{-92.0, -140.0}, {76.0, -140.0}, {76.0, -48.0}, {96.0, -48.0}}, color = {0, 0, 191}));
        connect(PPoll_Ass_Rt.y, PPoll_Assim_Rt.u) annotation(
          Line(visible = true, origin = {50.0, -30.375}, points = {{0.0, -4.625}, {0.0, 4.625}}, color = {0, 0, 191}));
        connect(Assim_Half_Life_Mlt.y, Assim_Half_Life.u) annotation(
          Line(visible = true, points = {{28.0, -112.0}, {56.0, -112.0}, {56.0, -72.0}}, color = {0, 0, 191}));
        connect(PPoll_Index.y, Assim_Half_Life_Mlt.u) annotation(
          Line(visible = true, origin = {-6.0, -112.0}, points = {{-15.0, 0.0}, {15.0, 0.0}}, color = {0, 0, 191}));
        connect(PPoll_Index.y, ppoll_index) annotation(
          Line(visible = true, points = {{-21.0, -112.0}, {-10.0, -112.0}, {-10.0, -126.0}, {72.0, -126.0}, {72.0, 12.0}, {110.0, 12.0}, {110.0, -10.0}, {210.0, -10.0}}, color = {0, 0, 191}));
        connect(PPoll_Index.y, P_PPoll_Tech_Chg.u) annotation(
          Line(visible = true, points = {{-21.0, -112.0}, {-10.0, -112.0}, {-10.0, -126.0}, {72.0, -126.0}, {72.0, 12.0}, {-70.0, 12.0}, {-70.0, 30.0}, {-49.0, 30.0}}, color = {0, 0, 191}));
        connect(PPoll_Index.u, Pers_Pollution.y3) annotation(
          Line(visible = true, points = {{-44.0, -112.0}, {-56.0, -112.0}, {-56.0, -72.0}, {-10.0, -72.0}, {-10.0, -19.75}}, color = {0, 0, 191}));
        connect(PPoll_Gen_Rt.y, ppoll_gen_rt) annotation(
          Line(visible = true, points = {{-89.0, -80.0}, {-70.0, -80.0}, {-70.0, -130.0}, {210.0, -130.0}}, color = {0, 0, 191}));
        connect(PPoll_Gen_Ind.y, PPoll_Gen_Rt.u2) annotation(
          Line(visible = true, origin = {-126.5, -80.0}, points = {{-19.5, 0.0}, {19.5, 0.0}}, color = {0, 0, 191}));
        connect(PPoll_Gen_Rt.y, PPoll_Appear_Rate.u) annotation(
          Line(visible = true, points = {{-89.0, -80.0}, {-70.0, -80.0}, {-70.0, -39.0}}, color = {0, 0, 191}));
        connect(Gain1.u, industrial_output) annotation(
          Line(visible = true, points = {{-115.0, -140.0}, {-184.0, -140.0}, {-184.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}));
        connect(PPoll_Gen_Ind.y, Poll_Intens_Ind.u2) annotation(
          Line(visible = true, points = {{-146.0, -80.0}, {-134.0, -80.0}, {-134.0, -40.0}, {-150.0, -40.0}, {-150.0, 58.6993}}, color = {0, 0, 191}));
        connect(PPoll_Appear_Rate.y, PPoll_Appear_Rt.u) annotation(
          Line(visible = true, points = {{-70.0, -61.0}, {-70.0, -25.75}}, color = {0, 0, 191}));
        connect(PPoll_Assim_Rt.y, Pers_Pollution.u2) annotation(
          Line(visible = true, points = {{42.5, -10.0}, {24.9, -10.0}, {24.9, -10.0}, {6.5, -10.0}}, color = {95, 0, 191}));
        connect(Sink1.MassInPort1, PPoll_Assim_Rt.y1) annotation(
          Line(visible = true, points = {{79.0, -10.0}, {69.5, -10.0}, {69.5, -10.0}, {57.5, -10.0}}, color = {95, 0, 191}));
        connect(Source1.MassInPort1, PPoll_Appear_Rt.y) annotation(
          Line(visible = true, points = {{-99.0, -10.0}, {-89.5, -10.0}, {-89.5, -10.0}, {-77.5, -10.0}}, color = {95, 0, 191}));
        connect(PPoll_Appear_Rt.y1, Pers_Pollution.u1) annotation(
          Line(visible = true, points = {{-62.5, -10.0}, {-44.9, -10.0}, {-44.9, -10.0}, {-26.5, -10.0}}, color = {95, 0, 191}));
        connect(P_PPoll_Tech_Chg.y, P_PPoll_Tech_Chg_mlt_POLGFM.u) annotation(
          Line(visible = true, origin = {-8.0, 30.0}, points = {{-23.0, 0.0}, {23.0, 0.0}}, color = {0, 0, 191}));
        connect(PPoll_Tech_Ch_Rt.u1, P_PPoll_Tech_Chg_mlt_POLGFM.y) annotation(
          Line(visible = true, origin = {62.0, 37.0}, points = {{14.0, 14.0}, {14.0, -7.0}, {-28.0, -7.0}}, color = {0, 0, 191}));
        connect(PPoll_Tech_Ch_Rt.u2, PPoll_Tech_PTD.y4) annotation(
          Line(visible = true, points = {{84.0, 51.0}, {83.9764, 35.6612}, {83.9764, 30.0}, {128.75, 30.0}, {128.75, 90.25}}, color = {0, 0, 191}));
        connect(P_PPoll_Gen_Fact_2.u, PPoll_Tech_PTD.y) annotation(
          Line(visible = true, points = {{-19.0, 90.0}, {0.0, 90.0}, {0.0, 120.0}, {110.0, 120.0}, {110.0, 108.25}, {127.25, 108.25}}, color = {0, 0, 191}));
        connect(PPoll_Tech_Chg_Rt.y1, PPoll_Tech_PTD.u1) annotation(
          Line(visible = true, origin = {105.5, 100.0}, points = {{-18.0, 0.0}, {18.0, 0.0}}, color = {95, 0, 191}));
        connect(PPoll_Tech_Ch_Rt.y, PPoll_Tech_Chg_Rt.u) annotation(
          Line(visible = true, origin = {80.0, 76.625}, points = {{0.0, -7.625}, {0.0, 7.625}}, color = {0, 0, 191}));
        connect(Source2.MassInPort1, PPoll_Tech_Chg_Rt.y) annotation(
          Line(visible = true, origin = {56.75, 100.0}, points = {{-15.75, 0.0}, {15.75, 0.0}}, color = {95, 0, 191}));
        connect(S_PPoll_Gen_Fact.u, P_PPoll_Gen_Fact_2.y) annotation(
          Line(visible = true, origin = {-57.0, 90.0}, points = {{-16.0, 0.0}, {16.0, 0.0}}, color = {0, 0, 191}));
        connect(S_PPoll_Gen_Fact.y, Poll_Intens_Ind.u3) annotation(
          Line(visible = true, points = {{-91.0, 90.0}, {-126.0, 90.0}, {-126.0, -10.0}, {-144.0, -10.0}, {-144.0, 58.6993}}, color = {0, 0, 191}));
        connect(S_PPoll_Gen_Fact.y, PPoll_Tech_Mult_Icor_COPM.u) annotation(
          Line(visible = true, points = {{-91.0, 90.0}, {-126.0, 90.0}, {-126.0, 120.0}, {-89.0, 120.0}}, color = {0, 0, 191}));
        connect(PPoll_Tech_Mult_Icor_COPM.y, ppoll_tech_mult_icor_COPM) annotation(
          Line(visible = true, points = {{-70.0, 120.0}, {-20.0, 120.0}, {-20.0, 130.0}, {180.0, 130.0}, {180.0, 50.0}, {210.0, 50.0}}, color = {0, 0, 191}));
        connect(Poll_Intens_Ind.u1, industrial_output) annotation(
          Line(points = {{-156.0, 58.6993}, {-156.0, -10.0}, {-210.0, -10.0}}, color = {0, 0, 191}, visible = true));
        connect(Poll_Intens_Ind.y, poll_intens_ind) annotation(
          Line(points = {{-150.0, 76.6993}, {-150.0, 140.0}, {190.0, 140.0}, {190.0, 110.0}, {210.0, 110.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.2251, 30.0}, fillPattern = FillPattern.Solid, extent = {{-69.7749, -36.6918}, {69.7749, 36.6918}}, textString = "Pollution", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {-0.3752, -30.0}, fillPattern = FillPattern.Solid, extent = {{-79.6248, -36.6918}, {79.6248, 36.6918}}, textString = "Dynamics", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-11.0, -113.0}, {-9.0, -111.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-127.0, 89.0}, {-125.0, 91.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-71.0, -81.0}, {-69.0, -79.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{71.0, 11.0}, {73.0, 13.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-135.0, -81.0}, {-133.0, -79.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-127.0, -11.0}, {-125.0, -9.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-185.0, -11.0}, {-183.0, -9.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{75.0, -91.0}, {77.0, -89.0}})}),
          Documentation(info = "<html>
This model describes the appearance of persistent pollutants.  These pollutants are an unwelcome yet inevitable byproduct of our industrial production.  Especially air pollution is problematic, because these pollutants are difficult to re-capture, and they remain in the air for a long time, somewhere in the order of 100 years.  These then lead to <font color=red><b>Global Warming</b></font>. <p>
 
Whereas the earlier <font color=red><b>WORLD2</b></font> model listed only the appearance and assimilation of pollution itself, the newer <font color=red><b>WORLD3</b></font> model accounts for the possibility of reducing the release of pollutants into the air by improved technology using a second state variable.  For example, it may be possible to burn coal in a power plant that captures the released CO<sub>2</sub> rather than releasing it into the atmosphere.  In this way, the greenhouse gas emissions could be significantly reduced, and thereby, the effects of global warming could be mitigated. <p>
 
Pollutants can take many forms.  For this reason, the <font color=red><b>WORLD3</b></font> model normalizes the pollutants and expresses them in \"units of pollution.\"  In accordance with engineering practice, normalized quantities are assumed to be dimensionless (the dimensions are filtered out in the process of normalization), and consequently, pollution in this model is assumed dimensionless.  The technology change factor is also dimensionless.
</html>"));
      end Pollution_Dynamics;

      block Population_Dynamics "Population dynamics"
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real reproductive_lifetime(unit = "yr") = 30 "Reproductive life time";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        SystemDynamics.Rates.RRate Births "p.96 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-140.0, 0.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Sources.Source source annotation(
          Placement(visible = true, transformation(origin = {-170.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Levels.Level2b Pop_0_14(x0 = pop1_init) annotation(
          Placement(visible = true, transformation(origin = {-110.0, 0.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Matur_14 "p.141 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-70.0, 5.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Levels.Level2b Pop_15_44(x0 = pop2_init) "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-39.0, 5.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Matur_44 "p.141 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, 10.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Levels.Level2b Pop_45_64(x0 = pop3_init) "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {30.0, 10.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Matur_64 "p.141 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {70.0, 15.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Pop_65plus(x0 = pop4_init) "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {102.0, 15.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Deaths_65p "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {132.0, 15.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink sink annotation(
          Placement(visible = true, transformation(origin = {160.0, 15.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Birth_Factors births(Repro_Life = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "p.96 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-140.0, -29.0}, extent = {{-10.0, -11.0}, {10.0, 11.0}}, rotation = -270)));
        SystemDynamics.Rates.RRate Deaths_0_14 "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-90.0, -60.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = -270)));
        SystemDynamics.Sources.Sink sink1 annotation(
          Placement(visible = true, transformation(origin = {-80.0, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Rates.RRate Deaths_15_44 "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-20.0, -60.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = -270)));
        SystemDynamics.Sources.Sink sink2 annotation(
          Placement(visible = true, transformation(origin = {-10.0, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Rates.RRate Deaths_45_64 "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {50.0, -60.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = -270)));
        SystemDynamics.Sources.Sink sink3 annotation(
          Placement(visible = true, transformation(origin = {60.0, -90.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -90)));
        SystemDynamics.WorldDynamics.World3.Utilities.Matur_Factors matur_14(bracket = 15) "p.141 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-70.0, -25.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Matur_Factors matur_44(bracket = 30) "p.141 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, -19.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Matur_Factors matur_64(bracket = 20) "p.141 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {70.0, -15.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Death_Factors deaths_0_14 "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-110.0, -82.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Death_Factors deaths_15_44 "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-40.0, -82.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Death_Factors deaths_45_64 "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {30.0, -82.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.Death_Factors deaths_65p "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {132.0, -23.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular Mort_0_14(x_vals = 20:10:90, y_vals = {0.0567, 0.0366, 0.0243, 0.0155, 0.0082, 0.0023, 0.001, 0.001}) "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-70.0, -124.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular Mort_15_44(x_vals = 20:10:90, y_vals = {0.0266, 0.0171, 0.011, 0.0065, 0.004, 0.0016, 0.0008, 0.0008}) "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, -124.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular Mort_45_64(x_vals = 20:10:90, y_vals = {0.0562, 0.0373, 0.0252, 0.0171, 0.0118, 0.0083, 0.006, 0.006}) "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {70.0, -124.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Functions.Tabular Mort_65p(x_vals = 20:10:90, y_vals = {0.13, 0.11, 0.09, 0.07, 0.06, 0.05, 0.04, 0.04}) "p.57 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {138.0, -77.2554}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.Interfaces.MassInPort life_expectancy(unit = "yr") "Average life expectancy of human population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Pop_Young annotation(
          Placement(visible = true, transformation(origin = {-150.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Pop_Old annotation(
          Placement(visible = true, transformation(origin = {-150.0, 80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Population annotation(
          Placement(visible = true, transformation(origin = {-112.0, 94.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Death_Young annotation(
          Placement(visible = true, transformation(origin = {149.0, 110.0}, extent = {{11.0, -10.0}, {-11.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Death_Old annotation(
          Placement(visible = true, transformation(origin = {149.0, 80.0}, extent = {{11.0, -10.0}, {-11.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Deaths annotation(
          Placement(visible = true, transformation(origin = {110.0, 94.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Add Work_Pop "p.241 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {50.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Gain Labor_Force(k = labor_force_partic) "p.241 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {96.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort labor_force "Total human labor force" annotation(
          Placement(visible = true, transformation(origin = {210.0, -80.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.BD_Rates Birth_Rate "p.97 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-73.0, 99.0}, extent = {{-13.0, -13.0}, {13.0, 13.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.BD_Rates Death_Rate "p.140 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {68.0, 99.0}, extent = {{14.0, -13.0}, {-14.0, 13.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort total_fertility "Average human fertility" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.Interfaces.MassOutPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {210.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Labor_Force.y, labor_force) annotation(
          Line(visible = true, points = {{107.0, 50.0}, {188.0, 50.0}, {188.0, -80.0}, {210.0, -80.0}}, color = {0, 0, 191}));
        connect(Labor_Force.u, Work_Pop.y) annotation(
          Line(visible = true, origin = {72.5, 50.0}, points = {{11.5, 0.0}, {-11.5, 0.0}}, color = {0, 0, 191}));
        connect(matur_64.u1, Pop_45_64.y1) annotation(
          Line(visible = true, points = {{66.0, -24.0}, {66.0, -30.0}, {39.0, -30.0}, {39.0, 2.2}}, color = {0, 0, 191}));
        connect(matur_44.u1, Pop_15_44.y1) annotation(
          Line(visible = true, points = {{-4.0, -28.0}, {-4.0, -34.0}, {-29.25, -34.0}, {-30.0, -2.8}}, color = {0, 0, 191}));
        connect(matur_14.u1, Pop_0_14.y1) annotation(
          Line(visible = true, points = {{-74.0, -34.0}, {-74.0, -40.0}, {-101.0, -40.0}, {-101.0, -7.8}}, color = {0, 0, 191}));
        connect(deaths_0_14.u1, Pop_0_14.y2) annotation(
          Line(visible = true, points = {{-114.0, -91.0}, {-114.0, -104.0}, {-126.0, -104.0}, {-126.0, -48.0}, {-110.0, -48.0}, {-110.0, -7.8}}, color = {0, 0, 191}));
        connect(Mort_0_14.y, deaths_0_14.u2) annotation(
          Line(visible = true, points = {{-70.0, -113.0}, {-70.0, -104.0}, {-106.0, -104.0}, {-106.0, -91.0}}, color = {0, 0, 191}));
        connect(deaths_15_44.u1, Pop_15_44.y2) annotation(
          Line(visible = true, points = {{-44.0, -91.0}, {-44.0, -104.0}, {-56.0, -104.0}, {-56.0, -48.0}, {-39.0, -48.0}, {-39.0, -2.8}}, color = {0, 0, 191}));
        connect(Mort_15_44.y, deaths_15_44.u2) annotation(
          Line(visible = true, points = {{0.0, -113.0}, {0.0, -104.0}, {-36.0, -104.0}, {-36.0, -91.0}}, color = {0, 0, 191}));
        connect(deaths_45_64.u1, Pop_45_64.y2) annotation(
          Line(visible = true, points = {{26.0, -91.0}, {26.0, -104.0}, {14.0, -104.0}, {14.0, -30.0}, {30.0, -30.0}, {30.0, 2.2}}, color = {0, 0, 191}));
        connect(Mort_45_64.y, deaths_45_64.u2) annotation(
          Line(visible = true, points = {{70.0, -113.0}, {70.0, -104.0}, {34.0, -104.0}, {34.0, -91.0}}, color = {0, 0, 191}));
        connect(Work_Pop.u2, Pop_45_64.y) annotation(
          Line(visible = true, points = {{38.0, 44.0}, {14.0, 44.0}, {14.0, 16.6}, {19.8, 16.6}}, color = {0, 0, 191}));
        connect(Pop_Old.u1, Pop_45_64.y) annotation(
          Line(visible = true, points = {{-162.0, 86.0}, {-172.0, 86.0}, {-172.0, 28.0}, {14.0, 28.0}, {14.0, 16.6}, {19.8, 16.6}}, color = {0, 0, 191}));
        connect(Pop_45_64.u3, Deaths_45_64.y) annotation(
          Line(visible = true, origin = {47.7333, -18.5333}, points = {{-4.5333, 23.7333}, {2.2667, 23.7333}, {2.2667, -47.4667}}, color = {191, 0, 191}));
        connect(Pop_45_64.u2, Matur_64.y) annotation(
          Line(visible = true, points = {{43.2, 14.8}, {52.6, 14.8}, {52.6, 15.0}, {64.0, 15.0}}, color = {191, 0, 191}));
        connect(Matur_44.y1, Pop_45_64.u1) annotation(
          Line(visible = true, origin = {11.4, 10.0}, points = {{-5.4, 0.0}, {5.4, 0.0}}, color = {191, 0, 191}));
        connect(deaths_65p.u1, Pop_65plus.y2) annotation(
          Line(visible = true, points = {{128.0, -32.0}, {128.0, -40.0}, {111.0, -40.0}, {111.0, 7.2}}, color = {0, 0, 191}));
        connect(Pop_Old.u2, Pop_65plus.y) annotation(
          Line(visible = true, points = {{-162.0, 74.0}, {-168.0, 74.0}, {-168.0, 32.0}, {84.0, 32.0}, {84.0, 22.15}, {91.8, 21.6}}, color = {0, 0, 191}));
        connect(Pop_65plus.u2, Deaths_65p.y) annotation(
          Line(visible = true, origin = {120.6, 15.0}, points = {{-5.4, 0.0}, {5.4, 0.0}}, color = {191, 0, 191}));
        connect(Matur_64.y1, Pop_65plus.u1) annotation(
          Line(visible = true, origin = {82.4, 15.0}, points = {{-6.4, 0.0}, {6.4, 0.0}}, color = {191, 0, 191}));
        connect(matur_64.y, Matur_64.u) annotation(
          Line(visible = true, origin = {70.0, -1.8}, points = {{0.0, -4.2}, {0.0, 4.2}}, color = {0, 0, 191}));
        connect(Matur_14.y1, Pop_15_44.u1) annotation(
          Line(visible = true, origin = {-58.1, 5.0}, points = {{-5.9, 0.0}, {5.9, 0.0}}, color = {191, 0, 191}));
        connect(Work_Pop.u1, Pop_15_44.y) annotation(
          Line(visible = true, points = {{38.0, 56.0}, {-56.0, 56.0}, {-56.0, 12.15}, {-49.2, 11.6}}, color = {0, 0, 191}));
        connect(Pop_Young.u2, Pop_15_44.y) annotation(
          Line(visible = true, points = {{-162.0, 104.0}, {-176.0, 104.0}, {-176.0, 24.0}, {-56.0, 24.0}, {-56.0, 12.15}, {-49.2, 11.6}}, color = {0, 0, 191}));
        connect(births.u3, Pop_15_44.y3) annotation(
          Line(visible = true, points = {{-133.4, -38.0}, {-133.4, -44.0}, {-48.75, -44.0}, {-48.0, -2.8}}, color = {0, 0, 191}));
        connect(Pop_15_44.u3, Deaths_15_44.y) annotation(
          Line(visible = true, origin = {-21.9333, -21.8667}, points = {{-3.8667, 22.0667}, {1.9333, 22.0667}, {1.9333, -44.1333}}, color = {191, 0, 191}));
        connect(Pop_15_44.u2, Matur_44.y) annotation(
          Line(visible = true, points = {{-25.8, 9.8}, {-17.4, 10.2}, {-17.4, 10.0}, {-6.0, 10.0}}, color = {191, 0, 191}));
        connect(matur_14.y, Matur_14.u) annotation(
          Line(visible = true, origin = {-70.0, -11.8}, points = {{0.0, -4.2}, {0.0, 4.2}}, color = {0, 0, 191}));
        connect(Pop_0_14.u2, Matur_14.y) annotation(
          Line(visible = true, points = {{-96.8, 4.8}, {-88.4, 4.8}, {-88.4, 5.0}, {-76.0, 5.0}}, color = {191, 0, 191}));
        connect(Deaths_65p.y1, sink.MassInPort1) annotation(
          Line(visible = true, origin = {143.5, 15.0}, points = {{-5.5, 0.0}, {5.5, 0.0}}, color = {191, 0, 191}));
        connect(deaths_65p.y, Deaths_65p.u) annotation(
          Line(visible = true, origin = {132.0, -5.8}, points = {{0.0, -8.2}, {0.0, 8.2}}, color = {0, 0, 191}));
        connect(deaths_45_64.y, Deaths_45_64.u) annotation(
          Line(visible = true, origin = {40.8667, -64.3333}, points = {{-10.8667, -8.6667}, {-10.8667, 4.3333}, {21.7333, 4.3333}}, color = {0, 0, 191}));
        connect(Deaths_45_64.y1, sink3.MassInPort1) annotation(
          Line(visible = true, origin = {55.0, -71.25}, points = {{-5.0, 17.25}, {-5.0, -4.75}, {5.0, -4.75}, {5.0, -7.75}}, color = {191, 0, 191}));
        connect(deaths_45_64.y, Death_Old.u1) annotation(
          Line(visible = true, points = {{30.0, -73.0}, {30.0, -42.0}, {176.0, -42.0}, {176.0, 86.0}, {162.2, 86.0}}, color = {0, 0, 191}));
        connect(deaths_15_44.y, Death_Young.u2) annotation(
          Line(visible = true, points = {{-40.0, -73.0}, {-40.0, -60.0}, {-60.0, -60.0}, {-60.0, -144.0}, {180.0, -144.0}, {180.0, 104.0}, {162.2, 104.0}}, color = {0, 0, 191}));
        connect(deaths_15_44.y, Deaths_15_44.u) annotation(
          Line(visible = true, origin = {-29.1333, -64.3333}, points = {{-10.8667, -8.6667}, {-10.8667, 4.3333}, {21.7333, 4.3333}}, color = {0, 0, 191}));
        connect(Deaths_15_44.y1, sink2.MassInPort1) annotation(
          Line(visible = true, origin = {-15.0, -71.25}, points = {{-5.0, 17.25}, {-5.0, -4.75}, {5.0, -4.75}, {5.0, -7.75}}, color = {191, 0, 191}));
        connect(deaths_0_14.y, Deaths_0_14.u) annotation(
          Line(visible = true, origin = {-99.1333, -64.3333}, points = {{-10.8667, -8.6667}, {-10.8667, 4.3333}, {21.7333, 4.3333}}, color = {0, 0, 191}));
        connect(Deaths_0_14.y1, sink1.MassInPort1) annotation(
          Line(visible = true, origin = {-85.0, -71.25}, points = {{-5.0, 17.25}, {-5.0, -4.75}, {5.0, -4.75}, {5.0, -7.75}}, color = {191, 0, 191}));
        connect(Pop_0_14.u3, Deaths_0_14.y) annotation(
          Line(visible = true, origin = {-92.2667, -25.2}, points = {{-4.5333, 20.4}, {2.2667, 20.4}, {2.2667, -40.8}}, color = {191, 0, 191}));
        connect(Mort_0_14.y, matur_14.u2) annotation(
          Line(visible = true, points = {{-70.0, -113.0}, {-70.0, -104.0}, {-66.0, -104.0}, {-66.0, -34.0}}, color = {0, 0, 191}));
        connect(Mort_15_44.y, matur_44.u2) annotation(
          Line(visible = true, points = {{0.0, -113.0}, {0.0, -104.0}, {5.2, -104.0}, {4.0, -28.0}}, color = {0, 0, 191}));
        connect(matur_44.y, Matur_44.u) annotation(
          Line(visible = true, points = {{0.0, -10.0}, {0.0, -6.55}, {0.0, -6.55}, {0.0, -2.6}}, color = {0, 0, 191}));
        connect(Mort_45_64.y, matur_64.u2) annotation(
          Line(visible = true, points = {{70.0, -113.0}, {70.0, -104.0}, {75.2, -104.0}, {74.0, -24.0}}, color = {0, 0, 191}));
        connect(deaths_65p.y, Death_Old.u2) annotation(
          Line(visible = true, points = {{132.0, -14.0}, {132.0, -4.0}, {172.0, -4.0}, {172.0, 74.0}, {162.2, 74.0}}, color = {0, 0, 191}));
        connect(Mort_65p.y, deaths_65p.u2) annotation(
          Line(visible = true, origin = {137.0, -42.5639}, points = {{1.0, -23.6915}, {1.0, 6.5639}, {-1.0, 6.5639}, {-1.0, 10.5639}}, color = {0, 0, 191}));
        connect(Mort_65p.u, Mort_45_64.u) annotation(
          Line(visible = true, points = {{138.0, -85.2554}, {138.0, -140.0}, {70.0, -140.0}, {70.0, -132.0}}, color = {0, 0, 191}));
        connect(Mort_45_64.u, Mort_15_44.u) annotation(
          Line(visible = true, points = {{70.0, -132.0}, {70.0, -140.0}, {0.0, -140.0}, {0.0, -132.0}}, color = {0, 0, 191}));
        connect(Mort_15_44.u, Mort_0_14.u) annotation(
          Line(visible = true, points = {{0.0, -132.0}, {0.0, -140.0}, {-70.0, -140.0}, {-70.0, -132.0}}, color = {0, 0, 191}));
        connect(Mort_0_14.u, life_expectancy) annotation(
          Line(visible = true, points = {{-70.0, -132.0}, {-70.0, -140.0}, {-180.0, -140.0}, {-180.0, -80.0}, {-210.0, -80.0}}, color = {0, 0, 191}));
        connect(deaths_0_14.y, Death_Young.u1) annotation(
          Line(visible = true, points = {{-110.0, -73.0}, {-110.0, -60.0}, {-130.0, -60.0}, {-130.0, -148.0}, {184.0, -148.0}, {184.0, 116.0}, {162.2, 116.0}}, color = {0, 0, 191}));
        connect(source.MassInPort1, Births.y) annotation(
          Line(points = {{-159.0, 0.0}, {-146.0, 0.0}}, color = {191, 0, 191}, visible = true));
        connect(Births.y1, Pop_0_14.u1) annotation(
          Line(points = {{-134.0, 0.0}, {-123.2, 0.0}}, color = {191, 0, 191}, visible = true));
        connect(births.y, Births.u) annotation(
          Line(points = {{-140.0, -20.0}, {-140.0, -12.6}}, color = {0, 0, 191}, visible = true));
        connect(Pop_Young.u1, Pop_0_14.y) annotation(
          Line(points = {{-162.0, 116.0}, {-180.0, 116.0}, {-180.0, 20.0}, {-126.0, 20.0}, {-126.0, 6.6}, {-120.2, 6.6}}, color = {0, 0, 191}, visible = true));
        connect(Pop_Young.y, Population.u1) annotation(
          Line(points = {{-139.0, 110.0}, {-132.0, 110.0}, {-132.0, 100.0}, {-124.0, 100.0}}, color = {0, 0, 191}, visible = true));
        connect(Pop_Old.y, Population.u2) annotation(
          Line(points = {{-139.0, 80.0}, {-132.0, 80.0}, {-132.0, 88.0}, {-124.0, 88.0}}, color = {0, 0, 191}, visible = true));
        connect(Death_Young.y, Deaths.u1) annotation(
          Line(points = {{136.9, 110.0}, {130.0, 110.0}, {130.0, 100.0}, {122.0, 100.0}}, color = {0, 0, 191}, visible = true));
        connect(Death_Old.y, Deaths.u2) annotation(
          Line(points = {{136.9, 80.0}, {130.0, 80.0}, {130.0, 88.0}, {122.0, 88.0}}, color = {0, 0, 191}, visible = true));
        connect(Birth_Rate.u2, Population.y) annotation(
          Line(points = {{-84.7, 93.8}, {-92.35, 93.8}, {-92.35, 94.0}, {-101.0, 94.0}}, color = {0, 0, 191}, visible = true));
        connect(births.y, Birth_Rate.u1) annotation(
          Line(points = {{-140.0, -20.0}, {-140.0, -16.0}, {-184.0, -16.0}, {-184.0, 128.0}, {-94.0, 128.0}, {-94.0, 104.2}, {-84.7, 104.2}}, color = {0, 0, 191}, visible = true));
        connect(Population.y, Death_Rate.u2) annotation(
          Line(points = {{-101.0, 94.0}, {-94.0, 94.0}, {-94.0, 74.0}, {86.0, 74.0}, {86.0, 93.8}, {80.6, 93.8}}, color = {0, 0, 191}, visible = true));
        connect(Deaths.y, Death_Rate.u1) annotation(
          Line(points = {{99.0, 94.0}, {92.0, 94.0}, {92.0, 104.2}, {80.6, 104.2}}, color = {0, 0, 191}, visible = true));
        connect(Deaths.y, births.u2) annotation(
          Line(points = {{99.0, 94.0}, {92.0, 94.0}, {92.0, 70.0}, {-60.0, 70.0}, {-60.0, 36.0}, {-156.0, 36.0}, {-156.0, -60.0}, {-140.0, -60.0}, {-140.0, -38.0}}, color = {0, 0, 191}, visible = true));
        connect(births.u1, total_fertility) annotation(
          Line(points = {{-146.6, -38.0}, {-146.6, -48.0}, {-188.0, -48.0}, {-188.0, 60.0}, {-210.0, 60.0}}, color = {0, 0, 191}, visible = true));
        connect(Population.y, population) annotation(
          Line(points = {{-101.0, 94.0}, {-94.0, 94.0}, {-94.0, 74.0}, {120.0, 74.0}, {120.0, 60.0}, {210.0, 60.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {-0.5365, 30.0}, fillPattern = FillPattern.Solid, extent = {{-89.4635, -36.6918}, {89.4635, 36.6918}}, textString = "Population", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {0.0, -30.0}, fillPattern = FillPattern.Solid, extent = {{-81.6353, -36.6918}, {81.6353, 36.6918}}, textString = "Dynamics", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-71.0, -105.0}, {-69.0, -103.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-1.0, -105.0}, {1.0, -103.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{69.0, -105.0}, {71.0, -103.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-71.0, -141.0}, {-69.0, -139.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-1.0, -141.0}, {1.0, -139.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{69.0, -141.0}, {71.0, -139.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{29.0, -61.0}, {31.0, -59.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-41.0, -61.0}, {-39.0, -59.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-111.0, -61.0}, {-109.0, -59.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{131.0, -5.0}, {133.0, -3.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{13.0, 27.0}, {15.0, 29.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-57.0, 23.0}, {-55.0, 25.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-141.0, -17.0}, {-139.0, -15.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-95.0, 93.0}, {-93.0, 95.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{91.0, 93.0}, {93.0, 95.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{85.0, 73.0}, {87.0, 75.0}})}),
          Documentation(info = "<html>
This model describes the population dynamics of the <font color=red><b>WORLD3</b></font> model.  Whereas the earlier <font color=red><b>WORLD2</b></font> model had lumped all of the population together into a single state variable, <font color=red><b>WORLD3</b></font> offers a demographic model that distinguishes between four age groups, those of the children, those of the younger adults representing the child-bearing population, those of the older adults who are still in the work force, and finally, those of the retired population. <p>
 
Population is measured in numbers of living humans.  In accordance with engineering practice, which (arbitrarily) assigns measurement units only to real-valued quantities and not to integer-valued quantities, this model lists the population as dimensionless. <p>
 
This model is described on p.142 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
      end Population_Dynamics;

      block Service_Sector_Investment "Investments in the service sector"
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 20 "Controlled average life of service sector capital";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        SystemDynamics.Sources.Source Source1 annotation(
          Placement(visible = true, transformation(origin = {-170.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Serv_Cap_Invest "p.230 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-120.0, 30.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Levels.Level Service_Capital(x0 = service_capital_init) "p.230 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-60.0, 30.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Rates.RRate Serv_Cap_Deprec "p.231 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, 30.0}, extent = {{-15.0, -15.0}, {15.0, 15.0}}, rotation = 0)));
        SystemDynamics.Sources.Sink Sink1 annotation(
          Placement(visible = true, transformation(origin = {50.0, 30.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Auxiliary.Prod_2 Serv_Cap_Inv "p.230 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-120.0, -10.0}, extent = {{-12.0, -12.0}, {12.0, 12.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Serv_Cap_Dep "p.231 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {0.0, -12.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = -270)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Avg_Life_Serv_Cap S_Avg_Life_Serv_Cap(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2) "p.231 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {43.0, -36.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.Service_Output Service_Output "p.231 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-70.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Serv_Cap_Out_Ratio S_Serv_Cap_Out_Ratio(t_policy_year = t_policy_year, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2) "p.232 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-2.0, 80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_FIOA_Serv S_FIOA_Serv(t_policy_year = t_policy_year) "p.229 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-105.0, -80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Fr_IO_Al_Serv_1(x_vals = {0, 0.5, 1, 1.5, 2, 5}, y_vals = {0.3, 0.2, 0.1, 0.05, 0, 0}) "p.229 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-42.0, -60.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Fr_IO_Al_Serv_2(x_vals = {0, 0.5, 1, 1.5, 2, 5}, y_vals = {0.3, 0.2, 0.1, 0.05, 0, 0}) "p.229 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-42.0, -100.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Div1 "p.229 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {10.0, -80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Utilities.S_Indic_Serv_PC S_Indic_Serv_PC(t_policy_year = t_policy_year) "p.227 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {63.0, -100.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Indic_Serv_PC_1(x_vals = 0:200:1600, y_vals = {40, 300, 640, 1000, 1220, 1450, 1650, 1800, 2000}) "p.227 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {128.0, -80.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Functions.Tabular P_Indic_Serv_PC_2(x_vals = 0:200:1600, y_vals = {40, 300, 640, 1000, 1220, 1450, 1650, 1800, 2000}) "p.227 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {128.0, -120.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = 0)));
        Modelica.Blocks.Math.Division Serv_Out_PC "p.232 of Dynamics of Growth in a Finite World" annotation(
          Placement(visible = true, transformation(origin = {-110.0, 102.0}, extent = {{10.0, -10.0}, {-10.0, 10.0}}, rotation = -90)));
        SystemDynamics.Interfaces.MassInPort population "Population" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort capital_util_fr "Capital utilization fraction" annotation(
          Placement(visible = true, transformation(origin = {-210.0, 110.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, 60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort industrial_output(unit = "dollar/yr") "Annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -20.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassInPort ind_out_pc(unit = "dollar/yr") "Per capita annual industrial output" annotation(
          Placement(visible = true, transformation(origin = {-210.0, -130.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {-110.0, -60.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort serv_out_pc(unit = "dollar/yr") "Per capita annual expenditure in services" annotation(
          Placement(visible = true, transformation(origin = {210.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort service_capital(unit = "dollar") "Total capital invested in service sector" annotation(
          Placement(visible = true, transformation(origin = {210.0, -10.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, 0.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
        SystemDynamics.Interfaces.MassOutPort s_fioa_serv "Fraction of total investments allocated to the service sector" annotation(
          Placement(visible = true, transformation(origin = {210.0, -70.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0), iconTransformation(origin = {110.0, -50.0}, extent = {{-10.0, -10.0}, {10.0, 10.0}}, rotation = 0)));
      equation
        connect(Service_Output.u1, capital_util_fr) annotation(
          Line(visible = true, points = {{-61.0, 86.0}, {-36.0, 86.0}, {-36.0, 130.0}, {-180.0, 130.0}, {-180.0, 110.0}, {-210.0, 110.0}}, color = {0, 0, 191}));
        connect(Service_Output.u3, Service_Capital.y1) annotation(
          Line(visible = true, points = {{-61.0, 74.0}, {-36.0, 74.0}, {-36.0, 38.25}, {-47.25, 38.25}}, color = {0, 0, 191}));
        connect(service_capital, Service_Capital.y2) annotation(
          Line(visible = true, points = {{210.0, -10.0}, {180.0, -10.0}, {180.0, 8.0}, {-48.75, 8.0}, {-48.75, 20.25}}, color = {0, 0, 191}));
        connect(Serv_Cap_Dep.u1, Service_Capital.y3) annotation(
          Line(visible = true, points = {{-6.0, -24.0}, {-6.0, -36.0}, {-60.0, -36.0}, {-60.0, 20.25}}, color = {0, 0, 191}));
        connect(P_Fr_IO_Al_Serv_1.y, S_FIOA_Serv.u1) annotation(
          Line(visible = true, points = {{-53.0, -60.0}, {-80.0, -60.0}, {-80.0, -76.0}, {-96.0, -76.0}}, color = {0, 0, 191}));
        connect(P_Fr_IO_Al_Serv_2.y, S_FIOA_Serv.u2) annotation(
          Line(visible = true, points = {{-53.0, -100.0}, {-80.0, -100.0}, {-80.0, -84.0}, {-96.0, -84.0}}, color = {0, 0, 191}));
        connect(P_Indic_Serv_PC_1.y, S_Indic_Serv_PC.u1) annotation(
          Line(visible = true, points = {{117.0, -80.0}, {90.0, -80.0}, {90.0, -96.0}, {72.0, -96.0}}, color = {0, 0, 191}));
        connect(P_Indic_Serv_PC_2.y, S_Indic_Serv_PC.u2) annotation(
          Line(visible = true, points = {{117.0, -120.0}, {90.0, -120.0}, {90.0, -104.0}, {72.0, -104.0}}, color = {0, 0, 191}));
        connect(P_Indic_Serv_PC_1.u, P_Indic_Serv_PC_2.u) annotation(
          Line(visible = true, points = {{136.0, -80.0}, {160.0, -80.0}, {160.0, -120.0}, {136.0, -120.0}}, color = {0, 0, 191}));
        connect(P_Indic_Serv_PC_2.u, ind_out_pc) annotation(
          Line(visible = true, points = {{136.0, -120.0}, {160.0, -120.0}, {160.0, -140.0}, {-180.0, -140.0}, {-180.0, -130.0}, {-210.0, -130.0}}, color = {0, 0, 191}));
        connect(S_Indic_Serv_PC.y, Div1.u2) annotation(
          Line(visible = true, points = {{54.0, -100.0}, {30.0, -100.0}, {30.0, -86.0}, {22.0, -86.0}}, color = {0, 0, 191}));
        connect(S_Avg_Life_Serv_Cap.y, Serv_Cap_Dep.u2) annotation(
          Line(visible = true, origin = {15.3333, -32.0}, points = {{18.6667, -4.0}, {-9.3333, -4.0}, {-9.3333, 8.0}}, color = {0, 0, 191}));
        connect(Div1.y, P_Fr_IO_Al_Serv_2.u) annotation(
          Line(visible = true, points = {{-1.0, -80.0}, {-10.0, -80.0}, {-10.0, -100.0}, {-34.0, -100.0}}, color = {0, 0, 191}));
        connect(Div1.y, P_Fr_IO_Al_Serv_1.u) annotation(
          Line(visible = true, points = {{-1.0, -80.0}, {-10.0, -80.0}, {-10.0, -60.0}, {-34.0, -60.0}}, color = {0, 0, 191}));
        connect(S_FIOA_Serv.y, s_fioa_serv) annotation(
          Line(visible = true, points = {{-114.0, -80.0}, {-130.0, -80.0}, {-130.0, -150.0}, {180.0, -150.0}, {180.0, -70.0}, {210.0, -70.0}}, color = {0, 0, 191}));
        connect(S_FIOA_Serv.y, Serv_Cap_Inv.u2) annotation(
          Line(visible = true, points = {{-114.0, -80.0}, {-130.0, -80.0}, {-130.0, -40.0}, {-100.0, -40.0}, {-100.0, -10.0}, {-111.6, -10.0}}, color = {0, 0, 191}));
        connect(Serv_Cap_Dep.y, Serv_Cap_Deprec.u) annotation(
          Line(visible = true, points = {{0.0, -1.0}, {0.0, 7.55}, {0.0, 7.55}, {0.0, 14.25}}, color = {0, 0, 191}));
        connect(Serv_Cap_Deprec.y1, Sink1.MassInPort1) annotation(
          Line(visible = true, origin = {23.25, 30.0}, points = {{-15.75, 0.0}, {15.75, 0.0}}, color = {95, 0, 191}));
        connect(Service_Capital.u2, Serv_Cap_Deprec.y) annotation(
          Line(visible = true, origin = {-25.5, 30.0}, points = {{-18.0, 0.0}, {18.0, 0.0}}, color = {95, 0, 191}));
        connect(Serv_Cap_Invest.y1, Service_Capital.u1) annotation(
          Line(visible = true, origin = {-94.5, 30.0}, points = {{-18.0, 0.0}, {18.0, 0.0}}, color = {95, 0, 191}));
        connect(Serv_Cap_Inv.y, Serv_Cap_Invest.u) annotation(
          Line(visible = true, origin = {-120.0, 6.325}, points = {{0.0, -7.925}, {0.0, 7.925}}, color = {0, 0, 191}));
        connect(Source1.MassInPort1, Serv_Cap_Invest.y) annotation(
          Line(visible = true, origin = {-143.25, 30.0}, points = {{-15.75, 0.0}, {15.75, 0.0}}, color = {95, 0, 191}));
        connect(S_Serv_Cap_Out_Ratio.y, Service_Output.u2) annotation(
          Line(visible = true, origin = {-36.0, 80.0}, points = {{25.0, 0.0}, {-25.0, 0.0}}, color = {0, 0, 191}));
        connect(Serv_Out_PC.u1, Service_Output.y) annotation(
          Line(visible = true, origin = {-95.6667, 83.3333}, points = {{-8.3333, 6.6667}, {-8.3333, -3.3333}, {16.6667, -3.3333}}, color = {0, 0, 191}));
        connect(Serv_Out_PC.y, serv_out_pc) annotation(
          Line(visible = true, points = {{-110.0, 113.0}, {-110.0, 120.0}, {180.0, 120.0}, {180.0, 50.0}, {210.0, 50.0}}, color = {0, 0, 191}));
        connect(Serv_Out_PC.u2, population) annotation(
          Line(visible = true, origin = {-147.3333, 63.3333}, points = {{31.3333, 26.6667}, {31.3333, -13.3333}, {-62.6667, -13.3333}}, color = {0, 0, 191}));
        connect(Serv_Out_PC.y, Div1.u1) annotation(
          Line(visible = true, points = {{-110.0, 113.0}, {-110.0, 120.0}, {80.0, 120.0}, {80.0, -74.0}, {22.0, -74.0}}, color = {0, 0, 191}));
        connect(Serv_Cap_Inv.u1, industrial_output) annotation(
          Line(points = {{-128.4, -10.0}, {-180.0, -10.0}, {-180.0, -70.0}, {-210.0, -70.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {170, 255, 170}, fillPattern = FillPattern.Solid, lineThickness = 1.0, extent = {{-100.0, -100.0}, {100.0, 100.0}}, radius = 0.5), Text(visible = true, origin = {0.1825, 50.0}, fillPattern = FillPattern.Solid, extent = {{-59.8175, -36.6918}, {59.8175, 36.6918}}, textString = "Service", fontSize = 102.0, fontName = "Arial"), Text(visible = true, origin = {-0.0, -50.0}, fillPattern = FillPattern.Solid, extent = {{-95.1836, -20.8986}, {95.1836, 20.8986}}, textString = "Investment", fontSize = 102.0, fontName = "Arial"), Text(visible = true, fillPattern = FillPattern.Solid, extent = {{-62.5202, -36.6918}, {62.5202, 36.6918}}, textString = "Sector", fontSize = 102.0, fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-200.0, -160.0}, {200.0, 140.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-11.0, -81.0}, {-9.0, -79.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{159.0, -121.0}, {161.0, -119.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{79.0, 119.0}, {81.0, 121.0}}), Ellipse(visible = true, lineColor = {0, 0, 191}, fillColor = {0, 0, 191}, fillPattern = FillPattern.Solid, extent = {{-131.0, -81.0}, {-129.0, -79.0}})}),
          Documentation(info = "<html>
This model calculates the capital invested in the service sector. <p>
 
Whereas the earlier <font color=red><b>WORLD2</b></font> model lumped all capital investment into a single state variable from which it then split off the percentage of capital invested in the agricultural sector as a second state variable (a funny choice for a state variable, since percentages don't accumulate), the more modern <font color=red><b>WORLD3</b></font> model differentiates between capital invested in industry, capital invested in the service sector, capital invested in agriculture, and other capital investment. <p>
 
The service capital is measured in U.S. dollars.
</html>"));
      end Service_Sector_Investment;

      model Scenario_1 "Original WORLD3 model"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 400 "Desired annual industrial per capita output";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2 "Controlled average life of agricultural input";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 14 "Controlled average life of industrial capital";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 20 "Controlled average life of service sector capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real reproductive_lifetime(unit = "yr") = 30.0 "Reproductive life time";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_fcaor_time(unit = "yr") = 4000 "Year of capital allocation to resource use efficiency";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 4000 "Year of continued fertility change";
        parameter Real t_ind_equil_time(unit = "yr") = 4000 "Year of industrial equilibrium";
        parameter Real t_land_life_time(unit = "yr") = 4000 "Land life time";
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 4000 "Time to zero population growth";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_ppoll_tech_chg_mlt[:] = {0, 0, 0, 0} "Persistent pollution technology change multiplier";
        parameter Real p_res_tech_chg_mlt[:] = {0, 0, 0, 0} "Resource technology change multiplier";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0, 0} "Yield technology change multiplier";
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real nr_resources_init(unit = "ton") = 1000000000000.0 "Initial available non-recoverable resources";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        output Real population "Total human world population";
        output Real food(unit = "dollar/yr") "Total annually produced food";
        output Real industrial_output(unit = "dollar/yr") "Total annual world industrial output";
        output Real ppoll_index "Persistent pollution index";
        output Real nr_resources "Remaining non-recoverable natural resources";
        output Real fioa_ind "Fraction of industrial output allocated to industrial/military complex";
        output Real s_fioa_agr "Fraction of industrial output allocated to food production";
        output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        output Real life_expectancy(unit = "yr") "Life expectancy";
        output Real food_pc(unit = "dollar/yr") "Total annual food per person";
        output Real serv_out_pc(unit = "dollar/yr") "Total annual services per person";
        output Real ind_out_pc(unit = "dollar/yr") "Total annual consumer goods per person";
        output Real human_ecological_footprint(unit = "Gha") "Human ecological footprint";
        output Real human_welfare_index "Human welfare index";
        SystemDynamics.WorldDynamics.World3.Population_Dynamics Population_Dynamics1(pop1_init = pop1_init, pop2_init = pop2_init, pop3_init = pop3_init, pop4_init = pop4_init, labor_force_partic = labor_force_partic, reproductive_lifetime = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "Population dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Pollution_Dynamics Pollution_Dynamics1(agr_mtl_toxic_index = agr_mtl_toxic_index, assim_half_life_1970 = assim_half_life_1970, des_ppoll_index_DPOLX = des_ppoll_index_DPOLX, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl, frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index, ind_out_in_1970 = ind_out_in_1970, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1, pers_pollution_init = pers_pollution_init, ppoll_in_1970 = ppoll_in_1970, ppoll_tech_init = ppoll_tech_init, ppoll_trans_del = ppoll_trans_del, t_air_poll_time = t_air_poll_time, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, p_ppoll_tech_chg_mlt = p_ppoll_tech_chg_mlt) "Persistent pollution generation" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Arable_Land_Dynamics Arable_Land_Dynamics1(arable_land_init = arable_land_init, avg_life_land_norm = avg_life_land_norm, inherent_land_fert = inherent_land_fert, pot_arable_land_init = pot_arable_land_init, pot_arable_land_tot = pot_arable_land_tot, social_discount = social_discount, t_land_life_time = t_land_life_time, urban_ind_land_init = urban_ind_land_init, urb_ind_land_dev_time = urb_ind_land_dev_time) "Arable land dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Food_Production Food_Production1(agr_inp_init = agr_inp_init, food_short_perc_del = food_short_perc_del, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2, p_land_yield_fact_1 = p_land_yield_fact_1, perc_food_ratio_init = perc_food_ratio_init, processing_loss = processing_loss, subsist_food_pc = subsist_food_pc, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, land_fr_harvested = land_fr_harvested) "Food production" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Ecological_Footprint Human_Ecological_Footprint1 "Human ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {340.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Fertility Human_Fertility1(des_compl_fam_size_norm = des_compl_fam_size_norm, hlth_serv_impact_del = hlth_serv_impact_del, income_expect_avg_time = income_expect_avg_time, lifet_perc_del = lifet_perc_del, max_tot_fert_norm = max_tot_fert_norm, social_adj_del = social_adj_del, t_fert_cont_eff_time = t_fert_cont_eff_time, t_zero_pop_grow_time = t_zero_pop_grow_time) "Human fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Welfare_Index Human_Welfare_Index1 "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {340.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Industrial_Investment Industrial_Investment1(industrial_capital_init = industrial_capital_init, ind_out_pc_des = ind_out_pc_des, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2, p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1, t_ind_equil_time = t_ind_equil_time, t_policy_year = t_policy_year) "Industrial investment" annotation(
          Placement(visible = true, transformation(origin = {120.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Labor_Utilization Labor_Utilization1(labor_util_fr_del_init = labor_util_fr_del_init, labor_util_fr_del_time = labor_util_fr_del_time) "Labor utilization" annotation(
          Placement(visible = true, transformation(origin = {120.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Land_Fertility Land_Fertility1(des_food_ratio_dfr = des_food_ratio_dfr, inherent_land_fert = inherent_land_fert, land_fertility_init = land_fertility_init, t_policy_year = t_policy_year, yield_tech_init = yield_tech_init, p_yield_tech_chg_mlt = p_yield_tech_chg_mlt) "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Life_Expectancy Life_Expectancy1(hlth_serv_impact_del = hlth_serv_impact_del, life_expect_norm = life_expect_norm, subsist_food_pc = subsist_food_pc) "Life expectancy" annotation(
          Placement(visible = true, transformation(origin = {340.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.NR_Resource_Utilization NR_Resource_Utilization1(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR, nr_resources_init = nr_resources_init, p_nr_res_use_fact_1 = p_nr_res_use_fact_1, res_tech_init = res_tech_init, t_policy_year = t_policy_year, t_fcaor_time = t_fcaor_time, tech_dev_del_TDD = tech_dev_del_TDD, p_fr_cap_al_obt_res_2 = p_fr_cap_al_obt_res_2, p_res_tech_chg_mlt = p_res_tech_chg_mlt) "Non-recoverable natural resource utilization" annotation(
          Placement(visible = true, transformation(origin = {340.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Service_Sector_Investment Service_Sector_Investment1(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2, service_capital_init = service_capital_init) "Service sector investment" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -220.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
      equation
        connect(Food_Production1.tot_agric_invest, Arable_Land_Dynamics1.tot_agric_invest) annotation(
          Line(visible = true, points = {{-88.0, -98.0}, {-88.0, -52.0}, {-200.0, -52.0}, {-200.0, -20.0}, {-122.0, -20.0}}, color = {0, 0, 191}));
        connect(Food_Production1.yield_tech_mult_icor_COYM, Industrial_Investment1.yield_tech_mult_icor_COYM) annotation(
          Line(visible = true, points = {{-96.0, -142.0}, {-96.0, -174.0}, {28.0, -174.0}, {28.0, 96.0}, {98.0, 96.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.urban_ind_land, Human_Ecological_Footprint1.urban_ind_land) annotation(
          Line(visible = true, points = {{-78.0, -30.0}, {-24.0, -30.0}, {-24.0, 136.0}, {252.0, 136.0}, {252.0, 180.0}, {318.0, 180.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_gen_rt, Human_Ecological_Footprint1.ppoll_gen_rt) annotation(
          Line(visible = true, points = {{-78.0, 64.0}, {-20.0, 64.0}, {-20.0, 148.0}, {256.0, 148.0}, {256.0, 170.0}, {318.0, 170.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.s_fr_cap_al_obt_res, Industrial_Investment1.s_fr_cap_al_obt_res) annotation(
          Line(visible = true, points = {{362.0, -132.0}, {432.0, -132.0}, {432.0, 132.0}, {44.0, 132.0}, {44.0, 72.0}, {98.0, 72.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.capital_util_fr, Industrial_Investment1.capital_util_fr) annotation(
          Line(visible = true, points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {24.0, -180.0}, {24.0, 80.0}, {98.0, 80.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.ind_cap_out_ratio_2_ICOR2T, Industrial_Investment1.ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(visible = true, points = {{362.0, -124.0}, {428.0, -124.0}, {428.0, 120.0}, {108.0, 120.0}, {108.0, 102.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_tech_mult_icor_COPM, Industrial_Investment1.ppoll_tech_mult_icor_COPM) annotation(
          Line(visible = true, points = {{-78.0, 88.0}, {98.0, 88.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.capital_util_fr, Service_Sector_Investment1.capital_util_fr) annotation(
          Line(visible = true, points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {-172.0, -180.0}, {-172.0, -208.0}, {-122.0, -208.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.s_yield_mlt_air_poll, Food_Production1.s_yield_mlt_air_poll) annotation(
          Line(visible = true, points = {{-78.0, 72.0}, {32.0, 72.0}, {32.0, -168.0}, {-104.0, -168.0}, {-104.0, -142.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.fr_inp_al_land_dev, Food_Production1.fr_inp_al_land_dev) annotation(
          Line(visible = true, points = {{-78.0, -10.0}, {-28.0, -10.0}, {-28.0, -68.0}, {-172.0, -68.0}, {-172.0, -120.0}, {-122.0, -120.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.yield_tech_LYTD, Food_Production1.yield_tech_LYTD) annotation(
          Line(visible = true, points = {{142.0, -110.0}, {192.0, -110.0}, {192.0, -82.0}, {-112.0, -82.0}, {-112.0, -87.9893}, {-112.0, -98.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.pc_res_use_mlt, Pollution_Dynamics1.pc_res_use_mlt) annotation(
          Line(visible = true, points = {{362.0, -108.0}, {424.0, -108.0}, {424.0, 124.0}, {-176.0, 124.0}, {-176.0, 96.0}, {-122.0, 96.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.life_expectancy, Population_Dynamics1.life_expectancy) annotation(
          Line(visible = true, points = {{98.0, 180.0}, {32.0, 180.0}, {32.0, 128.0}, {-190.0, 128.0}, {-190.0, 170.0}, {-122.0, 170.0}}, color = {0, 0, 191}));
        connect(Human_Welfare_Index1.life_expectancy, Human_Fertility1.life_expectancy) annotation(
          Line(visible = true, points = {{318.0, 90.0}, {250.0, 90.0}, {250.0, 128.0}, {32.0, 128.0}, {32.0, 180.0}, {98.0, 180.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.life_expectancy, Human_Welfare_Index1.life_expectancy) annotation(
          Line(visible = true, points = {{362.0, -20.0}, {420.0, -20.0}, {420.0, 40.0}, {250.0, 40.0}, {250.0, 90.0}, {318.0, 90.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_capital, Labor_Utilization1.industrial_capital) annotation(
          Line(visible = true, points = {{142.0, 76.0}, {196.0, 76.0}, {196.0, -78.0}, {44.0, -78.0}, {44.0, -20.0}, {98.0, -20.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.total_fertility, Population_Dynamics1.total_fertility) annotation(
          Line(visible = true, points = {{142.0, 180.0}, {196.0, 180.0}, {196.0, 144.0}, {-200.0, 144.0}, {-200.0, 190.0}, {-122.0, 190.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.labor_force, Labor_Utilization1.labor_force) annotation(
          Line(visible = true, points = {{-78.0, 170.0}, {12.0, 170.0}, {12.0, -60.0}, {108.0, -60.0}, {108.0, -42.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.s_fioa_serv, Industrial_Investment1.s_fioa_serv) annotation(
          Line(visible = true, points = {{-78.0, -230.0}, {16.0, -230.0}, {16.0, 38.0}, {108.0, 38.0}, {108.0, 58.0}}, color = {0, 0, 191}));
        connect(Food_Production1.p_fr_inp_for_land_maint, Land_Fertility1.p_fr_inp_for_land_maint) annotation(
          Line(visible = true, points = {{-88.0, -142.0}, {-88.0, -160.0}, {44.0, -160.0}, {44.0, -120.0}, {98.0, -120.0}}, color = {0, 0, 191}));
        connect(Food_Production1.s_fioa_agr, Industrial_Investment1.s_fioa_agr) annotation(
          Line(visible = true, points = {{-78.0, -136.0}, {-4.0, -136.0}, {-4.0, 64.0}, {98.0, 64.0}}, color = {0, 0, 191}));
        connect(Food_Production1.agr_inp_per_hect, Labor_Utilization1.agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -28.0}, {98.0, -28.0}}, color = {0, 0, 191}));
        connect(Food_Production1.agr_inp_per_hect, Pollution_Dynamics1.agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -56.0}, {-196.0, -56.0}, {-196.0, 72.0}, {-122.0, 72.0}}, color = {0, 0, 191}));
        connect(Food_Production1.marg_prod_agr_inp, Arable_Land_Dynamics1.marg_prod_agr_inp) annotation(
          Line(visible = true, points = {{-78.0, -120.0}, {-24.0, -120.0}, {-24.0, -64.0}, {-172.0, -64.0}, {-172.0, -12.0}, {-122.0, -12.0}}, color = {0, 0, 191}));
        connect(Food_Production1.food_pc, Life_Expectancy1.food_pc) annotation(
          Line(visible = true, points = {{-96.0, -98.0}, {-96.0, -74.0}, {256.0, -74.0}, {256.0, -28.0}, {318.0, -28.0}}, color = {0, 0, 191}));
        connect(Food_Production1.land_yield, Arable_Land_Dynamics1.land_yield) annotation(
          Line(visible = true, points = {{-78.0, -112.0}, {-20.0, -112.0}, {-20.0, -60.0}, {-192.0, -60.0}, {-192.0, -4.0}, {-122.0, -4.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.ppoll_index, Life_Expectancy1.ppoll_index) annotation(
          Line(visible = true, points = {{98.0, -130.0}, {20.0, -130.0}, {20.0, -70.0}, {268.0, -70.0}, {268.0, -36.0}, {318.0, -36.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_index, Land_Fertility1.ppoll_index) annotation(
          Line(visible = true, points = {{-78.0, 80.0}, {20.0, 80.0}, {20.0, -130.0}, {98.0, -130.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(visible = true, points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 18.0}, {70.0, 18.0}, {108.0, 18.0}, {108.0, 2.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.serv_out_pc, Human_Fertility1.serv_out_pc) annotation(
          Line(visible = true, points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 190.0}, {98.0, 190.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, NR_Resource_Utilization1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -110.0}, {318.0, -110.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Life_Expectancy1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -12.0}, {318.0, -12.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Human_Welfare_Index1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 70.0}, {318.0, 70.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.ind_out_pc, Labor_Utilization1.ind_out_pc) annotation(
          Line(visible = true, points = {{98.0, 170.0}, {36.0, 170.0}, {36.0, -12.0}, {98.0, -12.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Human_Fertility1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {36.0, 30.0}, {36.0, 170.0}, {98.0, 170.0}}, color = {0, 0, 191}));
        connect(Food_Production1.ind_out_pc, Service_Sector_Investment1.ind_out_pc) annotation(
          Line(visible = true, points = {{-122.0, -128.0}, {-188.0, -128.0}, {-188.0, -232.0}, {-122.0, -232.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.ind_out_pc, Food_Production1.ind_out_pc) annotation(
          Line(visible = true, points = {{-122.0, -28.0}, {-188.0, -28.0}, {-188.0, -128.0}, {-122.0, -128.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Arable_Land_Dynamics1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {-188.0, 30.0}, {-188.0, -28.0}, {-122.0, -28.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_output, NR_Resource_Utilization1.industrial_output) annotation(
          Line(visible = true, points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, -130.0}, {318.0, -130.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.industrial_output, Food_Production1.industrial_output) annotation(
          Line(visible = true, points = {{-122.0, 80.0}, {-184.0, 80.0}, {-184.0, -136.0}, {-122.0, -136.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_output, Pollution_Dynamics1.industrial_output) annotation(
          Line(visible = true, points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, 22.0}, {-184.0, 22.0}, {-184.0, 80.0}, {-122.0, 80.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.arable_land, Human_Ecological_Footprint1.arable_land) annotation(
          Line(visible = true, points = {{98.0, -36.0}, {40.0, -36.0}, {40.0, -64.0}, {264.0, -64.0}, {264.0, 190.0}, {318.0, 190.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.arable_land, Labor_Utilization1.arable_land) annotation(
          Line(visible = true, points = {{-78.0, -20.0}, {40.0, -20.0}, {40.0, -36.0}, {98.0, -36.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.arable_land, Food_Production1.arable_land) annotation(
          Line(visible = true, points = {{-122.0, 64.0}, {-176.0, 64.0}, {-176.0, -112.0}, {-122.0, -112.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.arable_land, Pollution_Dynamics1.arable_land) annotation(
          Line(visible = true, points = {{-78.0, -20.0}, {-20.0, -20.0}, {-20.0, 26.0}, {-176.0, 26.0}, {-176.0, 64.0}, {-122.0, 64.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.population, NR_Resource_Utilization1.population) annotation(
          Line(visible = true, points = {{318.0, -20.0}, {260.0, -20.0}, {260.0, -120.0}, {318.0, -120.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.population, Life_Expectancy1.population) annotation(
          Line(visible = true, points = {{116.0, 58.0}, {116.0, 34.0}, {260.0, 34.0}, {260.0, -20.0}, {318.0, -20.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.population, Industrial_Investment1.population) annotation(
          Line(visible = true, points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 34.0}, {116.0, 34.0}, {116.0, 58.0}}, color = {0, 0, 191}));
        connect(Food_Production1.population, Service_Sector_Investment1.population) annotation(
          Line(visible = true, points = {{-122.0, -104.0}, {-180.0, -104.0}, {-180.0, -216.0}, {-122.0, -216.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.population, Food_Production1.population) annotation(
          Line(visible = true, points = {{-122.0, -36.0}, {-180.0, -36.0}, {-180.0, -104.0}, {-122.0, -104.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.population, Arable_Land_Dynamics1.population) annotation(
          Line(visible = true, points = {{-122.0, 88.0}, {-180.0, 88.0}, {-180.0, -36.0}, {-122.0, -36.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.population, Pollution_Dynamics1.population) annotation(
          Line(visible = true, points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 140.0}, {-180.0, 140.0}, {-180.0, 88.0}, {-122.0, 88.0}}, color = {0, 0, 191}));
        connect(Food_Production1.food_ratio, Land_Fertility1.food_ratio) annotation(
          Line(visible = true, points = {{-78.0, -104.0}, {10.0, -104.0}, {10.0, -110.0}, {98.0, -110.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(visible = true, points = {{318.0, -4.0}, {218.0, -4.0}, {218.0, 18.0}, {108.0, 18.0}, {108.0, 18.0}, {108.0, 2.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.service_capital, Labor_Utilization1.service_capital) annotation(
          Line(visible = true, points = {{-78.0, -220.0}, {4.0, -220.0}, {4.0, -4.0}, {98.0, -4.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.land_fertility, Food_Production1.land_fertility) annotation(
          Line(visible = true, points = {{142.0, -120.0}, {192.0, -120.0}, {192.0, -164.0}, {-112.0, -164.0}, {-112.0, -142.0}}, color = {0, 0, 191}));
        connect(Food_Production1.industrial_output, Service_Sector_Investment1.industrial_output) annotation(
          Line(visible = true, origin = {0.6153, 6.0}, points = {{-122.6153, -142.0}, {-184.0, -142.0}, {-184.0, -230.0}, {-122.6153, -230.0}}, color = {0, 0, 191}));
        population = Population_Dynamics1.Population.y;
        food = Food_Production1.Food.food;
        industrial_output = Industrial_Investment1.Industrial_Output.industrial_output;
        ppoll_index = Pollution_Dynamics1.PPoll_Index.y;
        nr_resources = NR_Resource_Utilization1.NR_Resources.y;
        fioa_ind = Industrial_Investment1.FIOA_Ind.fioa_ind;
        s_fioa_agr = Food_Production1.S_FIOA_Agr.s_fioa_agr;
        s_fioa_cons = Industrial_Investment1.S_FIOA_Cons.s_fioa_cons;
        s_fioa_serv = Service_Sector_Investment1.S_FIOA_Serv.s_fioa_serv;
        s_fr_cap_al_obt_res = NR_Resource_Utilization1.S_Fr_Cap_Al_Obt_Res.s_fr_cap_al_obt_res;
        life_expectancy = Life_Expectancy1.Life_Expectancy.y;
        food_pc = Food_Production1.Food_PC.y;
        serv_out_pc = Service_Sector_Investment1.Serv_Out_PC.y;
        ind_out_pc = Industrial_Investment1.Ind_Out_PC.y;
        human_ecological_footprint = Human_Ecological_Footprint1.HEF_Human_Ecological_Footprint.hef_human_ecological_footprint;
        human_welfare_index = Human_Welfare_Index1.HWI_Human_Welfare_Index.hwi_human_welfare_index;
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-220.0, -260.0}, {442.0, 222.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-70.0, 104.0}, {296.0, 172.0}}, textString = "Meadows'", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-78.0, -20.0}, {296.0, 46.0}}, textString = "Original", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-70.0, -98.0}, {296.0, -30.0}}, textString = "World Model", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
          experiment(StartTime = 1900, StopTime = 2100),
          experimentSetupOutput,
          Documentation(info = "<html>
This is the original <font color=red><b>WORLD3</b></font> model without any interventions.  In the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> it is referred to as <font color=red><b>Scenario #1</b></font>. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.L., W.W. Behrens III, D.M., Meadows, R.F. Naill, J. Randers, and E.K.O. Zahn (1974), <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>, Wright-Allen Press, 637p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
 
Simulate the model from 1900 until 2100, and display the same variables as in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> at page 169: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_1.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_2.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_3.png\"> <p>
 
<hr> <p>
 
The results obtained are not exactly the same as those shown in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> due to the integration algorithm in use.  Most <font color=red><b>Modelica</b></font> simulation environments uses by default a variable-step / variable-order DASSL algorithm, whereas <font color=red><b>STELLA</b></font>, just like the older <font color=red><b>Dynamo</b></font> software, uses by default a fixed-step Euler algorithm with a step size of 1 time unit. <p>
 
A second even more important difference is that my <font color=red><b>Modelica</b></font> code treats all variables as real-valued floating-point numbers, whereas the <font color=red><b>STELLA</b></font> model treated some variables (e.g., population) as integers, whereas it treated other variables as fixed-point variables with only two significant digits after the comma.  This led to a quite noticeable quantization error. <p>
 
As I didn't see any good reason for unnecessarily mutilating the capabilities of the <font color=red><b>Modelica</b></font> simulation environment, I decided not to replicate these features of the <font color=red><b>STELLA</b></font> code here. <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_1;

      model Scenario_2 "More abundant non-recoverable natural resources"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 400 "Desired annual industrial per capita output";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2 "Controlled average life of agricultural input";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 14 "Controlled average life of industrial capital";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 20 "Controlled average life of service sector capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real reproductive_lifetime(unit = "yr") = 30.0 "Reproductive life time";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_fcaor_time(unit = "yr") = 2002 "Year of capital allocation to resource use efficiency";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 4000 "Year of continued fertility change";
        parameter Real t_ind_equil_time(unit = "yr") = 4000 "Year of industrial equilibrium";
        parameter Real t_land_life_time(unit = "yr") = 4000 "Land life time";
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 4000 "Time to zero population growth";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_ppoll_tech_chg_mlt[:] = {0, 0, 0, 0} "Persistent pollution technology change multiplier";
        parameter Real p_res_tech_chg_mlt[:] = {0, 0, 0, 0} "Resource technology change multiplier";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0, 0} "Yield technology change multiplier";
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real nr_resources_init(unit = "ton") = 2000000000000.0 "Initial available non-recoverable resources";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        output Real population "Total human world population";
        output Real food(unit = "dollar/yr") "Total annually produced food";
        output Real industrial_output(unit = "dollar/yr") "Total annual world industrial output";
        output Real ppoll_index "Persistent pollution index";
        output Real nr_resources "Remaining non-recoverable natural resources";
        output Real fioa_ind "Fraction of industrial output allocated to industrial/military complex";
        output Real s_fioa_agr "Fraction of industrial output allocated to food production";
        output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        output Real life_expectancy(unit = "yr") "Life expectancy";
        output Real food_pc(unit = "dollar/yr") "Total annual food per person";
        output Real serv_out_pc(unit = "dollar/yr") "Total annual services per person";
        output Real ind_out_pc(unit = "dollar/yr") "Total annual consumer goods per person";
        output Real human_ecological_footprint(unit = "Gha") "Human ecological footprint";
        output Real human_welfare_index "Human welfare index";
        SystemDynamics.WorldDynamics.World3.Population_Dynamics Population_Dynamics1(pop1_init = pop1_init, pop2_init = pop2_init, pop3_init = pop3_init, pop4_init = pop4_init, labor_force_partic = labor_force_partic, reproductive_lifetime = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "Population dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Pollution_Dynamics Pollution_Dynamics1(agr_mtl_toxic_index = agr_mtl_toxic_index, assim_half_life_1970 = assim_half_life_1970, des_ppoll_index_DPOLX = des_ppoll_index_DPOLX, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl, frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index, ind_out_in_1970 = ind_out_in_1970, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1, pers_pollution_init = pers_pollution_init, ppoll_in_1970 = ppoll_in_1970, ppoll_tech_init = ppoll_tech_init, ppoll_trans_del = ppoll_trans_del, t_air_poll_time = t_air_poll_time, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, p_ppoll_tech_chg_mlt = p_ppoll_tech_chg_mlt) "Persistent pollution generation" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Arable_Land_Dynamics Arable_Land_Dynamics1(arable_land_init = arable_land_init, avg_life_land_norm = avg_life_land_norm, inherent_land_fert = inherent_land_fert, pot_arable_land_init = pot_arable_land_init, pot_arable_land_tot = pot_arable_land_tot, social_discount = social_discount, t_land_life_time = t_land_life_time, urban_ind_land_init = urban_ind_land_init, urb_ind_land_dev_time = urb_ind_land_dev_time) "Arable land dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Food_Production Food_Production1(agr_inp_init = agr_inp_init, food_short_perc_del = food_short_perc_del, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2, p_land_yield_fact_1 = p_land_yield_fact_1, perc_food_ratio_init = perc_food_ratio_init, processing_loss = processing_loss, subsist_food_pc = subsist_food_pc, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, land_fr_harvested = land_fr_harvested) "Food production" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Ecological_Footprint Human_Ecological_Footprint1 "Human ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {340.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Fertility Human_Fertility1(des_compl_fam_size_norm = des_compl_fam_size_norm, hlth_serv_impact_del = hlth_serv_impact_del, income_expect_avg_time = income_expect_avg_time, lifet_perc_del = lifet_perc_del, max_tot_fert_norm = max_tot_fert_norm, social_adj_del = social_adj_del, t_fert_cont_eff_time = t_fert_cont_eff_time, t_zero_pop_grow_time = t_zero_pop_grow_time) "Human fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Welfare_Index Human_Welfare_Index1 "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {340.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Industrial_Investment Industrial_Investment1(industrial_capital_init = industrial_capital_init, ind_out_pc_des = ind_out_pc_des, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2, p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1, t_ind_equil_time = t_ind_equil_time, t_policy_year = t_policy_year) "Industrial investment" annotation(
          Placement(visible = true, transformation(origin = {120.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Labor_Utilization Labor_Utilization1(labor_util_fr_del_init = labor_util_fr_del_init, labor_util_fr_del_time = labor_util_fr_del_time) "Labor utilization" annotation(
          Placement(visible = true, transformation(origin = {120.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Land_Fertility Land_Fertility1(des_food_ratio_dfr = des_food_ratio_dfr, inherent_land_fert = inherent_land_fert, land_fertility_init = land_fertility_init, t_policy_year = t_policy_year, yield_tech_init = yield_tech_init, p_yield_tech_chg_mlt = p_yield_tech_chg_mlt) "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Life_Expectancy Life_Expectancy1(hlth_serv_impact_del = hlth_serv_impact_del, life_expect_norm = life_expect_norm, subsist_food_pc = subsist_food_pc) "Life expectancy" annotation(
          Placement(visible = true, transformation(origin = {340.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.NR_Resource_Utilization NR_Resource_Utilization1(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR, nr_resources_init = nr_resources_init, p_nr_res_use_fact_1 = p_nr_res_use_fact_1, res_tech_init = res_tech_init, t_policy_year = t_policy_year, t_fcaor_time = t_fcaor_time, tech_dev_del_TDD = tech_dev_del_TDD, p_res_tech_chg_mlt = p_res_tech_chg_mlt, p_fr_cap_al_obt_res_2 = p_fr_cap_al_obt_res_2) "Non-recoverable natural resource utilization" annotation(
          Placement(visible = true, transformation(origin = {340.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Service_Sector_Investment Service_Sector_Investment1(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2, service_capital_init = service_capital_init) "Service sector investment" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -220.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
      equation
        population = Population_Dynamics1.Population.y;
        food = Food_Production1.Food.food;
        industrial_output = Industrial_Investment1.Industrial_Output.industrial_output;
        ppoll_index = Pollution_Dynamics1.PPoll_Index.y;
        nr_resources = NR_Resource_Utilization1.NR_Resources.y;
        fioa_ind = Industrial_Investment1.FIOA_Ind.fioa_ind;
        s_fioa_agr = Food_Production1.S_FIOA_Agr.s_fioa_agr;
        s_fioa_cons = Industrial_Investment1.S_FIOA_Cons.s_fioa_cons;
        s_fioa_serv = Service_Sector_Investment1.S_FIOA_Serv.s_fioa_serv;
        s_fr_cap_al_obt_res = NR_Resource_Utilization1.S_Fr_Cap_Al_Obt_Res.s_fr_cap_al_obt_res;
        life_expectancy = Life_Expectancy1.Life_Expectancy.y;
        food_pc = Food_Production1.Food_PC.y;
        serv_out_pc = Service_Sector_Investment1.Serv_Out_PC.y;
        ind_out_pc = Industrial_Investment1.Ind_Out_PC.y;
        human_ecological_footprint = Human_Ecological_Footprint1.HEF_Human_Ecological_Footprint.hef_human_ecological_footprint;
        human_welfare_index = Human_Welfare_Index1.HWI_Human_Welfare_Index.hwi_human_welfare_index;
        connect(Population_Dynamics1.population, Pollution_Dynamics1.population) annotation(
          Line(points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 140.0}, {-180.0, 140.0}, {-180.0, 88.0}, {-122.0, 88.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.population, Arable_Land_Dynamics1.population) annotation(
          Line(points = {{-122.0, 88.0}, {-180.0, 88.0}, {-180.0, -36.0}, {-122.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.population, Food_Production1.population) annotation(
          Line(points = {{-122.0, -36.0}, {-180.0, -36.0}, {-180.0, -104.0}, {-122.0, -104.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.population, Service_Sector_Investment1.population) annotation(
          Line(points = {{-122.0, -104.0}, {-180.0, -104.0}, {-180.0, -216.0}, {-122.0, -216.0}}, color = {0, 0, 191}, visible = true));
        connect(Population_Dynamics1.population, Industrial_Investment1.population) annotation(
          Line(points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 34.0}, {116.0, 34.0}, {116.0, 58.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.population, Life_Expectancy1.population) annotation(
          Line(points = {{116.0, 58.0}, {116.0, 34.0}, {260.0, 34.0}, {260.0, -20.0}, {318.0, -20.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.population, NR_Resource_Utilization1.population) annotation(
          Line(points = {{318.0, -20.0}, {260.0, -20.0}, {260.0, -120.0}, {318.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.arable_land, Pollution_Dynamics1.arable_land) annotation(
          Line(points = {{-78.0, -20.0}, {-20.0, -20.0}, {-20.0, 26.0}, {-176.0, 26.0}, {-176.0, 64.0}, {-122.0, 64.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.arable_land, Food_Production1.arable_land) annotation(
          Line(points = {{-122.0, 64.0}, {-176.0, 64.0}, {-176.0, -112.0}, {-122.0, -112.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.arable_land, Labor_Utilization1.arable_land) annotation(
          Line(points = {{-78.0, -20.0}, {40.0, -20.0}, {40.0, -36.0}, {98.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.arable_land, Human_Ecological_Footprint1.arable_land) annotation(
          Line(points = {{98.0, -36.0}, {40.0, -36.0}, {40.0, -64.0}, {264.0, -64.0}, {264.0, 190.0}, {318.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_output, Pollution_Dynamics1.industrial_output) annotation(
          Line(points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, 22.0}, {-184.0, 22.0}, {-184.0, 80.0}, {-122.0, 80.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.industrial_output, Food_Production1.industrial_output) annotation(
          Line(points = {{-122.0, 80.0}, {-184.0, 80.0}, {-184.0, -136.0}, {-122.0, -136.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.industrial_output, Service_Sector_Investment1.industrial_output) annotation(
          Line(points = {{-122.0, -136.0}, {-184.0, -136.0}, {-184.0, -224.0}, {-122.0, -224.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_output, NR_Resource_Utilization1.industrial_output) annotation(
          Line(points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, -130.0}, {318.0, -130.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Arable_Land_Dynamics1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {-188.0, 30.0}, {-188.0, -28.0}, {-122.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.ind_out_pc, Food_Production1.ind_out_pc) annotation(
          Line(points = {{-122.0, -28.0}, {-188.0, -28.0}, {-188.0, -128.0}, {-122.0, -128.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.ind_out_pc, Service_Sector_Investment1.ind_out_pc) annotation(
          Line(points = {{-122.0, -128.0}, {-188.0, -128.0}, {-188.0, -232.0}, {-122.0, -232.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Human_Fertility1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {36.0, 30.0}, {36.0, 170.0}, {98.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.ind_out_pc, Labor_Utilization1.ind_out_pc) annotation(
          Line(points = {{98.0, 170.0}, {36.0, 170.0}, {36.0, -12.0}, {98.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Human_Welfare_Index1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 70.0}, {318.0, 70.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Life_Expectancy1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -12.0}, {318.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, NR_Resource_Utilization1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -110.0}, {318.0, -110.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.serv_out_pc, Human_Fertility1.serv_out_pc) annotation(
          Line(points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 190.0}, {98.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 18.0}, {70.0, 18.0}, {108.0, 18.0}, {108.0, 2.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(points = {{318.0, -4.0}, {218.0, -4.0}, {218.0, 18.0}, {108.0, 18.0}, {108.0, 11.6909}, {108.0, 2.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_index, Land_Fertility1.ppoll_index) annotation(
          Line(points = {{-78.0, 80.0}, {20.0, 80.0}, {20.0, -130.0}, {98.0, -130.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.ppoll_index, Life_Expectancy1.ppoll_index) annotation(
          Line(points = {{98.0, -130.0}, {20.0, -130.0}, {20.0, -70.0}, {268.0, -70.0}, {268.0, -36.0}, {318.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.food_ratio, Land_Fertility1.food_ratio) annotation(
          Line(points = {{-78.0, -104.0}, {10.0, -104.0}, {10.0, -110.0}, {98.0, -110.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.land_yield, Arable_Land_Dynamics1.land_yield) annotation(
          Line(points = {{-78.0, -112.0}, {-20.0, -112.0}, {-20.0, -60.0}, {-192.0, -60.0}, {-192.0, -4.0}, {-122.0, -4.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.food_pc, Life_Expectancy1.food_pc) annotation(
          Line(points = {{-96.0, -98.0}, {-96.0, -74.0}, {256.0, -74.0}, {256.0, -28.0}, {318.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.marg_prod_agr_inp, Arable_Land_Dynamics1.marg_prod_agr_inp) annotation(
          Line(points = {{-78.0, -120.0}, {-24.0, -120.0}, {-24.0, -64.0}, {-172.0, -64.0}, {-172.0, -12.0}, {-122.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.agr_inp_per_hect, Pollution_Dynamics1.agr_inp_per_hect) annotation(
          Line(points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -56.0}, {-196.0, -56.0}, {-196.0, 72.0}, {-122.0, 72.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.agr_inp_per_hect, Labor_Utilization1.agr_inp_per_hect) annotation(
          Line(points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -28.0}, {98.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.s_fioa_agr, Industrial_Investment1.s_fioa_agr) annotation(
          Line(points = {{-78.0, -136.0}, {-4.0, -136.0}, {-4.0, 64.0}, {98.0, 64.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.service_capital, Labor_Utilization1.service_capital) annotation(
          Line(points = {{-78.0, -220.0}, {4.0, -220.0}, {4.0, -4.0}, {98.0, -4.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.p_fr_inp_for_land_maint, Land_Fertility1.p_fr_inp_for_land_maint) annotation(
          Line(points = {{-88.0, -142.0}, {-88.0, -160.0}, {44.0, -160.0}, {44.0, -120.0}, {98.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.s_fioa_serv, Industrial_Investment1.s_fioa_serv) annotation(
          Line(points = {{-78.0, -230.0}, {16.0, -230.0}, {16.0, 38.0}, {108.0, 38.0}, {108.0, 58.0}}, color = {0, 0, 191}, visible = true));
        connect(Population_Dynamics1.labor_force, Labor_Utilization1.labor_force) annotation(
          Line(points = {{-78.0, 170.0}, {12.0, 170.0}, {12.0, -60.0}, {108.0, -60.0}, {108.0, -42.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.total_fertility, Population_Dynamics1.total_fertility) annotation(
          Line(points = {{142.0, 180.0}, {196.0, 180.0}, {196.0, 144.0}, {-200.0, 144.0}, {-200.0, 190.0}, {-122.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_capital, Labor_Utilization1.industrial_capital) annotation(
          Line(points = {{142.0, 76.0}, {196.0, 76.0}, {196.0, -78.0}, {44.0, -78.0}, {44.0, -20.0}, {98.0, -20.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.land_fertility, Food_Production1.land_fertility) annotation(
          Line(points = {{142.0, -120.0}, {192.0, -120.0}, {192.0, -164.0}, {-112.0, -164.0}, {-112.0, -142.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.life_expectancy, Human_Welfare_Index1.life_expectancy) annotation(
          Line(points = {{362.0, -20.0}, {420.0, -20.0}, {420.0, 40.0}, {250.0, 40.0}, {250.0, 90.0}, {318.0, 90.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Welfare_Index1.life_expectancy, Human_Fertility1.life_expectancy) annotation(
          Line(points = {{318.0, 90.0}, {250.0, 90.0}, {250.0, 128.0}, {32.0, 128.0}, {32.0, 180.0}, {98.0, 180.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.life_expectancy, Population_Dynamics1.life_expectancy) annotation(
          Line(points = {{98.0, 180.0}, {32.0, 180.0}, {32.0, 128.0}, {-190.0, 128.0}, {-190.0, 170.0}, {-122.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(NR_Resource_Utilization1.pc_res_use_mlt, Pollution_Dynamics1.pc_res_use_mlt) annotation(
          Line(points = {{362.0, -108.0}, {424.0, -108.0}, {424.0, 124.0}, {-176.0, 124.0}, {-176.0, 96.0}, {-122.0, 96.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.yield_tech_LYTD, Food_Production1.yield_tech_LYTD) annotation(
          Line(points = {{142.0, -110.0}, {192.0, -110.0}, {192.0, -82.0}, {-112.0, -82.0}, {-112.0, -84.9128}, {-112.0, -98.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.fr_inp_al_land_dev, Food_Production1.fr_inp_al_land_dev) annotation(
          Line(points = {{-78.0, -10.0}, {-28.0, -10.0}, {-28.0, -68.0}, {-172.0, -68.0}, {-172.0, -120.0}, {-122.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.s_yield_mlt_air_poll, Food_Production1.s_yield_mlt_air_poll) annotation(
          Line(points = {{-78.0, 72.0}, {32.0, 72.0}, {32.0, -168.0}, {-104.0, -168.0}, {-104.0, -142.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.capital_util_fr, Service_Sector_Investment1.capital_util_fr) annotation(
          Line(points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {-172.0, -180.0}, {-172.0, -208.0}, {-122.0, -208.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_tech_mult_icor_COPM, Industrial_Investment1.ppoll_tech_mult_icor_COPM) annotation(
          Line(points = {{-88.0, 0.0}, {88.0, 0.0}}, color = {0, 0, 191}, visible = true, origin = {10.0, 88.0}));
        connect(NR_Resource_Utilization1.ind_cap_out_ratio_2_ICOR2T, Industrial_Investment1.ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(points = {{362.0, -124.0}, {428.0, -124.0}, {428.0, 120.0}, {108.0, 120.0}, {108.0, 102.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.capital_util_fr, Industrial_Investment1.capital_util_fr) annotation(
          Line(points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {24.0, -180.0}, {24.0, 80.0}, {98.0, 80.0}}, color = {0, 0, 191}, visible = true));
        connect(NR_Resource_Utilization1.s_fr_cap_al_obt_res, Industrial_Investment1.s_fr_cap_al_obt_res) annotation(
          Line(points = {{362.0, -132.0}, {432.0, -132.0}, {432.0, 132.0}, {44.0, 132.0}, {44.0, 72.0}, {98.0, 72.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_gen_rt, Human_Ecological_Footprint1.ppoll_gen_rt) annotation(
          Line(points = {{-78.0, 64.0}, {-20.0, 64.0}, {-20.0, 148.0}, {256.0, 148.0}, {256.0, 170.0}, {318.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.urban_ind_land, Human_Ecological_Footprint1.urban_ind_land) annotation(
          Line(points = {{-78.0, -30.0}, {-24.0, -30.0}, {-24.0, 136.0}, {252.0, 136.0}, {252.0, 180.0}, {318.0, 180.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.yield_tech_mult_icor_COYM, Industrial_Investment1.yield_tech_mult_icor_COYM) annotation(
          Line(points = {{-96.0, -142.0}, {-96.0, -174.0}, {28.0, -174.0}, {28.0, 96.0}, {98.0, 96.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.tot_agric_invest, Arable_Land_Dynamics1.tot_agric_invest) annotation(
          Line(points = {{-88.0, -98.0}, {-88.0, -52.0}, {-200.0, -52.0}, {-200.0, -20.0}, {-122.0, -20.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-222.0, -260.0}, {440.0, 222.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-70.0, 58.0}, {286.0, 132.0}}, textString = "More Abundant", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-84.0, -14.0}, {302.0, 52.0}}, textString = "Non-recoverable", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-114.0, -106.0}, {324.0, -2.0}}, textString = "Natural Resources", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})),
          experiment(StartTime = 1900, StopTime = 2100),
          experimentSetupOutput,
          Documentation(info = "<html>
This is <font color=red><b>Scenario #2</b></font> of the <font color=red><b>WORLD3</b></font> model. In the original scenario, industry stopped growing around 2040 due to an exhaustion of the remaining non-recoverable natural resources. <p>
 
In this modified scenario, the initially available non-recoverable natural resources are doubled to make them last longer.  This is a reasonable assumption, as indeed, the projections of available resources have repetitively been raised during recent decades.  Consequently, industry is able to grow unabatedly for 20 more years, before the increasing extraction cost finally puts a damper on its further growth.  Also postulated in this scenario are advances in resource extraction technology that make it cheaper and more efficient to produce the available resources. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.L., W.W. Behrens III, D.M., Meadows, R.F. Naill, J. Randers, and E.K.O. Zahn (1974), <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>, Wright-Allen Press, 637p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
 
In order to accomplish this change, you need to modify the initial value of the natural resources as follows: <p>
<font color=red>parameter Real nr_resources_init(unit=\"ton\") = <b>2e12</b> \"Initial available non-recoverable resources\";</font>, <p>
you need to modify the table P_Fr_Cap_Al_Obt_Res_2 that describes the fraction of capital allocated to obtaining resources: <p>
<font color=red>parameter Real p_fr_cap_al_obt_res_2[:] = {1,<b>0.1</b>,<b>0.05</b>,0.05,0.05,0.05,0.05,0.05,0.05,0.05,0.05} \"Non-renewable resource fraction remaining\";</font>, <p>
and finally, you need to reset one of the switching times in the model: <p>
<font color=red>parameter Real t_fcaor_time(unit=\"yr\") = <b>2002</b> \"Year of capital allocation to resource use efficiency\";</font>. <p>
 
<hr> <p>
 
Simulate the model from 1900 until 2100, and display the same variables as in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> at page 173: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_4.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_5.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_6.png\"> <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_2;

      model Scenario_3 "More accessible non-recoverable natural resources and pollution control"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 400 "Desired annual industrial per capita output";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2 "Controlled average life of agricultural input";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 14 "Controlled average life of industrial capital";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 20 "Controlled average life of service sector capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real reproductive_lifetime(unit = "yr") = 30.0 "Reproductive life time";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_fcaor_time(unit = "yr") = 2002 "Year of capital allocation to resource use efficiency";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 4000 "Year of continued fertility change";
        parameter Real t_ind_equil_time(unit = "yr") = 4000 "Year of industrial equilibrium";
        parameter Real t_land_life_time(unit = "yr") = 4000 "Land life time";
        parameter Real t_policy_year(unit = "yr") = 2002 "Year of policy change";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 4000 "Time to zero population growth";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_ppoll_tech_chg_mlt[:] = {-0.04, -0.04, 0, 0} "Persistent pollution technology change multiplier";
        parameter Real p_res_tech_chg_mlt[:] = {0, 0, 0, 0} "Resource technology change multiplier";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0, 0} "Yield technology change multiplier";
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real nr_resources_init(unit = "ton") = 2000000000000.0 "Initial available non-recoverable resources";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        output Real population "Total human world population";
        output Real food(unit = "dollar/yr") "Total annually produced food";
        output Real industrial_output(unit = "dollar/yr") "Total annual world industrial output";
        output Real ppoll_index "Persistent pollution index";
        output Real nr_resources "Remaining non-recoverable natural resources";
        output Real fioa_ind "Fraction of industrial output allocated to industrial/military complex";
        output Real s_fioa_agr "Fraction of industrial output allocated to food production";
        output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        output Real life_expectancy(unit = "yr") "Life expectancy";
        output Real food_pc(unit = "dollar/yr") "Total annual food per person";
        output Real serv_out_pc(unit = "dollar/yr") "Total annual services per person";
        output Real ind_out_pc(unit = "dollar/yr") "Total annual consumer goods per person";
        output Real human_ecological_footprint(unit = "Gha") "Human ecological footprint";
        output Real human_welfare_index "Human welfare index";
        SystemDynamics.WorldDynamics.World3.Population_Dynamics Population_Dynamics1(pop1_init = pop1_init, pop2_init = pop2_init, pop3_init = pop3_init, pop4_init = pop4_init, labor_force_partic = labor_force_partic, reproductive_lifetime = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "Population dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Pollution_Dynamics Pollution_Dynamics1(agr_mtl_toxic_index = agr_mtl_toxic_index, assim_half_life_1970 = assim_half_life_1970, des_ppoll_index_DPOLX = des_ppoll_index_DPOLX, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl, frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index, ind_out_in_1970 = ind_out_in_1970, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1, pers_pollution_init = pers_pollution_init, ppoll_in_1970 = ppoll_in_1970, ppoll_tech_init = ppoll_tech_init, ppoll_trans_del = ppoll_trans_del, t_air_poll_time = t_air_poll_time, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, p_ppoll_tech_chg_mlt = p_ppoll_tech_chg_mlt) "Persistent pollution generation" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Arable_Land_Dynamics Arable_Land_Dynamics1(arable_land_init = arable_land_init, avg_life_land_norm = avg_life_land_norm, inherent_land_fert = inherent_land_fert, pot_arable_land_init = pot_arable_land_init, pot_arable_land_tot = pot_arable_land_tot, social_discount = social_discount, t_land_life_time = t_land_life_time, urban_ind_land_init = urban_ind_land_init, urb_ind_land_dev_time = urb_ind_land_dev_time) "Arable land dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Food_Production Food_Production1(agr_inp_init = agr_inp_init, food_short_perc_del = food_short_perc_del, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2, p_land_yield_fact_1 = p_land_yield_fact_1, perc_food_ratio_init = perc_food_ratio_init, processing_loss = processing_loss, subsist_food_pc = subsist_food_pc, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, land_fr_harvested = land_fr_harvested) "Food production" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Ecological_Footprint Human_Ecological_Footprint1 "Human ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {340.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Fertility Human_Fertility1(des_compl_fam_size_norm = des_compl_fam_size_norm, hlth_serv_impact_del = hlth_serv_impact_del, income_expect_avg_time = income_expect_avg_time, lifet_perc_del = lifet_perc_del, max_tot_fert_norm = max_tot_fert_norm, social_adj_del = social_adj_del, t_fert_cont_eff_time = t_fert_cont_eff_time, t_zero_pop_grow_time = t_zero_pop_grow_time) "Human fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Welfare_Index Human_Welfare_Index1 "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {340.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Industrial_Investment Industrial_Investment1(industrial_capital_init = industrial_capital_init, ind_out_pc_des = ind_out_pc_des, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2, p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1, t_ind_equil_time = t_ind_equil_time, t_policy_year = t_policy_year) "Industrial investment" annotation(
          Placement(visible = true, transformation(origin = {120.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Labor_Utilization Labor_Utilization1(labor_util_fr_del_init = labor_util_fr_del_init, labor_util_fr_del_time = labor_util_fr_del_time) "Labor utilization" annotation(
          Placement(visible = true, transformation(origin = {120.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Land_Fertility Land_Fertility1(des_food_ratio_dfr = des_food_ratio_dfr, inherent_land_fert = inherent_land_fert, land_fertility_init = land_fertility_init, t_policy_year = t_policy_year, yield_tech_init = yield_tech_init, p_yield_tech_chg_mlt = p_yield_tech_chg_mlt) "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Life_Expectancy Life_Expectancy1(hlth_serv_impact_del = hlth_serv_impact_del, life_expect_norm = life_expect_norm, subsist_food_pc = subsist_food_pc) "Life expectancy" annotation(
          Placement(visible = true, transformation(origin = {340.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.NR_Resource_Utilization NR_Resource_Utilization1(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR, nr_resources_init = nr_resources_init, p_nr_res_use_fact_1 = p_nr_res_use_fact_1, res_tech_init = res_tech_init, t_policy_year = t_policy_year, t_fcaor_time = t_fcaor_time, tech_dev_del_TDD = tech_dev_del_TDD, p_fr_cap_al_obt_res_2 = p_fr_cap_al_obt_res_2, p_res_tech_chg_mlt = p_res_tech_chg_mlt) "Non-recoverable natural resource utilization" annotation(
          Placement(visible = true, transformation(origin = {340.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Service_Sector_Investment Service_Sector_Investment1(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2, service_capital_init = service_capital_init) "Service sector investment" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -220.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
      equation
        connect(Food_Production1.s_fioa_agr, Industrial_Investment1.s_fioa_agr) annotation(
          Line(visible = true, points = {{-78.0, -136.0}, {-4.0, -136.0}, {-4.0, 64.0}, {98.0, 64.0}}, color = {0, 0, 191}));
        population = Population_Dynamics1.Population.y;
        food = Food_Production1.Food.food;
        industrial_output = Industrial_Investment1.Industrial_Output.industrial_output;
        ppoll_index = Pollution_Dynamics1.PPoll_Index.y;
        nr_resources = NR_Resource_Utilization1.NR_Resources.y;
        fioa_ind = Industrial_Investment1.FIOA_Ind.fioa_ind;
        s_fioa_agr = Food_Production1.S_FIOA_Agr.s_fioa_agr;
        s_fioa_cons = Industrial_Investment1.S_FIOA_Cons.s_fioa_cons;
        s_fioa_serv = Service_Sector_Investment1.S_FIOA_Serv.s_fioa_serv;
        s_fr_cap_al_obt_res = NR_Resource_Utilization1.S_Fr_Cap_Al_Obt_Res.s_fr_cap_al_obt_res;
        life_expectancy = Life_Expectancy1.Life_Expectancy.y;
        food_pc = Food_Production1.Food_PC.y;
        serv_out_pc = Service_Sector_Investment1.Serv_Out_PC.y;
        ind_out_pc = Industrial_Investment1.Ind_Out_PC.y;
        human_ecological_footprint = Human_Ecological_Footprint1.HEF_Human_Ecological_Footprint.hef_human_ecological_footprint;
        human_welfare_index = Human_Welfare_Index1.HWI_Human_Welfare_Index.hwi_human_welfare_index;
        connect(Population_Dynamics1.population, Pollution_Dynamics1.population) annotation(
          Line(points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 140.0}, {-180.0, 140.0}, {-180.0, 88.0}, {-122.0, 88.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.population, Arable_Land_Dynamics1.population) annotation(
          Line(points = {{-122.0, 88.0}, {-180.0, 88.0}, {-180.0, -36.0}, {-122.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.population, Food_Production1.population) annotation(
          Line(points = {{-122.0, -36.0}, {-180.0, -36.0}, {-180.0, -104.0}, {-122.0, -104.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.population, Service_Sector_Investment1.population) annotation(
          Line(points = {{-122.0, -104.0}, {-180.0, -104.0}, {-180.0, -216.0}, {-122.0, -216.0}}, color = {0, 0, 191}, visible = true));
        connect(Population_Dynamics1.population, Industrial_Investment1.population) annotation(
          Line(points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 34.0}, {116.0, 34.0}, {116.0, 58.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.population, Life_Expectancy1.population) annotation(
          Line(points = {{116.0, 58.0}, {116.0, 34.0}, {260.0, 34.0}, {260.0, -20.0}, {318.0, -20.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.population, NR_Resource_Utilization1.population) annotation(
          Line(points = {{318.0, -20.0}, {260.0, -20.0}, {260.0, -120.0}, {318.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.arable_land, Pollution_Dynamics1.arable_land) annotation(
          Line(points = {{-78.0, -20.0}, {-20.0, -20.0}, {-20.0, 26.0}, {-176.0, 26.0}, {-176.0, 64.0}, {-122.0, 64.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.arable_land, Food_Production1.arable_land) annotation(
          Line(points = {{-122.0, 64.0}, {-176.0, 64.0}, {-176.0, -112.0}, {-122.0, -112.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.arable_land, Labor_Utilization1.arable_land) annotation(
          Line(points = {{-78.0, -20.0}, {40.0, -20.0}, {40.0, -36.0}, {98.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.arable_land, Human_Ecological_Footprint1.arable_land) annotation(
          Line(points = {{98.0, -36.0}, {40.0, -36.0}, {40.0, -64.0}, {264.0, -64.0}, {264.0, 190.0}, {318.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_output, Pollution_Dynamics1.industrial_output) annotation(
          Line(points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, 22.0}, {-184.0, 22.0}, {-184.0, 80.0}, {-122.0, 80.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.industrial_output, Food_Production1.industrial_output) annotation(
          Line(points = {{-122.0, 80.0}, {-184.0, 80.0}, {-184.0, -136.0}, {-122.0, -136.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.industrial_output, Service_Sector_Investment1.industrial_output) annotation(
          Line(points = {{-122.0, -136.0}, {-184.0, -136.0}, {-184.0, -224.0}, {-122.0, -224.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_output, NR_Resource_Utilization1.industrial_output) annotation(
          Line(points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, -130.0}, {318.0, -130.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Arable_Land_Dynamics1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {-188.0, 30.0}, {-188.0, -28.0}, {-122.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.ind_out_pc, Food_Production1.ind_out_pc) annotation(
          Line(points = {{-122.0, -28.0}, {-188.0, -28.0}, {-188.0, -128.0}, {-122.0, -128.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.ind_out_pc, Service_Sector_Investment1.ind_out_pc) annotation(
          Line(points = {{-122.0, -128.0}, {-188.0, -128.0}, {-188.0, -232.0}, {-122.0, -232.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Human_Fertility1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {36.0, 30.0}, {36.0, 170.0}, {98.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.ind_out_pc, Labor_Utilization1.ind_out_pc) annotation(
          Line(points = {{98.0, 170.0}, {36.0, 170.0}, {36.0, -12.0}, {98.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Human_Welfare_Index1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 70.0}, {318.0, 70.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Life_Expectancy1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -12.0}, {318.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, NR_Resource_Utilization1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -110.0}, {318.0, -110.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.serv_out_pc, Human_Fertility1.serv_out_pc) annotation(
          Line(points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 190.0}, {98.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 18.0}, {70.0, 18.0}, {108.0, 18.0}, {108.0, 2.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(points = {{318.0, -4.0}, {218.0, -4.0}, {218.0, 18.0}, {108.0, 18.0}, {108.0, 12.9215}, {108.0, 2.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_index, Land_Fertility1.ppoll_index) annotation(
          Line(points = {{-78.0, 80.0}, {20.0, 80.0}, {20.0, -130.0}, {98.0, -130.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.ppoll_index, Life_Expectancy1.ppoll_index) annotation(
          Line(points = {{98.0, -130.0}, {20.0, -130.0}, {20.0, -70.0}, {268.0, -70.0}, {268.0, -36.0}, {318.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.food_ratio, Land_Fertility1.food_ratio) annotation(
          Line(points = {{-78.0, -104.0}, {10.0, -104.0}, {10.0, -110.0}, {98.0, -110.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.land_yield, Arable_Land_Dynamics1.land_yield) annotation(
          Line(points = {{-78.0, -112.0}, {-20.0, -112.0}, {-20.0, -60.0}, {-192.0, -60.0}, {-192.0, -4.0}, {-122.0, -4.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.food_pc, Life_Expectancy1.food_pc) annotation(
          Line(points = {{-96.0, -98.0}, {-96.0, -74.0}, {256.0, -74.0}, {256.0, -28.0}, {318.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.marg_prod_agr_inp, Arable_Land_Dynamics1.marg_prod_agr_inp) annotation(
          Line(points = {{-78.0, -120.0}, {-24.0, -120.0}, {-24.0, -64.0}, {-172.0, -64.0}, {-172.0, -12.0}, {-122.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.agr_inp_per_hect, Pollution_Dynamics1.agr_inp_per_hect) annotation(
          Line(points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -56.0}, {-196.0, -56.0}, {-196.0, 72.0}, {-122.0, 72.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.agr_inp_per_hect, Labor_Utilization1.agr_inp_per_hect) annotation(
          Line(points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -28.0}, {98.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.service_capital, Labor_Utilization1.service_capital) annotation(
          Line(points = {{-78.0, -220.0}, {4.0, -220.0}, {4.0, -4.0}, {98.0, -4.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.p_fr_inp_for_land_maint, Land_Fertility1.p_fr_inp_for_land_maint) annotation(
          Line(points = {{-88.0, -142.0}, {-88.0, -160.0}, {44.0, -160.0}, {44.0, -120.0}, {98.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.s_fioa_serv, Industrial_Investment1.s_fioa_serv) annotation(
          Line(points = {{-78.0, -230.0}, {16.0, -230.0}, {16.0, 38.0}, {108.0, 38.0}, {108.0, 58.0}}, color = {0, 0, 191}, visible = true));
        connect(Population_Dynamics1.labor_force, Labor_Utilization1.labor_force) annotation(
          Line(points = {{-78.0, 170.0}, {12.0, 170.0}, {12.0, -60.0}, {108.0, -60.0}, {108.0, -42.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.total_fertility, Population_Dynamics1.total_fertility) annotation(
          Line(points = {{142.0, 180.0}, {196.0, 180.0}, {196.0, 144.0}, {-200.0, 144.0}, {-200.0, 190.0}, {-122.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_capital, Labor_Utilization1.industrial_capital) annotation(
          Line(points = {{142.0, 76.0}, {196.0, 76.0}, {196.0, -78.0}, {44.0, -78.0}, {44.0, -20.0}, {98.0, -20.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.land_fertility, Food_Production1.land_fertility) annotation(
          Line(points = {{142.0, -120.0}, {192.0, -120.0}, {192.0, -164.0}, {-112.0, -164.0}, {-112.0, -142.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.life_expectancy, Human_Welfare_Index1.life_expectancy) annotation(
          Line(points = {{362.0, -20.0}, {420.0, -20.0}, {420.0, 40.0}, {250.0, 40.0}, {250.0, 90.0}, {318.0, 90.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Welfare_Index1.life_expectancy, Human_Fertility1.life_expectancy) annotation(
          Line(points = {{318.0, 90.0}, {250.0, 90.0}, {250.0, 128.0}, {32.0, 128.0}, {32.0, 180.0}, {98.0, 180.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.life_expectancy, Population_Dynamics1.life_expectancy) annotation(
          Line(points = {{98.0, 180.0}, {32.0, 180.0}, {32.0, 128.0}, {-190.0, 128.0}, {-190.0, 170.0}, {-122.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(NR_Resource_Utilization1.pc_res_use_mlt, Pollution_Dynamics1.pc_res_use_mlt) annotation(
          Line(points = {{362.0, -108.0}, {424.0, -108.0}, {424.0, 124.0}, {-176.0, 124.0}, {-176.0, 96.0}, {-122.0, 96.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.yield_tech_LYTD, Food_Production1.yield_tech_LYTD) annotation(
          Line(points = {{142.0, -110.0}, {192.0, -110.0}, {192.0, -82.0}, {-112.0, -82.0}, {-112.0, -87.374}, {-112.0, -98.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.fr_inp_al_land_dev, Food_Production1.fr_inp_al_land_dev) annotation(
          Line(points = {{-78.0, -10.0}, {-28.0, -10.0}, {-28.0, -68.0}, {-172.0, -68.0}, {-172.0, -120.0}, {-122.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.s_yield_mlt_air_poll, Food_Production1.s_yield_mlt_air_poll) annotation(
          Line(points = {{-78.0, 72.0}, {32.0, 72.0}, {32.0, -168.0}, {-104.0, -168.0}, {-104.0, -142.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.capital_util_fr, Service_Sector_Investment1.capital_util_fr) annotation(
          Line(points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {-172.0, -180.0}, {-172.0, -208.0}, {-122.0, -208.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_tech_mult_icor_COPM, Industrial_Investment1.ppoll_tech_mult_icor_COPM) annotation(
          Line(points = {{-88.0, 0.0}, {88.0, 0.0}}, color = {0, 0, 191}, visible = true, origin = {10.0, 88.0}));
        connect(NR_Resource_Utilization1.ind_cap_out_ratio_2_ICOR2T, Industrial_Investment1.ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(points = {{362.0, -124.0}, {428.0, -124.0}, {428.0, 120.0}, {108.0, 120.0}, {108.0, 102.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.capital_util_fr, Industrial_Investment1.capital_util_fr) annotation(
          Line(points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {24.0, -180.0}, {24.0, 80.0}, {98.0, 80.0}}, color = {0, 0, 191}, visible = true));
        connect(NR_Resource_Utilization1.s_fr_cap_al_obt_res, Industrial_Investment1.s_fr_cap_al_obt_res) annotation(
          Line(points = {{362.0, -132.0}, {432.0, -132.0}, {432.0, 132.0}, {44.0, 132.0}, {44.0, 72.0}, {98.0, 72.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_gen_rt, Human_Ecological_Footprint1.ppoll_gen_rt) annotation(
          Line(points = {{-78.0, 64.0}, {-20.0, 64.0}, {-20.0, 148.0}, {256.0, 148.0}, {256.0, 170.0}, {318.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.urban_ind_land, Human_Ecological_Footprint1.urban_ind_land) annotation(
          Line(points = {{-78.0, -30.0}, {-24.0, -30.0}, {-24.0, 136.0}, {252.0, 136.0}, {252.0, 180.0}, {318.0, 180.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.yield_tech_mult_icor_COYM, Industrial_Investment1.yield_tech_mult_icor_COYM) annotation(
          Line(points = {{-96.0, -142.0}, {-96.0, -174.0}, {28.0, -174.0}, {28.0, 96.0}, {98.0, 96.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.tot_agric_invest, Arable_Land_Dynamics1.tot_agric_invest) annotation(
          Line(points = {{-88.0, -98.0}, {-88.0, -52.0}, {-200.0, -52.0}, {-200.0, -20.0}, {-122.0, -20.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-220.0, -260.0}, {442.0, 222.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, 60.0}, {300.0, 132.0}}, textString = "More Accessible", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-82.0, -14.0}, {304.0, 52.0}}, textString = "Non-recoverable", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-112.0, -106.0}, {326.0, -2.0}}, textString = "Natural Resources", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-136.0, -184.0}, {348.0, -80.0}}, textString = "and Pollution Control", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})),
          experiment(StartTime = 1900, StopTime = 2100),
          experimentSetupOutput,
          Documentation(info = "<html>
This is <font color=red><b>Scenario #3</b></font> of the <font color=red><b>WORLD3</b></font> model. This scenario starts out with the same assumptions as <font color=red><b>Scenario #2</b></font>.  In that scenario, the continued production of industrial goods caused the persistent pollution to accumulate.  That pollution led to a deterioration of the fertility of our agricultural lands, which caused a collapse over time. <p>
 
For this reason, it is postulated here that improved pollution control technology can curbe the amount of pollutants released into the atmosphere by 4% starting in the year 2002.  The hope is that such a reduction can be reasonably well accomplished without suffocating the industry in the process.  In fact, our government already talk about measures that are considerably more stringent than just a 4% reduction in air pollution, although the already implemented measures have proven ineffective until now.  The greenhouse gas emissions are still growing essentially proportional with the industrial production. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.L., W.W. Behrens III, D.M., Meadows, R.F. Naill, J. Randers, and E.K.O. Zahn (1974), <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>, Wright-Allen Press, 637p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
 
In order to accomplish this change, you need to modify the table P_PPoll_Tech_Chg_Mlt_POLGFM that models a multiplier to the generation of pollution as a function of available pollution technology: <p>
<font color=red>parameter Real p_ppoll_tech_chg_mlt[:] = {<b>-0.04</b>,<b>-0.04</b>,0,0} \"Persistent pollution technology change multiplier\";</font>, <p>
and you also you need to reset yet another one of the switching times in the model: <p>
<font color=red>parameter Real t_policy_year(unit=\"yr\") = <b>2002</b> \"Year of policy change\";</font>. <p>
The latter change has lots of consequences, as this policy control parameter appears in 16 different places in the model. <p>
 
<hr> <p>
 
Simulate the model from 1900 until 2100, and display the same variables as in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> at page 211: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_7.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_8.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_9.png\"> <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_3;

      model Scenario_4 "More accessible non-recoverable natural resources, pollution control, and land yield enhancement"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 400 "Desired annual industrial per capita output";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2 "Controlled average life of agricultural input";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 14 "Controlled average life of industrial capital";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 20 "Controlled average life of service sector capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real reproductive_lifetime(unit = "yr") = 30.0 "Reproductive life time";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_fcaor_time(unit = "yr") = 2002 "Year of capital allocation to resource use efficiency";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 4000 "Year of continued fertility change";
        parameter Real t_ind_equil_time(unit = "yr") = 4000 "Year of industrial equilibrium";
        parameter Real t_land_life_time(unit = "yr") = 4000 "Land life time";
        parameter Real t_policy_year(unit = "yr") = 2002 "Year of policy change";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 4000 "Time to zero population growth";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_ppoll_tech_chg_mlt[:] = {-0.04, -0.04, 0, 0} "Persistent pollution technology change multiplier";
        parameter Real p_res_tech_chg_mlt[:] = {0, 0, 0, 0} "Resource technology change multiplier";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0.04, 0.04} "Yield technology change multiplier";
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real nr_resources_init(unit = "ton") = 2000000000000.0 "Initial available non-recoverable resources";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        output Real population "Total human world population";
        output Real food(unit = "dollar/yr") "Total annually produced food";
        output Real industrial_output(unit = "dollar/yr") "Total annual world industrial output";
        output Real ppoll_index "Persistent pollution index";
        output Real nr_resources "Remaining non-recoverable natural resources";
        output Real fioa_ind "Fraction of industrial output allocated to industrial/military complex";
        output Real s_fioa_agr "Fraction of industrial output allocated to food production";
        output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        output Real life_expectancy(unit = "yr") "Life expectancy";
        output Real food_pc(unit = "dollar/yr") "Total annual food per person";
        output Real serv_out_pc(unit = "dollar/yr") "Total annual services per person";
        output Real ind_out_pc(unit = "dollar/yr") "Total annual consumer goods per person";
        output Real human_ecological_footprint(unit = "Gha") "Human ecological footprint";
        output Real human_welfare_index "Human welfare index";
        SystemDynamics.WorldDynamics.World3.Population_Dynamics Population_Dynamics1(pop1_init = pop1_init, pop2_init = pop2_init, pop3_init = pop3_init, pop4_init = pop4_init, labor_force_partic = labor_force_partic, reproductive_lifetime = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "Population dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Pollution_Dynamics Pollution_Dynamics1(agr_mtl_toxic_index = agr_mtl_toxic_index, assim_half_life_1970 = assim_half_life_1970, des_ppoll_index_DPOLX = des_ppoll_index_DPOLX, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl, frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index, ind_out_in_1970 = ind_out_in_1970, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1, pers_pollution_init = pers_pollution_init, ppoll_in_1970 = ppoll_in_1970, ppoll_tech_init = ppoll_tech_init, ppoll_trans_del = ppoll_trans_del, t_air_poll_time = t_air_poll_time, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, p_ppoll_tech_chg_mlt = p_ppoll_tech_chg_mlt) "Persistent pollution generation" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Arable_Land_Dynamics Arable_Land_Dynamics1(arable_land_init = arable_land_init, avg_life_land_norm = avg_life_land_norm, inherent_land_fert = inherent_land_fert, pot_arable_land_init = pot_arable_land_init, pot_arable_land_tot = pot_arable_land_tot, social_discount = social_discount, t_land_life_time = t_land_life_time, urban_ind_land_init = urban_ind_land_init, urb_ind_land_dev_time = urb_ind_land_dev_time) "Arable land dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Food_Production Food_Production1(agr_inp_init = agr_inp_init, food_short_perc_del = food_short_perc_del, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2, p_land_yield_fact_1 = p_land_yield_fact_1, perc_food_ratio_init = perc_food_ratio_init, processing_loss = processing_loss, subsist_food_pc = subsist_food_pc, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, land_fr_harvested = land_fr_harvested) "Food production" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Ecological_Footprint Human_Ecological_Footprint1 "Human ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {340.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Fertility Human_Fertility1(des_compl_fam_size_norm = des_compl_fam_size_norm, hlth_serv_impact_del = hlth_serv_impact_del, income_expect_avg_time = income_expect_avg_time, lifet_perc_del = lifet_perc_del, max_tot_fert_norm = max_tot_fert_norm, social_adj_del = social_adj_del, t_fert_cont_eff_time = t_fert_cont_eff_time, t_zero_pop_grow_time = t_zero_pop_grow_time) "Human fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Welfare_Index Human_Welfare_Index1 "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {340.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Industrial_Investment Industrial_Investment1(industrial_capital_init = industrial_capital_init, ind_out_pc_des = ind_out_pc_des, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2, p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1, t_ind_equil_time = t_ind_equil_time, t_policy_year = t_policy_year) "Industrial investment" annotation(
          Placement(visible = true, transformation(origin = {120.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Labor_Utilization Labor_Utilization1(labor_util_fr_del_init = labor_util_fr_del_init, labor_util_fr_del_time = labor_util_fr_del_time) "Labor utilization" annotation(
          Placement(visible = true, transformation(origin = {120.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Land_Fertility Land_Fertility1(des_food_ratio_dfr = des_food_ratio_dfr, inherent_land_fert = inherent_land_fert, land_fertility_init = land_fertility_init, t_policy_year = t_policy_year, yield_tech_init = yield_tech_init, p_yield_tech_chg_mlt = p_yield_tech_chg_mlt) "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Life_Expectancy Life_Expectancy1(hlth_serv_impact_del = hlth_serv_impact_del, life_expect_norm = life_expect_norm, subsist_food_pc = subsist_food_pc) "Life expectancy" annotation(
          Placement(visible = true, transformation(origin = {340.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.NR_Resource_Utilization NR_Resource_Utilization1(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR, nr_resources_init = nr_resources_init, p_nr_res_use_fact_1 = p_nr_res_use_fact_1, res_tech_init = res_tech_init, t_policy_year = t_policy_year, t_fcaor_time = t_fcaor_time, tech_dev_del_TDD = tech_dev_del_TDD, p_fr_cap_al_obt_res_2 = p_fr_cap_al_obt_res_2, p_res_tech_chg_mlt = p_res_tech_chg_mlt) "Non-recoverable natural resource utilization" annotation(
          Placement(visible = true, transformation(origin = {340.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Service_Sector_Investment Service_Sector_Investment1(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2, service_capital_init = service_capital_init) "Service sector investment" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -220.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
      equation
        population = Population_Dynamics1.Population.y;
        food = Food_Production1.Food.food;
        industrial_output = Industrial_Investment1.Industrial_Output.industrial_output;
        ppoll_index = Pollution_Dynamics1.PPoll_Index.y;
        nr_resources = NR_Resource_Utilization1.NR_Resources.y;
        fioa_ind = Industrial_Investment1.FIOA_Ind.fioa_ind;
        s_fioa_agr = Food_Production1.S_FIOA_Agr.s_fioa_agr;
        s_fioa_cons = Industrial_Investment1.S_FIOA_Cons.s_fioa_cons;
        s_fioa_serv = Service_Sector_Investment1.S_FIOA_Serv.s_fioa_serv;
        s_fr_cap_al_obt_res = NR_Resource_Utilization1.S_Fr_Cap_Al_Obt_Res.s_fr_cap_al_obt_res;
        life_expectancy = Life_Expectancy1.Life_Expectancy.y;
        food_pc = Food_Production1.Food_PC.y;
        serv_out_pc = Service_Sector_Investment1.Serv_Out_PC.y;
        ind_out_pc = Industrial_Investment1.Ind_Out_PC.y;
        human_ecological_footprint = Human_Ecological_Footprint1.HEF_Human_Ecological_Footprint.hef_human_ecological_footprint;
        human_welfare_index = Human_Welfare_Index1.HWI_Human_Welfare_Index.hwi_human_welfare_index;
        connect(Population_Dynamics1.population, Pollution_Dynamics1.population) annotation(
          Line(points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 140.0}, {-180.0, 140.0}, {-180.0, 88.0}, {-122.0, 88.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.population, Arable_Land_Dynamics1.population) annotation(
          Line(points = {{-122.0, 88.0}, {-180.0, 88.0}, {-180.0, -36.0}, {-122.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.population, Food_Production1.population) annotation(
          Line(points = {{-122.0, -36.0}, {-180.0, -36.0}, {-180.0, -104.0}, {-122.0, -104.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.population, Service_Sector_Investment1.population) annotation(
          Line(points = {{-122.0, -104.0}, {-180.0, -104.0}, {-180.0, -216.0}, {-122.0, -216.0}}, color = {0, 0, 191}, visible = true));
        connect(Population_Dynamics1.population, Industrial_Investment1.population) annotation(
          Line(points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 34.0}, {116.0, 34.0}, {116.0, 58.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.population, Life_Expectancy1.population) annotation(
          Line(points = {{116.0, 58.0}, {116.0, 34.0}, {260.0, 34.0}, {260.0, -20.0}, {318.0, -20.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.population, NR_Resource_Utilization1.population) annotation(
          Line(points = {{318.0, -20.0}, {260.0, -20.0}, {260.0, -120.0}, {318.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.arable_land, Pollution_Dynamics1.arable_land) annotation(
          Line(points = {{-78.0, -20.0}, {-20.0, -20.0}, {-20.0, 26.0}, {-176.0, 26.0}, {-176.0, 64.0}, {-122.0, 64.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.arable_land, Food_Production1.arable_land) annotation(
          Line(points = {{-122.0, 64.0}, {-176.0, 64.0}, {-176.0, -112.0}, {-122.0, -112.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.arable_land, Labor_Utilization1.arable_land) annotation(
          Line(points = {{-78.0, -20.0}, {40.0, -20.0}, {40.0, -36.0}, {98.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.arable_land, Human_Ecological_Footprint1.arable_land) annotation(
          Line(points = {{98.0, -36.0}, {40.0, -36.0}, {40.0, -64.0}, {264.0, -64.0}, {264.0, 190.0}, {318.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_output, Pollution_Dynamics1.industrial_output) annotation(
          Line(points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, 22.0}, {-184.0, 22.0}, {-184.0, 80.0}, {-122.0, 80.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.industrial_output, Food_Production1.industrial_output) annotation(
          Line(points = {{-122.0, 80.0}, {-184.0, 80.0}, {-184.0, -136.0}, {-122.0, -136.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.industrial_output, Service_Sector_Investment1.industrial_output) annotation(
          Line(points = {{-122.0, -136.0}, {-184.0, -136.0}, {-184.0, -224.0}, {-122.0, -224.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_output, NR_Resource_Utilization1.industrial_output) annotation(
          Line(points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, -130.0}, {318.0, -130.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Arable_Land_Dynamics1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {-188.0, 30.0}, {-188.0, -28.0}, {-122.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.ind_out_pc, Food_Production1.ind_out_pc) annotation(
          Line(points = {{-122.0, -28.0}, {-188.0, -28.0}, {-188.0, -128.0}, {-122.0, -128.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.ind_out_pc, Service_Sector_Investment1.ind_out_pc) annotation(
          Line(points = {{-122.0, -128.0}, {-188.0, -128.0}, {-188.0, -232.0}, {-122.0, -232.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Human_Fertility1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {36.0, 30.0}, {36.0, 170.0}, {98.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.ind_out_pc, Labor_Utilization1.ind_out_pc) annotation(
          Line(points = {{98.0, 170.0}, {36.0, 170.0}, {36.0, -12.0}, {98.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Human_Welfare_Index1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 70.0}, {318.0, 70.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Life_Expectancy1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -12.0}, {318.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, NR_Resource_Utilization1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -110.0}, {318.0, -110.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.serv_out_pc, Human_Fertility1.serv_out_pc) annotation(
          Line(points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 190.0}, {98.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 18.0}, {70.0, 18.0}, {108.0, 18.0}, {108.0, 2.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(points = {{318.0, -4.0}, {218.0, -4.0}, {218.0, 18.0}, {108.0, 18.0}, {108.0, 10.0}, {108.0, 2.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_index, Land_Fertility1.ppoll_index) annotation(
          Line(points = {{-78.0, 80.0}, {20.0, 80.0}, {20.0, -130.0}, {98.0, -130.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.ppoll_index, Life_Expectancy1.ppoll_index) annotation(
          Line(points = {{98.0, -130.0}, {20.0, -130.0}, {20.0, -70.0}, {268.0, -70.0}, {268.0, -36.0}, {318.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.food_ratio, Land_Fertility1.food_ratio) annotation(
          Line(points = {{-78.0, -104.0}, {10.0, -104.0}, {10.0, -110.0}, {98.0, -110.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.land_yield, Arable_Land_Dynamics1.land_yield) annotation(
          Line(points = {{-78.0, -112.0}, {-20.0, -112.0}, {-20.0, -60.0}, {-192.0, -60.0}, {-192.0, -4.0}, {-122.0, -4.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.food_pc, Life_Expectancy1.food_pc) annotation(
          Line(points = {{-96.0, -98.0}, {-96.0, -74.0}, {256.0, -74.0}, {256.0, -28.0}, {318.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.marg_prod_agr_inp, Arable_Land_Dynamics1.marg_prod_agr_inp) annotation(
          Line(points = {{-78.0, -120.0}, {-24.0, -120.0}, {-24.0, -64.0}, {-172.0, -64.0}, {-172.0, -12.0}, {-122.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.agr_inp_per_hect, Pollution_Dynamics1.agr_inp_per_hect) annotation(
          Line(points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -56.0}, {-196.0, -56.0}, {-196.0, 72.0}, {-122.0, 72.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.agr_inp_per_hect, Labor_Utilization1.agr_inp_per_hect) annotation(
          Line(points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -28.0}, {98.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.s_fioa_agr, Industrial_Investment1.s_fioa_agr) annotation(
          Line(points = {{-78.0, -136.0}, {-4.0, -136.0}, {-4.0, 64.0}, {98.0, 64.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.service_capital, Labor_Utilization1.service_capital) annotation(
          Line(points = {{-78.0, -220.0}, {4.0, -220.0}, {4.0, -4.0}, {98.0, -4.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.p_fr_inp_for_land_maint, Land_Fertility1.p_fr_inp_for_land_maint) annotation(
          Line(points = {{-88.0, -142.0}, {-88.0, -160.0}, {44.0, -160.0}, {44.0, -120.0}, {98.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.s_fioa_serv, Industrial_Investment1.s_fioa_serv) annotation(
          Line(points = {{-78.0, -230.0}, {16.0, -230.0}, {16.0, 38.0}, {108.0, 38.0}, {108.0, 58.0}}, color = {0, 0, 191}, visible = true));
        connect(Population_Dynamics1.labor_force, Labor_Utilization1.labor_force) annotation(
          Line(points = {{-78.0, 170.0}, {12.0, 170.0}, {12.0, -60.0}, {108.0, -60.0}, {108.0, -42.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.total_fertility, Population_Dynamics1.total_fertility) annotation(
          Line(points = {{142.0, 180.0}, {196.0, 180.0}, {196.0, 144.0}, {-200.0, 144.0}, {-200.0, 190.0}, {-122.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_capital, Labor_Utilization1.industrial_capital) annotation(
          Line(points = {{142.0, 76.0}, {196.0, 76.0}, {196.0, -78.0}, {44.0, -78.0}, {44.0, -20.0}, {98.0, -20.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.land_fertility, Food_Production1.land_fertility) annotation(
          Line(points = {{142.0, -120.0}, {192.0, -120.0}, {192.0, -164.0}, {-112.0, -164.0}, {-112.0, -142.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.life_expectancy, Human_Welfare_Index1.life_expectancy) annotation(
          Line(points = {{362.0, -20.0}, {420.0, -20.0}, {420.0, 40.0}, {250.0, 40.0}, {250.0, 90.0}, {318.0, 90.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Welfare_Index1.life_expectancy, Human_Fertility1.life_expectancy) annotation(
          Line(points = {{318.0, 90.0}, {250.0, 90.0}, {250.0, 128.0}, {32.0, 128.0}, {32.0, 180.0}, {98.0, 180.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.life_expectancy, Population_Dynamics1.life_expectancy) annotation(
          Line(points = {{98.0, 180.0}, {32.0, 180.0}, {32.0, 128.0}, {-190.0, 128.0}, {-190.0, 170.0}, {-122.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(NR_Resource_Utilization1.pc_res_use_mlt, Pollution_Dynamics1.pc_res_use_mlt) annotation(
          Line(points = {{362.0, -108.0}, {424.0, -108.0}, {424.0, 124.0}, {-176.0, 124.0}, {-176.0, 96.0}, {-122.0, 96.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.yield_tech_LYTD, Food_Production1.yield_tech_LYTD) annotation(
          Line(points = {{142.0, -110.0}, {192.0, -110.0}, {192.0, -82.0}, {-112.0, -82.0}, {-112.0, -87.9893}, {-112.0, -98.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.fr_inp_al_land_dev, Food_Production1.fr_inp_al_land_dev) annotation(
          Line(points = {{-78.0, -10.0}, {-28.0, -10.0}, {-28.0, -68.0}, {-172.0, -68.0}, {-172.0, -120.0}, {-122.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.s_yield_mlt_air_poll, Food_Production1.s_yield_mlt_air_poll) annotation(
          Line(points = {{-78.0, 72.0}, {32.0, 72.0}, {32.0, -168.0}, {-104.0, -168.0}, {-104.0, -142.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.capital_util_fr, Service_Sector_Investment1.capital_util_fr) annotation(
          Line(points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {-172.0, -180.0}, {-172.0, -208.0}, {-122.0, -208.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_tech_mult_icor_COPM, Industrial_Investment1.ppoll_tech_mult_icor_COPM) annotation(
          Line(points = {{-88.0, 0.0}, {88.0, 0.0}}, color = {0, 0, 191}, visible = true, origin = {10.0, 88.0}));
        connect(NR_Resource_Utilization1.ind_cap_out_ratio_2_ICOR2T, Industrial_Investment1.ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(points = {{362.0, -124.0}, {428.0, -124.0}, {428.0, 120.0}, {108.0, 120.0}, {108.0, 102.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.capital_util_fr, Industrial_Investment1.capital_util_fr) annotation(
          Line(points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {24.0, -180.0}, {24.0, 80.0}, {98.0, 80.0}}, color = {0, 0, 191}, visible = true));
        connect(NR_Resource_Utilization1.s_fr_cap_al_obt_res, Industrial_Investment1.s_fr_cap_al_obt_res) annotation(
          Line(points = {{362.0, -132.0}, {432.0, -132.0}, {432.0, 132.0}, {44.0, 132.0}, {44.0, 72.0}, {98.0, 72.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_gen_rt, Human_Ecological_Footprint1.ppoll_gen_rt) annotation(
          Line(points = {{-78.0, 64.0}, {-20.0, 64.0}, {-20.0, 148.0}, {256.0, 148.0}, {256.0, 170.0}, {318.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.urban_ind_land, Human_Ecological_Footprint1.urban_ind_land) annotation(
          Line(points = {{-78.0, -30.0}, {-24.0, -30.0}, {-24.0, 136.0}, {252.0, 136.0}, {252.0, 180.0}, {318.0, 180.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.yield_tech_mult_icor_COYM, Industrial_Investment1.yield_tech_mult_icor_COYM) annotation(
          Line(points = {{-96.0, -142.0}, {-96.0, -174.0}, {28.0, -174.0}, {28.0, 96.0}, {98.0, 96.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.tot_agric_invest, Arable_Land_Dynamics1.tot_agric_invest) annotation(
          Line(points = {{-88.0, -98.0}, {-88.0, -52.0}, {-200.0, -52.0}, {-200.0, -20.0}, {-122.0, -20.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-220.0, -260.0}, {442.0, 222.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, 98.0}, {300.0, 170.0}}, textString = "More Accessible", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-82.0, 24.0}, {304.0, 90.0}}, textString = "Non-recoverable", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-112.0, -68.0}, {326.0, 36.0}}, textString = "Natural Resources,", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-138.0, -146.0}, {360.0, -42.0}}, textString = "Pollution Control, and", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-200.0, -324.0}, {418.0, -16.0}}, textString = "Land Yield Enhancement", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})),
          experiment(StartTime = 1900, StopTime = 2100),
          experimentSetupOutput,
          Documentation(info = "<html>
This is <font color=red><b>Scenario #4</b></font> of the <font color=red><b>WORLD3</b></font> model. This scenario starts out with the same assumptions as <font color=red><b>Scenario #3</b></font>.  Improvements in pollution control technology have led to an increase in the population. There are additional mouths to be fed, but unfortunately, not enough food is being grown to feed the population in the long run.  The population stagnates, and there is massive hunger in the world. <p>
 
In this new scenario, it is thus postulated that additional efforts are being undertaken to increase the yield of food per hectare of arable land. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.L., W.W. Behrens III, D.M., Meadows, R.F. Naill, J. Randers, and E.K.O. Zahn (1974), <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>, Wright-Allen Press, 637p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
 
In order to accomplish this change, you need to modify the table P_Yield_Tech_Chg_Mlt_LYCM  that models a multiplier to the investment in technology to improve land yield: <p>
<font color=red>parameter Real p_yield_tech_chg_mlt[:] = {0,0,<b>0.04</b>,<b>0.04</b>} \"Yield technology change multiplier\";</font>. <p>
 
<hr> <p>
 
Simulate the model from 1900 until 2100, and display the same variables as in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> at page 215: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_10.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_11.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_12.png\"> <p>
 
<hr> <p>
 
The results obtained are visibly different from those shown in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> primarily due to the  quantization error. <p>
 
In this model, some of the gains are huge.  For example, the variable <b>agr_inp_per_hect</b>, i.e., the investment in agricultural production per hectare of arable land, that in earlier scenarios assumed values in the range <b>[2,30] dollars per hectare and year</b> suddenly assumes values of several <b>thousands of dollars per hectare and year</b>.  We observe hyperinflation at work. <p>
 
Due to the amplified quantization errors, the collapse happens more than 20 years earlier than shown in the book.  If we were to simulate beyond the year 2100, the results obtained using the <font color=red><b>Modelica</b></font> implementation could be considered similar to those obtained using <font color=red><b>STELLA</b></font>.  The trajectories simply get shifted in time.  However, since we stop the simulation in 2100, our results look qualitatively different. <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_4;

      model Scenario_5 "More accessible non-recoverable natural resources, pollution control, land yield enhancement, and erosion protection"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 400 "Desired annual industrial per capita output";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2 "Controlled average life of agricultural input";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 14 "Controlled average life of industrial capital";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 20 "Controlled average life of service sector capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real reproductive_lifetime(unit = "yr") = 30.0 "Reproductive life time";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_fcaor_time(unit = "yr") = 2002 "Year of capital allocation to resource use efficiency";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 4000 "Year of continued fertility change";
        parameter Real t_ind_equil_time(unit = "yr") = 4000 "Year of industrial equilibrium";
        parameter Real t_land_life_time(unit = "yr") = 2002 "Land life time";
        parameter Real t_policy_year(unit = "yr") = 2002 "Year of policy change";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 4000 "Time to zero population growth";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_ppoll_tech_chg_mlt[:] = {-0.04, -0.04, 0, 0} "Persistent pollution technology change multiplier";
        parameter Real p_res_tech_chg_mlt[:] = {0, 0, 0, 0} "Resource technology change multiplier";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0.04, 0.04} "Yield technology change multiplier";
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real nr_resources_init(unit = "ton") = 2000000000000.0 "Initial available non-recoverable resources";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        output Real population "Total human world population";
        output Real food(unit = "dollar/yr") "Total annually produced food";
        output Real industrial_output(unit = "dollar/yr") "Total annual world industrial output";
        output Real ppoll_index "Persistent pollution index";
        output Real nr_resources "Remaining non-recoverable natural resources";
        output Real fioa_ind "Fraction of industrial output allocated to industrial/military complex";
        output Real s_fioa_agr "Fraction of industrial output allocated to food production";
        output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        output Real life_expectancy(unit = "yr") "Life expectancy";
        output Real food_pc(unit = "dollar/yr") "Total annual food per person";
        output Real serv_out_pc(unit = "dollar/yr") "Total annual services per person";
        output Real ind_out_pc(unit = "dollar/yr") "Total annual consumer goods per person";
        output Real human_ecological_footprint(unit = "Gha") "Human ecological footprint";
        output Real human_welfare_index "Human welfare index";
        SystemDynamics.WorldDynamics.World3.Population_Dynamics Population_Dynamics1(pop1_init = pop1_init, pop2_init = pop2_init, pop3_init = pop3_init, pop4_init = pop4_init, labor_force_partic = labor_force_partic, reproductive_lifetime = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "Population dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Pollution_Dynamics Pollution_Dynamics1(agr_mtl_toxic_index = agr_mtl_toxic_index, assim_half_life_1970 = assim_half_life_1970, des_ppoll_index_DPOLX = des_ppoll_index_DPOLX, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl, frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index, ind_out_in_1970 = ind_out_in_1970, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1, pers_pollution_init = pers_pollution_init, ppoll_in_1970 = ppoll_in_1970, ppoll_tech_init = ppoll_tech_init, ppoll_trans_del = ppoll_trans_del, t_air_poll_time = t_air_poll_time, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, p_ppoll_tech_chg_mlt = p_ppoll_tech_chg_mlt) "Persistent pollution generation" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Arable_Land_Dynamics Arable_Land_Dynamics1(arable_land_init = arable_land_init, avg_life_land_norm = avg_life_land_norm, inherent_land_fert = inherent_land_fert, pot_arable_land_init = pot_arable_land_init, pot_arable_land_tot = pot_arable_land_tot, social_discount = social_discount, t_land_life_time = t_land_life_time, urban_ind_land_init = urban_ind_land_init, urb_ind_land_dev_time = urb_ind_land_dev_time) "Arable land dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Food_Production Food_Production1(agr_inp_init = agr_inp_init, food_short_perc_del = food_short_perc_del, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2, p_land_yield_fact_1 = p_land_yield_fact_1, perc_food_ratio_init = perc_food_ratio_init, processing_loss = processing_loss, subsist_food_pc = subsist_food_pc, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, land_fr_harvested = land_fr_harvested) "Food production" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Ecological_Footprint Human_Ecological_Footprint1 "Human ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {340.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Fertility Human_Fertility1(des_compl_fam_size_norm = des_compl_fam_size_norm, hlth_serv_impact_del = hlth_serv_impact_del, income_expect_avg_time = income_expect_avg_time, lifet_perc_del = lifet_perc_del, max_tot_fert_norm = max_tot_fert_norm, social_adj_del = social_adj_del, t_fert_cont_eff_time = t_fert_cont_eff_time, t_zero_pop_grow_time = t_zero_pop_grow_time) "Human fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Welfare_Index Human_Welfare_Index1 "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {340.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Industrial_Investment Industrial_Investment1(industrial_capital_init = industrial_capital_init, ind_out_pc_des = ind_out_pc_des, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2, p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1, t_ind_equil_time = t_ind_equil_time, t_policy_year = t_policy_year) "Industrial investment" annotation(
          Placement(visible = true, transformation(origin = {120.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Labor_Utilization Labor_Utilization1(labor_util_fr_del_init = labor_util_fr_del_init, labor_util_fr_del_time = labor_util_fr_del_time) "Labor utilization" annotation(
          Placement(visible = true, transformation(origin = {120.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Land_Fertility Land_Fertility1(des_food_ratio_dfr = des_food_ratio_dfr, inherent_land_fert = inherent_land_fert, land_fertility_init = land_fertility_init, t_policy_year = t_policy_year, yield_tech_init = yield_tech_init, p_yield_tech_chg_mlt = p_yield_tech_chg_mlt) "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Life_Expectancy Life_Expectancy1(hlth_serv_impact_del = hlth_serv_impact_del, life_expect_norm = life_expect_norm, subsist_food_pc = subsist_food_pc) "Life expectancy" annotation(
          Placement(visible = true, transformation(origin = {340.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.NR_Resource_Utilization NR_Resource_Utilization1(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR, nr_resources_init = nr_resources_init, p_nr_res_use_fact_1 = p_nr_res_use_fact_1, res_tech_init = res_tech_init, t_policy_year = t_policy_year, t_fcaor_time = t_fcaor_time, tech_dev_del_TDD = tech_dev_del_TDD, p_fr_cap_al_obt_res_2 = p_fr_cap_al_obt_res_2, p_res_tech_chg_mlt = p_res_tech_chg_mlt) "Non-recoverable natural resource utilization" annotation(
          Placement(visible = true, transformation(origin = {340.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Service_Sector_Investment Service_Sector_Investment1(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2, service_capital_init = service_capital_init) "Service sector investment" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -220.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      equation
        connect(Service_Sector_Investment1.serv_out_pc, Human_Fertility1.serv_out_pc) annotation(
          Line(visible = true, points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 190.0}, {98.0, 190.0}}, color = {0, 0, 191}));
        connect(Food_Production1.ind_out_pc, Service_Sector_Investment1.ind_out_pc) annotation(
          Line(visible = true, points = {{-122.0, -128.0}, {-188.0, -128.0}, {-188.0, -232.0}, {-122.0, -232.0}}, color = {0, 0, 191}));
        connect(Food_Production1.industrial_output, Service_Sector_Investment1.industrial_output) annotation(
          Line(visible = true, points = {{-122.0, -136.0}, {-184.0, -136.0}, {-184.0, -224.0}, {-122.0, -224.0}}, color = {0, 0, 191}));
        connect(Food_Production1.population, Service_Sector_Investment1.population) annotation(
          Line(visible = true, points = {{-122.0, -104.0}, {-180.0, -104.0}, {-180.0, -216.0}, {-122.0, -216.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.capital_util_fr, Service_Sector_Investment1.capital_util_fr) annotation(
          Line(visible = true, points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {-172.0, -180.0}, {-172.0, -208.0}, {-122.0, -208.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(visible = true, points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 18.0}, {70.0, 18.0}, {108.0, 18.0}, {108.0, 2.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.service_capital, Labor_Utilization1.service_capital) annotation(
          Line(visible = true, points = {{-78.0, -220.0}, {4.0, -220.0}, {4.0, -4.0}, {98.0, -4.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.s_fioa_serv, Industrial_Investment1.s_fioa_serv) annotation(
          Line(visible = true, points = {{-78.0, -230.0}, {16.0, -230.0}, {16.0, 38.0}, {108.0, 38.0}, {108.0, 58.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_tech_mult_icor_COPM, Industrial_Investment1.ppoll_tech_mult_icor_COPM) annotation(
          Line(visible = true, origin = {10.0, 88.0}, points = {{-88.0, 0.0}, {88.0, 0.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.population, NR_Resource_Utilization1.population) annotation(
          Line(visible = true, points = {{318.0, -20.0}, {260.0, -20.0}, {260.0, -120.0}, {318.0, -120.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.life_expectancy, Population_Dynamics1.life_expectancy) annotation(
          Line(visible = true, points = {{98.0, 180.0}, {32.0, 180.0}, {32.0, 128.0}, {-190.0, 128.0}, {-190.0, 170.0}, {-122.0, 170.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.total_fertility, Population_Dynamics1.total_fertility) annotation(
          Line(visible = true, points = {{142.0, 180.0}, {196.0, 180.0}, {196.0, 144.0}, {-200.0, 144.0}, {-200.0, 190.0}, {-122.0, 190.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Human_Fertility1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {36.0, 30.0}, {36.0, 170.0}, {98.0, 170.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.population, Pollution_Dynamics1.population) annotation(
          Line(visible = true, points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 140.0}, {-180.0, 140.0}, {-180.0, 88.0}, {-122.0, 88.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.arable_land, Pollution_Dynamics1.arable_land) annotation(
          Line(visible = true, points = {{-78.0, -20.0}, {-20.0, -20.0}, {-20.0, 26.0}, {-176.0, 26.0}, {-176.0, 64.0}, {-122.0, 64.0}}, color = {0, 0, 191}));
        connect(Food_Production1.marg_prod_agr_inp, Arable_Land_Dynamics1.marg_prod_agr_inp) annotation(
          Line(visible = true, points = {{-78.0, -120.0}, {-24.0, -120.0}, {-24.0, -64.0}, {-172.0, -64.0}, {-172.0, -12.0}, {-122.0, -12.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Arable_Land_Dynamics1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {-188.0, 30.0}, {-188.0, -28.0}, {-122.0, -28.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.population, Arable_Land_Dynamics1.population) annotation(
          Line(visible = true, points = {{-122.0, 88.0}, {-180.0, 88.0}, {-180.0, -36.0}, {-122.0, -36.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.urban_ind_land, Human_Ecological_Footprint1.urban_ind_land) annotation(
          Line(visible = true, points = {{-78.0, -30.0}, {-24.0, -30.0}, {-24.0, 136.0}, {252.0, 136.0}, {252.0, 180.0}, {318.0, 180.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.fr_inp_al_land_dev, Food_Production1.fr_inp_al_land_dev) annotation(
          Line(visible = true, points = {{-78.0, -10.0}, {-28.0, -10.0}, {-28.0, -68.0}, {-172.0, -68.0}, {-172.0, -120.0}, {-122.0, -120.0}}, color = {0, 0, 191}));
        connect(Food_Production1.tot_agric_invest, Arable_Land_Dynamics1.tot_agric_invest) annotation(
          Line(visible = true, points = {{-88.0, -98.0}, {-88.0, -52.0}, {-200.0, -52.0}, {-200.0, -20.0}, {-122.0, -20.0}}, color = {0, 0, 191}));
        connect(Food_Production1.food_ratio, Land_Fertility1.food_ratio) annotation(
          Line(visible = true, points = {{-78.0, -104.0}, {10.0, -104.0}, {10.0, -110.0}, {98.0, -110.0}}, color = {0, 0, 191}));
        connect(Food_Production1.land_yield, Arable_Land_Dynamics1.land_yield) annotation(
          Line(visible = true, points = {{-78.0, -112.0}, {-20.0, -112.0}, {-20.0, -60.0}, {-192.0, -60.0}, {-192.0, -4.0}, {-122.0, -4.0}}, color = {0, 0, 191}));
        connect(Food_Production1.agr_inp_per_hect, Pollution_Dynamics1.agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -56.0}, {-196.0, -56.0}, {-196.0, 72.0}, {-122.0, 72.0}}, color = {0, 0, 191}));
        connect(Food_Production1.p_fr_inp_for_land_maint, Land_Fertility1.p_fr_inp_for_land_maint) annotation(
          Line(visible = true, points = {{-88.0, -142.0}, {-88.0, -160.0}, {44.0, -160.0}, {44.0, -120.0}, {98.0, -120.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.land_fertility, Food_Production1.land_fertility) annotation(
          Line(visible = true, points = {{142.0, -120.0}, {192.0, -120.0}, {192.0, -164.0}, {-112.0, -164.0}, {-112.0, -142.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.ind_out_pc, Food_Production1.ind_out_pc) annotation(
          Line(visible = true, points = {{-122.0, -28.0}, {-188.0, -28.0}, {-188.0, -128.0}, {-122.0, -128.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.industrial_output, Food_Production1.industrial_output) annotation(
          Line(visible = true, points = {{-122.0, 80.0}, {-184.0, 80.0}, {-184.0, -136.0}, {-122.0, -136.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.arable_land, Food_Production1.arable_land) annotation(
          Line(visible = true, points = {{-122.0, 64.0}, {-176.0, 64.0}, {-176.0, -112.0}, {-122.0, -112.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.population, Food_Production1.population) annotation(
          Line(visible = true, points = {{-122.0, -36.0}, {-180.0, -36.0}, {-180.0, -104.0}, {-122.0, -104.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.yield_tech_LYTD, Food_Production1.yield_tech_LYTD) annotation(
          Line(visible = true, points = {{142.0, -110.0}, {192.0, -110.0}, {192.0, -82.0}, {-112.0, -82.0}, {-112.0, -86.7587}, {-112.0, -98.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_index, Land_Fertility1.ppoll_index) annotation(
          Line(visible = true, points = {{-78.0, 80.0}, {20.0, 80.0}, {20.0, -130.0}, {98.0, -130.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, NR_Resource_Utilization1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -110.0}, {318.0, -110.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.ind_cap_out_ratio_2_ICOR2T, Industrial_Investment1.ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(visible = true, points = {{362.0, -124.0}, {428.0, -124.0}, {428.0, 120.0}, {108.0, 120.0}, {108.0, 102.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.pc_res_use_mlt, Pollution_Dynamics1.pc_res_use_mlt) annotation(
          Line(visible = true, points = {{362.0, -108.0}, {424.0, -108.0}, {424.0, 124.0}, {-176.0, 124.0}, {-176.0, 96.0}, {-122.0, 96.0}}, color = {0, 0, 191}));
        connect(Food_Production1.food_pc, Life_Expectancy1.food_pc) annotation(
          Line(visible = true, points = {{-96.0, -98.0}, {-96.0, -74.0}, {256.0, -74.0}, {256.0, -28.0}, {318.0, -28.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.ppoll_index, Life_Expectancy1.ppoll_index) annotation(
          Line(visible = true, points = {{98.0, -130.0}, {20.0, -130.0}, {20.0, -70.0}, {268.0, -70.0}, {268.0, -36.0}, {318.0, -36.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Life_Expectancy1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -12.0}, {318.0, -12.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.capital_util_fr, Industrial_Investment1.capital_util_fr) annotation(
          Line(visible = true, points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {24.0, -180.0}, {24.0, 80.0}, {98.0, 80.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(visible = true, points = {{318.0, -4.0}, {218.0, -4.0}, {218.0, 18.0}, {108.0, 18.0}, {108.0, 11.6909}, {108.0, 2.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.ind_out_pc, Labor_Utilization1.ind_out_pc) annotation(
          Line(visible = true, points = {{98.0, 170.0}, {36.0, 170.0}, {36.0, -12.0}, {98.0, -12.0}}, color = {0, 0, 191}));
        connect(Food_Production1.agr_inp_per_hect, Labor_Utilization1.agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -28.0}, {98.0, -28.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.labor_force, Labor_Utilization1.labor_force) annotation(
          Line(visible = true, points = {{-78.0, 170.0}, {12.0, 170.0}, {12.0, -60.0}, {108.0, -60.0}, {108.0, -42.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.arable_land, Labor_Utilization1.arable_land) annotation(
          Line(visible = true, points = {{-78.0, -20.0}, {40.0, -20.0}, {40.0, -36.0}, {98.0, -36.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.arable_land, Human_Ecological_Footprint1.arable_land) annotation(
          Line(visible = true, points = {{98.0, -36.0}, {40.0, -36.0}, {40.0, -64.0}, {264.0, -64.0}, {264.0, 190.0}, {318.0, 190.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_gen_rt, Human_Ecological_Footprint1.ppoll_gen_rt) annotation(
          Line(visible = true, points = {{-78.0, 64.0}, {-20.0, 64.0}, {-20.0, 148.0}, {256.0, 148.0}, {256.0, 170.0}, {318.0, 170.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.s_yield_mlt_air_poll, Food_Production1.s_yield_mlt_air_poll) annotation(
          Line(visible = true, points = {{-78.0, 72.0}, {32.0, 72.0}, {32.0, -168.0}, {-104.0, -168.0}, {-104.0, -142.0}}, color = {0, 0, 191}));
        connect(Food_Production1.yield_tech_mult_icor_COYM, Industrial_Investment1.yield_tech_mult_icor_COYM) annotation(
          Line(visible = true, points = {{-96.0, -142.0}, {-96.0, -174.0}, {28.0, -174.0}, {28.0, 96.0}, {98.0, 96.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.s_fr_cap_al_obt_res, Industrial_Investment1.s_fr_cap_al_obt_res) annotation(
          Line(visible = true, points = {{362.0, -132.0}, {432.0, -132.0}, {432.0, 132.0}, {44.0, 132.0}, {44.0, 72.0}, {98.0, 72.0}}, color = {0, 0, 191}));
        connect(Food_Production1.s_fioa_agr, Industrial_Investment1.s_fioa_agr) annotation(
          Line(visible = true, points = {{-78.0, -136.0}, {-4.0, -136.0}, {-4.0, 64.0}, {98.0, 64.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.population, Life_Expectancy1.population) annotation(
          Line(visible = true, points = {{116.0, 58.0}, {116.0, 34.0}, {260.0, 34.0}, {260.0, -20.0}, {318.0, -20.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.population, Industrial_Investment1.population) annotation(
          Line(visible = true, points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 34.0}, {116.0, 34.0}, {116.0, 58.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_capital, Labor_Utilization1.industrial_capital) annotation(
          Line(visible = true, points = {{142.0, 76.0}, {196.0, 76.0}, {196.0, -78.0}, {44.0, -78.0}, {44.0, -20.0}, {98.0, -20.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_output, NR_Resource_Utilization1.industrial_output) annotation(
          Line(visible = true, points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, -130.0}, {318.0, -130.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_output, Pollution_Dynamics1.industrial_output) annotation(
          Line(visible = true, points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, 22.0}, {-184.0, 22.0}, {-184.0, 80.0}, {-122.0, 80.0}}, color = {0, 0, 191}));
        connect(Human_Welfare_Index1.life_expectancy, Human_Fertility1.life_expectancy) annotation(
          Line(visible = true, points = {{318.0, 90.0}, {250.0, 90.0}, {250.0, 128.0}, {32.0, 128.0}, {32.0, 180.0}, {98.0, 180.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.life_expectancy, Human_Welfare_Index1.life_expectancy) annotation(
          Line(visible = true, points = {{362.0, -20.0}, {420.0, -20.0}, {420.0, 40.0}, {250.0, 40.0}, {250.0, 90.0}, {318.0, 90.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Human_Welfare_Index1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 70.0}, {318.0, 70.0}}, color = {0, 0, 191}));
        population = Population_Dynamics1.Population.y;
        food = Food_Production1.Food.food;
        industrial_output = Industrial_Investment1.Industrial_Output.industrial_output;
        ppoll_index = Pollution_Dynamics1.PPoll_Index.y;
        nr_resources = NR_Resource_Utilization1.NR_Resources.y;
        fioa_ind = Industrial_Investment1.FIOA_Ind.fioa_ind;
        s_fioa_agr = Food_Production1.S_FIOA_Agr.s_fioa_agr;
        s_fioa_cons = Industrial_Investment1.S_FIOA_Cons.s_fioa_cons;
        s_fioa_serv = Service_Sector_Investment1.S_FIOA_Serv.s_fioa_serv;
        s_fr_cap_al_obt_res = NR_Resource_Utilization1.S_Fr_Cap_Al_Obt_Res.s_fr_cap_al_obt_res;
        life_expectancy = Life_Expectancy1.Life_Expectancy.y;
        food_pc = Food_Production1.Food_PC.y;
        serv_out_pc = Service_Sector_Investment1.Serv_Out_PC.y;
        ind_out_pc = Industrial_Investment1.Ind_Out_PC.y;
        human_ecological_footprint = Human_Ecological_Footprint1.HEF_Human_Ecological_Footprint.hef_human_ecological_footprint;
        human_welfare_index = Human_Welfare_Index1.HWI_Human_Welfare_Index.hwi_human_welfare_index;
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-220.0, -260.0}, {442.0, 222.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, 118.0}, {300.0, 190.0}}, textString = "More Accessible", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-82.0, 64.0}, {304.0, 130.0}}, textString = "Non-recoverable", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-112.0, -14.0}, {332.0, 90.0}}, textString = "Natural Resources,", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-108.0, -72.0}, {330.0, 14.0}}, textString = "Pollution Control,", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-197.0, -248.0}, {421.0, 60.0}}, textString = "Land Yield Enhancement,", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-170.0, -276.0}, {377.0, -34.0}}, textString = "and Erosion Protection", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
          experiment(StartTime = 1900, StopTime = 2100),
          experimentSetupOutput,
          Documentation(info = "<html>
This is <font color=red><b>Scenario #5</b></font> of the <font color=red><b>WORLD3</b></font> model. This scenario starts out with the same assumptions as <font color=red><b>Scenario #4</b></font>.  Improvements in land yield enhancement have allowed more people to be fed a little while longer.  However, the effort is not sustainable.  The agricultural land loses its fertility rather quickly, and in the end, the collapse arrives even earlier than in <font color=red><b>Scenario #4</b></font>.  Humanity spends all of its money and more in trying to grow more food at all cost.  This leads to rampant hyperinflation. <p>
 
In this new scenario, it is thus postulated to spend more money earlier on for the protection of the arable land against erosion. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.L., W.W. Behrens III, D.M., Meadows, R.F. Naill, J. Randers, and E.K.O. Zahn (1974), <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>, Wright-Allen Press, 637p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
 
In order to accomplish this change, you need to reset another of the switching times in the model: <p>
<font color=red>parameter Real t_land_life_time(unit=\"yr\") = <b>2002</b> \"Land life time\";</font>. <p>
 
<hr> <p>
 
Simulate the model from 1900 until 2100, and display the same variables as in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> at page 215: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_13.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_14.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_15.png\"> <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_5;

      model Scenario_6 "More accessible non-recoverable natural resources, pollution control, land yield enhancement, erosion protection, and resource efficiency"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 400 "Desired annual industrial per capita output";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2 "Controlled average life of agricultural input";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 14 "Controlled average life of industrial capital";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 20 "Controlled average life of service sector capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real reproductive_lifetime(unit = "yr") = 30.0 "Reproductive life time";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_fcaor_time(unit = "yr") = 2002 "Year of capital allocation to resource use efficiency";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 4000 "Year of continued fertility change";
        parameter Real t_ind_equil_time(unit = "yr") = 4000 "Year of industrial equilibrium";
        parameter Real t_land_life_time(unit = "yr") = 2002 "Land life time";
        parameter Real t_policy_year(unit = "yr") = 2002 "Year of policy change";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 4000 "Time to zero population growth";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_ppoll_tech_chg_mlt[:] = {-0.04, -0.04, 0, 0} "Persistent pollution technology change multiplier";
        parameter Real p_res_tech_chg_mlt[:] = {-0.04, -0.04, 0, 0} "Resource technology change multiplier";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0.04, 0.04} "Yield technology change multiplier";
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real nr_resources_init(unit = "ton") = 2000000000000.0 "Initial available non-recoverable resources";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        output Real population "Total human world population";
        output Real food(unit = "dollar/yr") "Total annually produced food";
        output Real industrial_output(unit = "dollar/yr") "Total annual world industrial output";
        output Real ppoll_index "Persistent pollution index";
        output Real nr_resources "Remaining non-recoverable natural resources";
        output Real fioa_ind "Fraction of industrial output allocated to industrial/military complex";
        output Real s_fioa_agr "Fraction of industrial output allocated to food production";
        output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        output Real life_expectancy(unit = "yr") "Life expectancy";
        output Real food_pc(unit = "dollar/yr") "Total annual food per person";
        output Real serv_out_pc(unit = "dollar/yr") "Total annual services per person";
        output Real ind_out_pc(unit = "dollar/yr") "Total annual consumer goods per person";
        output Real human_ecological_footprint(unit = "Gha") "Human ecological footprint";
        output Real human_welfare_index "Human welfare index";
        SystemDynamics.WorldDynamics.World3.Population_Dynamics Population_Dynamics1(pop1_init = pop1_init, pop2_init = pop2_init, pop3_init = pop3_init, pop4_init = pop4_init, labor_force_partic = labor_force_partic, reproductive_lifetime = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "Population dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Pollution_Dynamics Pollution_Dynamics1(agr_mtl_toxic_index = agr_mtl_toxic_index, assim_half_life_1970 = assim_half_life_1970, des_ppoll_index_DPOLX = des_ppoll_index_DPOLX, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl, frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index, ind_out_in_1970 = ind_out_in_1970, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1, pers_pollution_init = pers_pollution_init, ppoll_in_1970 = ppoll_in_1970, ppoll_tech_init = ppoll_tech_init, ppoll_trans_del = ppoll_trans_del, t_air_poll_time = t_air_poll_time, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, p_ppoll_tech_chg_mlt = p_ppoll_tech_chg_mlt) "Persistent pollution generation" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Arable_Land_Dynamics Arable_Land_Dynamics1(arable_land_init = arable_land_init, avg_life_land_norm = avg_life_land_norm, inherent_land_fert = inherent_land_fert, pot_arable_land_init = pot_arable_land_init, pot_arable_land_tot = pot_arable_land_tot, social_discount = social_discount, t_land_life_time = t_land_life_time, urban_ind_land_init = urban_ind_land_init, urb_ind_land_dev_time = urb_ind_land_dev_time) "Arable land dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Food_Production Food_Production1(agr_inp_init = agr_inp_init, food_short_perc_del = food_short_perc_del, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2, p_land_yield_fact_1 = p_land_yield_fact_1, perc_food_ratio_init = perc_food_ratio_init, processing_loss = processing_loss, subsist_food_pc = subsist_food_pc, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, land_fr_harvested = land_fr_harvested) "Food production" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Ecological_Footprint Human_Ecological_Footprint1 "Human ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {340.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Fertility Human_Fertility1(des_compl_fam_size_norm = des_compl_fam_size_norm, hlth_serv_impact_del = hlth_serv_impact_del, income_expect_avg_time = income_expect_avg_time, lifet_perc_del = lifet_perc_del, max_tot_fert_norm = max_tot_fert_norm, social_adj_del = social_adj_del, t_fert_cont_eff_time = t_fert_cont_eff_time, t_zero_pop_grow_time = t_zero_pop_grow_time) "Human fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Welfare_Index Human_Welfare_Index1 "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {340.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Industrial_Investment Industrial_Investment1(industrial_capital_init = industrial_capital_init, ind_out_pc_des = ind_out_pc_des, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2, p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1, t_ind_equil_time = t_ind_equil_time, t_policy_year = t_policy_year) "Industrial investment" annotation(
          Placement(visible = true, transformation(origin = {120.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Labor_Utilization Labor_Utilization1(labor_util_fr_del_init = labor_util_fr_del_init, labor_util_fr_del_time = labor_util_fr_del_time) "Labor utilization" annotation(
          Placement(visible = true, transformation(origin = {120.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Land_Fertility Land_Fertility1(des_food_ratio_dfr = des_food_ratio_dfr, inherent_land_fert = inherent_land_fert, land_fertility_init = land_fertility_init, t_policy_year = t_policy_year, yield_tech_init = yield_tech_init, p_yield_tech_chg_mlt = p_yield_tech_chg_mlt) "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Life_Expectancy Life_Expectancy1(hlth_serv_impact_del = hlth_serv_impact_del, life_expect_norm = life_expect_norm, subsist_food_pc = subsist_food_pc) "Life expectancy" annotation(
          Placement(visible = true, transformation(origin = {340.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.NR_Resource_Utilization NR_Resource_Utilization1(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR, nr_resources_init = nr_resources_init, p_nr_res_use_fact_1 = p_nr_res_use_fact_1, res_tech_init = res_tech_init, t_policy_year = t_policy_year, t_fcaor_time = t_fcaor_time, tech_dev_del_TDD = tech_dev_del_TDD, p_fr_cap_al_obt_res_2 = p_fr_cap_al_obt_res_2, p_res_tech_chg_mlt = p_res_tech_chg_mlt) "Non-recoverable natural resource utilization" annotation(
          Placement(visible = true, transformation(origin = {340.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Service_Sector_Investment Service_Sector_Investment1(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2, service_capital_init = service_capital_init) "Service sector investment" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -220.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      equation
        connect(Service_Sector_Investment1.service_capital, Labor_Utilization1.service_capital) annotation(
          Line(visible = true, points = {{-78.0, -220.0}, {4.0, -220.0}, {4.0, -4.0}, {98.0, -4.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.ind_cap_out_ratio_2_ICOR2T, Industrial_Investment1.ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(visible = true, points = {{362.0, -124.0}, {428.0, -124.0}, {428.0, 120.0}, {108.0, 120.0}, {108.0, 102.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Human_Welfare_Index1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 70.0}, {318.0, 70.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.life_expectancy, Human_Welfare_Index1.life_expectancy) annotation(
          Line(visible = true, points = {{362.0, -20.0}, {420.0, -20.0}, {420.0, 40.0}, {250.0, 40.0}, {250.0, 90.0}, {318.0, 90.0}}, color = {0, 0, 191}));
        connect(Human_Welfare_Index1.life_expectancy, Human_Fertility1.life_expectancy) annotation(
          Line(visible = true, points = {{318.0, 90.0}, {250.0, 90.0}, {250.0, 128.0}, {32.0, 128.0}, {32.0, 180.0}, {98.0, 180.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_capital, Labor_Utilization1.industrial_capital) annotation(
          Line(visible = true, points = {{142.0, 76.0}, {196.0, 76.0}, {196.0, -78.0}, {44.0, -78.0}, {44.0, -20.0}, {98.0, -20.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_output, Pollution_Dynamics1.industrial_output) annotation(
          Line(visible = true, points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, 22.0}, {-184.0, 22.0}, {-184.0, 80.0}, {-122.0, 80.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_output, NR_Resource_Utilization1.industrial_output) annotation(
          Line(visible = true, points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, -130.0}, {318.0, -130.0}}, color = {0, 0, 191}));
        connect(Food_Production1.yield_tech_mult_icor_COYM, Industrial_Investment1.yield_tech_mult_icor_COYM) annotation(
          Line(visible = true, points = {{-96.0, -142.0}, {-96.0, -174.0}, {28.0, -174.0}, {28.0, 96.0}, {98.0, 96.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.s_fr_cap_al_obt_res, Industrial_Investment1.s_fr_cap_al_obt_res) annotation(
          Line(visible = true, points = {{362.0, -132.0}, {432.0, -132.0}, {432.0, 132.0}, {44.0, 132.0}, {44.0, 72.0}, {98.0, 72.0}}, color = {0, 0, 191}));
        connect(Food_Production1.s_fioa_agr, Industrial_Investment1.s_fioa_agr) annotation(
          Line(visible = true, points = {{-78.0, -136.0}, {-4.0, -136.0}, {-4.0, 64.0}, {98.0, 64.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.s_fioa_serv, Industrial_Investment1.s_fioa_serv) annotation(
          Line(visible = true, points = {{-78.0, -230.0}, {16.0, -230.0}, {16.0, 38.0}, {108.0, 38.0}, {108.0, 58.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.population, Industrial_Investment1.population) annotation(
          Line(visible = true, points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 34.0}, {116.0, 34.0}, {116.0, 58.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.population, Life_Expectancy1.population) annotation(
          Line(visible = true, points = {{116.0, 58.0}, {116.0, 34.0}, {260.0, 34.0}, {260.0, -20.0}, {318.0, -20.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(visible = true, points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 18.0}, {70.0, 18.0}, {108.0, 18.0}, {108.0, 2.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(visible = true, points = {{318.0, -4.0}, {218.0, -4.0}, {218.0, 18.0}, {108.0, 18.0}, {108.0, 10.0}, {108.0, 2.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.ind_out_pc, Labor_Utilization1.ind_out_pc) annotation(
          Line(visible = true, points = {{98.0, 170.0}, {36.0, 170.0}, {36.0, -12.0}, {98.0, -12.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.arable_land, Labor_Utilization1.arable_land) annotation(
          Line(visible = true, points = {{-78.0, -20.0}, {40.0, -20.0}, {40.0, -36.0}, {98.0, -36.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.arable_land, Human_Ecological_Footprint1.arable_land) annotation(
          Line(visible = true, points = {{98.0, -36.0}, {40.0, -36.0}, {40.0, -64.0}, {264.0, -64.0}, {264.0, 190.0}, {318.0, 190.0}}, color = {0, 0, 191}));
        connect(Food_Production1.agr_inp_per_hect, Labor_Utilization1.agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -28.0}, {98.0, -28.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.labor_force, Labor_Utilization1.labor_force) annotation(
          Line(visible = true, points = {{-78.0, 170.0}, {12.0, 170.0}, {12.0, -60.0}, {108.0, -60.0}, {108.0, -42.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.capital_util_fr, Service_Sector_Investment1.capital_util_fr) annotation(
          Line(visible = true, points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {-172.0, -180.0}, {-172.0, -208.0}, {-122.0, -208.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.capital_util_fr, Industrial_Investment1.capital_util_fr) annotation(
          Line(visible = true, points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {24.0, -180.0}, {24.0, 80.0}, {98.0, 80.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Life_Expectancy1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -12.0}, {318.0, -12.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.ppoll_index, Life_Expectancy1.ppoll_index) annotation(
          Line(visible = true, points = {{98.0, -130.0}, {20.0, -130.0}, {20.0, -70.0}, {268.0, -70.0}, {268.0, -36.0}, {318.0, -36.0}}, color = {0, 0, 191}));
        connect(Food_Production1.food_pc, Life_Expectancy1.food_pc) annotation(
          Line(visible = true, points = {{-96.0, -98.0}, {-96.0, -74.0}, {256.0, -74.0}, {256.0, -28.0}, {318.0, -28.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.pc_res_use_mlt, Pollution_Dynamics1.pc_res_use_mlt) annotation(
          Line(visible = true, points = {{362.0, -108.0}, {424.0, -108.0}, {424.0, 124.0}, {-176.0, 124.0}, {-176.0, 96.0}, {-122.0, 96.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, NR_Resource_Utilization1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -110.0}, {318.0, -110.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.yield_tech_LYTD, Food_Production1.yield_tech_LYTD) annotation(
          Line(visible = true, points = {{142.0, -110.0}, {192.0, -110.0}, {192.0, -82.0}, {-112.0, -82.0}, {-112.0, -90.0}, {-112.0, -98.0}}, color = {0, 0, 191}));
        connect(Food_Production1.p_fr_inp_for_land_maint, Land_Fertility1.p_fr_inp_for_land_maint) annotation(
          Line(visible = true, points = {{-88.0, -142.0}, {-88.0, -160.0}, {44.0, -160.0}, {44.0, -120.0}, {98.0, -120.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.land_fertility, Food_Production1.land_fertility) annotation(
          Line(visible = true, points = {{142.0, -120.0}, {192.0, -120.0}, {192.0, -164.0}, {-112.0, -164.0}, {-112.0, -142.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.s_yield_mlt_air_poll, Food_Production1.s_yield_mlt_air_poll) annotation(
          Line(visible = true, points = {{-78.0, 72.0}, {32.0, 72.0}, {32.0, -168.0}, {-104.0, -168.0}, {-104.0, -142.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.serv_out_pc, Human_Fertility1.serv_out_pc) annotation(
          Line(visible = true, points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 190.0}, {98.0, 190.0}}, color = {0, 0, 191}));
        connect(Food_Production1.ind_out_pc, Service_Sector_Investment1.ind_out_pc) annotation(
          Line(visible = true, points = {{-122.0, -128.0}, {-188.0, -128.0}, {-188.0, -232.0}, {-122.0, -232.0}}, color = {0, 0, 191}));
        connect(Food_Production1.industrial_output, Service_Sector_Investment1.industrial_output) annotation(
          Line(visible = true, points = {{-122.0, -136.0}, {-184.0, -136.0}, {-184.0, -224.0}, {-122.0, -224.0}}, color = {0, 0, 191}));
        connect(Food_Production1.population, Service_Sector_Investment1.population) annotation(
          Line(visible = true, points = {{-122.0, -104.0}, {-180.0, -104.0}, {-180.0, -216.0}, {-122.0, -216.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.industrial_output, Food_Production1.industrial_output) annotation(
          Line(visible = true, points = {{-122.0, 80.0}, {-184.0, 80.0}, {-184.0, -136.0}, {-122.0, -136.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.ind_out_pc, Food_Production1.ind_out_pc) annotation(
          Line(visible = true, points = {{-122.0, -28.0}, {-188.0, -28.0}, {-188.0, -128.0}, {-122.0, -128.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.population, Food_Production1.population) annotation(
          Line(visible = true, points = {{-122.0, -36.0}, {-180.0, -36.0}, {-180.0, -104.0}, {-122.0, -104.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.arable_land, Food_Production1.arable_land) annotation(
          Line(visible = true, points = {{-122.0, 64.0}, {-176.0, 64.0}, {-176.0, -112.0}, {-122.0, -112.0}}, color = {0, 0, 191}));
        connect(Food_Production1.land_yield, Arable_Land_Dynamics1.land_yield) annotation(
          Line(visible = true, points = {{-78.0, -112.0}, {-20.0, -112.0}, {-20.0, -60.0}, {-192.0, -60.0}, {-192.0, -4.0}, {-122.0, -4.0}}, color = {0, 0, 191}));
        connect(Food_Production1.agr_inp_per_hect, Pollution_Dynamics1.agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -56.0}, {-196.0, -56.0}, {-196.0, 72.0}, {-122.0, 72.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_index, Land_Fertility1.ppoll_index) annotation(
          Line(visible = true, points = {{-78.0, 80.0}, {20.0, 80.0}, {20.0, -130.0}, {98.0, -130.0}}, color = {0, 0, 191}));
        connect(Food_Production1.food_ratio, Land_Fertility1.food_ratio) annotation(
          Line(visible = true, points = {{-78.0, -104.0}, {10.0, -104.0}, {10.0, -110.0}, {98.0, -110.0}}, color = {0, 0, 191}));
        connect(Food_Production1.tot_agric_invest, Arable_Land_Dynamics1.tot_agric_invest) annotation(
          Line(visible = true, points = {{-88.0, -98.0}, {-88.0, -52.0}, {-200.0, -52.0}, {-200.0, -20.0}, {-122.0, -20.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.urban_ind_land, Human_Ecological_Footprint1.urban_ind_land) annotation(
          Line(visible = true, points = {{-78.0, -30.0}, {-24.0, -30.0}, {-24.0, 136.0}, {252.0, 136.0}, {252.0, 180.0}, {318.0, 180.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.fr_inp_al_land_dev, Food_Production1.fr_inp_al_land_dev) annotation(
          Line(visible = true, points = {{-78.0, -10.0}, {-28.0, -10.0}, {-28.0, -68.0}, {-172.0, -68.0}, {-172.0, -120.0}, {-122.0, -120.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.population, Arable_Land_Dynamics1.population) annotation(
          Line(visible = true, points = {{-122.0, 88.0}, {-180.0, 88.0}, {-180.0, -36.0}, {-122.0, -36.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Arable_Land_Dynamics1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {-188.0, 30.0}, {-188.0, -28.0}, {-122.0, -28.0}}, color = {0, 0, 191}));
        connect(Food_Production1.marg_prod_agr_inp, Arable_Land_Dynamics1.marg_prod_agr_inp) annotation(
          Line(visible = true, points = {{-78.0, -120.0}, {-24.0, -120.0}, {-24.0, -64.0}, {-172.0, -64.0}, {-172.0, -12.0}, {-122.0, -12.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_gen_rt, Human_Ecological_Footprint1.ppoll_gen_rt) annotation(
          Line(visible = true, points = {{-78.0, 64.0}, {-20.0, 64.0}, {-20.0, 148.0}, {256.0, 148.0}, {256.0, 170.0}, {318.0, 170.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.arable_land, Pollution_Dynamics1.arable_land) annotation(
          Line(visible = true, points = {{-78.0, -20.0}, {-20.0, -20.0}, {-20.0, 26.0}, {-176.0, 26.0}, {-176.0, 64.0}, {-122.0, 64.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.population, Pollution_Dynamics1.population) annotation(
          Line(visible = true, points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 140.0}, {-180.0, 140.0}, {-180.0, 88.0}, {-122.0, 88.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Human_Fertility1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {36.0, 30.0}, {36.0, 170.0}, {98.0, 170.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.life_expectancy, Population_Dynamics1.life_expectancy) annotation(
          Line(visible = true, points = {{98.0, 180.0}, {32.0, 180.0}, {32.0, 128.0}, {-190.0, 128.0}, {-190.0, 170.0}, {-122.0, 170.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.total_fertility, Population_Dynamics1.total_fertility) annotation(
          Line(visible = true, points = {{142.0, 180.0}, {196.0, 180.0}, {196.0, 144.0}, {-200.0, 144.0}, {-200.0, 190.0}, {-122.0, 190.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.population, NR_Resource_Utilization1.population) annotation(
          Line(visible = true, points = {{318.0, -20.0}, {260.0, -20.0}, {260.0, -120.0}, {318.0, -120.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_tech_mult_icor_COPM, Industrial_Investment1.ppoll_tech_mult_icor_COPM) annotation(
          Line(visible = true, origin = {10.0, 88.0}, points = {{-88.0, 0.0}, {88.0, 0.0}}, color = {0, 0, 191}));
        population = Population_Dynamics1.Population.y;
        food = Food_Production1.Food.food;
        industrial_output = Industrial_Investment1.Industrial_Output.industrial_output;
        ppoll_index = Pollution_Dynamics1.PPoll_Index.y;
        nr_resources = NR_Resource_Utilization1.NR_Resources.y;
        fioa_ind = Industrial_Investment1.FIOA_Ind.fioa_ind;
        s_fioa_agr = Food_Production1.S_FIOA_Agr.s_fioa_agr;
        s_fioa_cons = Industrial_Investment1.S_FIOA_Cons.s_fioa_cons;
        s_fioa_serv = Service_Sector_Investment1.S_FIOA_Serv.s_fioa_serv;
        s_fr_cap_al_obt_res = NR_Resource_Utilization1.S_Fr_Cap_Al_Obt_Res.s_fr_cap_al_obt_res;
        life_expectancy = Life_Expectancy1.Life_Expectancy.y;
        food_pc = Food_Production1.Food_PC.y;
        serv_out_pc = Service_Sector_Investment1.Serv_Out_PC.y;
        ind_out_pc = Industrial_Investment1.Ind_Out_PC.y;
        human_ecological_footprint = Human_Ecological_Footprint1.HEF_Human_Ecological_Footprint.hef_human_ecological_footprint;
        human_welfare_index = Human_Welfare_Index1.HWI_Human_Welfare_Index.hwi_human_welfare_index;
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-220.0, -260.0}, {442.0, 222.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-80.0, 118.0}, {300.0, 190.0}}, textString = "More Accessible", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-82.0, 64.0}, {304.0, 130.0}}, textString = "Non-recoverable", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-112.0, -14.0}, {332.0, 90.0}}, textString = "Natural Resources,", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-108.0, -72.0}, {330.0, 14.0}}, textString = "Pollution Control,", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-197.0, -248.0}, {421.0, 60.0}}, textString = "Land Yield Enhancement,", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-162.0, -264.0}, {381.0, -38.0}}, textString = "Erosion Protection, and", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-138.0, -324.0}, {369.0, -98.0}}, textString = "Resource Efficiency", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})),
          experiment(StartTime = 1900, StopTime = 2100),
          experimentSetupOutput,
          Documentation(info = "<html>
This is <font color=red><b>Scenario #6</b></font> of the <font color=red><b>WORLD3</b></font> model. This scenario starts out with the same assumptions as <font color=red><b>Scenario #5</b></font>.  Land erosion protection has indeed helped.  Yet more people can live on this planet for yet more years.  In the end, however, we are once again running out of natural resources. <p>
 
In this new scenario, it is thus postulated to spend more money on increasing the efficiency of use of the remaining natural resources. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.L., W.W. Behrens III, D.M., Meadows, R.F. Naill, J. Randers, and E.K.O. Zahn (1974), <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>, Wright-Allen Press, 637p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
 
In order to accomplish this change, you need to modify the table P_Res_Tech_Chg_Mlt_NRCM that models a multiplier to the investment in technology to increase resource use efficiency: <p>
<font color=red>parameter Real p_res_tech_chg_mlt[:] = {<b>-0.04</b>,<b>-0.04</b>,0,0} \"Resource technology change multiplier\";</font>. <p>
 
<hr> <p>
 
Simulate the model from 1900 until 2100, and display the same variables as in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> at page 219: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_16.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_17.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_18.png\"> <p>
 
<hr> <p>
 
This seems to have done the trick.  The population no longer declines during the 21<sup>st</sup> century.  Is this effort sustainable? <p>
 
To answer this question, let us simulate the model once more, this time from 1900 until 2500: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_19.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_20.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_21.png\"> <p>
 
<hr> <p>
 
The effort is indeed sustainable.  The world population hovers around 10 billion people.  Yet, these people live very poorly.  In the end, no money is left for industrial production and/or services.  All of the human efforts are spent on feeding the world population in a sustainable fashion.  The life expectancy is back at its pre-industrial value of 27.6 years. <p>
 
No generation before ours lived as long and as prosperous as we do, and the likelihood is large that none coming after us will do so either. <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_6;

      model Scenario_7 "More abundant non-recoverable natural resources and birth control"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 400 "Desired annual industrial per capita output";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2 "Controlled average life of agricultural input";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 14 "Controlled average life of industrial capital";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 20 "Controlled average life of service sector capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real reproductive_lifetime(unit = "yr") = 30.0 "Reproductive life time";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_fcaor_time(unit = "yr") = 2002 "Year of capital allocation to resource use efficiency";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 2002 "Year of continued fertility change";
        parameter Real t_ind_equil_time(unit = "yr") = 4000 "Year of industrial equilibrium";
        parameter Real t_land_life_time(unit = "yr") = 4000 "Land life time";
        parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 2002 "Time to zero population growth";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_ppoll_tech_chg_mlt[:] = {0, 0, 0, 0} "Persistent pollution technology change multiplier";
        parameter Real p_res_tech_chg_mlt[:] = {0, 0, 0, 0} "Resource technology change multiplier";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0, 0} "Yield technology change multiplier";
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real nr_resources_init(unit = "ton") = 2000000000000.0 "Initial available non-recoverable resources";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        output Real population "Total human world population";
        output Real food(unit = "dollar/yr") "Total annually produced food";
        output Real industrial_output(unit = "dollar/yr") "Total annual world industrial output";
        output Real ppoll_index "Persistent pollution index";
        output Real nr_resources "Remaining non-recoverable natural resources";
        output Real fioa_ind "Fraction of industrial output allocated to industrial/military complex";
        output Real s_fioa_agr "Fraction of industrial output allocated to food production";
        output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        output Real life_expectancy(unit = "yr") "Life expectancy";
        output Real food_pc(unit = "dollar/yr") "Total annual food per person";
        output Real serv_out_pc(unit = "dollar/yr") "Total annual services per person";
        output Real ind_out_pc(unit = "dollar/yr") "Total annual consumer goods per person";
        output Real human_ecological_footprint(unit = "Gha") "Human ecological footprint";
        output Real human_welfare_index "Human welfare index";
        SystemDynamics.WorldDynamics.World3.Population_Dynamics Population_Dynamics1(pop1_init = pop1_init, pop2_init = pop2_init, pop3_init = pop3_init, pop4_init = pop4_init, labor_force_partic = labor_force_partic, reproductive_lifetime = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "Population dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Pollution_Dynamics Pollution_Dynamics1(agr_mtl_toxic_index = agr_mtl_toxic_index, assim_half_life_1970 = assim_half_life_1970, des_ppoll_index_DPOLX = des_ppoll_index_DPOLX, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl, frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index, ind_out_in_1970 = ind_out_in_1970, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1, pers_pollution_init = pers_pollution_init, ppoll_in_1970 = ppoll_in_1970, ppoll_tech_init = ppoll_tech_init, ppoll_trans_del = ppoll_trans_del, t_air_poll_time = t_air_poll_time, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, p_ppoll_tech_chg_mlt = p_ppoll_tech_chg_mlt) "Persistent pollution generation" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Arable_Land_Dynamics Arable_Land_Dynamics1(arable_land_init = arable_land_init, avg_life_land_norm = avg_life_land_norm, inherent_land_fert = inherent_land_fert, pot_arable_land_init = pot_arable_land_init, pot_arable_land_tot = pot_arable_land_tot, social_discount = social_discount, t_land_life_time = t_land_life_time, urban_ind_land_init = urban_ind_land_init, urb_ind_land_dev_time = urb_ind_land_dev_time) "Arable land dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Food_Production Food_Production1(agr_inp_init = agr_inp_init, food_short_perc_del = food_short_perc_del, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2, p_land_yield_fact_1 = p_land_yield_fact_1, perc_food_ratio_init = perc_food_ratio_init, processing_loss = processing_loss, subsist_food_pc = subsist_food_pc, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, land_fr_harvested = land_fr_harvested) "Food production" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Ecological_Footprint Human_Ecological_Footprint1 "Human ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {340.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Fertility Human_Fertility1(des_compl_fam_size_norm = des_compl_fam_size_norm, hlth_serv_impact_del = hlth_serv_impact_del, income_expect_avg_time = income_expect_avg_time, lifet_perc_del = lifet_perc_del, max_tot_fert_norm = max_tot_fert_norm, social_adj_del = social_adj_del, t_fert_cont_eff_time = t_fert_cont_eff_time, t_zero_pop_grow_time = t_zero_pop_grow_time) "Human fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Welfare_Index Human_Welfare_Index1 "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {340.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Industrial_Investment Industrial_Investment1(industrial_capital_init = industrial_capital_init, ind_out_pc_des = ind_out_pc_des, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2, p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1, t_ind_equil_time = t_ind_equil_time, t_policy_year = t_policy_year) "Industrial investment" annotation(
          Placement(visible = true, transformation(origin = {120.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Labor_Utilization Labor_Utilization1(labor_util_fr_del_init = labor_util_fr_del_init, labor_util_fr_del_time = labor_util_fr_del_time) "Labor utilization" annotation(
          Placement(visible = true, transformation(origin = {120.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Land_Fertility Land_Fertility1(des_food_ratio_dfr = des_food_ratio_dfr, inherent_land_fert = inherent_land_fert, land_fertility_init = land_fertility_init, t_policy_year = t_policy_year, yield_tech_init = yield_tech_init, p_yield_tech_chg_mlt = p_yield_tech_chg_mlt) "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Life_Expectancy Life_Expectancy1(hlth_serv_impact_del = hlth_serv_impact_del, life_expect_norm = life_expect_norm, subsist_food_pc = subsist_food_pc) "Life expectancy" annotation(
          Placement(visible = true, transformation(origin = {340.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.NR_Resource_Utilization NR_Resource_Utilization1(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR, nr_resources_init = nr_resources_init, p_nr_res_use_fact_1 = p_nr_res_use_fact_1, res_tech_init = res_tech_init, t_policy_year = t_policy_year, t_fcaor_time = t_fcaor_time, tech_dev_del_TDD = tech_dev_del_TDD, p_res_tech_chg_mlt = p_res_tech_chg_mlt, p_fr_cap_al_obt_res_2 = p_fr_cap_al_obt_res_2) "Non-recoverable natural resource utilization" annotation(
          Placement(visible = true, transformation(origin = {340.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Service_Sector_Investment Service_Sector_Investment1(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2, service_capital_init = service_capital_init) "Service sector investment" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -220.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      equation
        connect(Service_Sector_Investment1.serv_out_pc, Human_Fertility1.serv_out_pc) annotation(
          Line(visible = true, points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 190.0}, {98.0, 190.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.s_fioa_serv, Industrial_Investment1.s_fioa_serv) annotation(
          Line(visible = true, points = {{-78.0, -230.0}, {16.0, -230.0}, {16.0, 38.0}, {108.0, 38.0}, {108.0, 58.0}}, color = {0, 0, 191}));
        connect(Food_Production1.population, Service_Sector_Investment1.population) annotation(
          Line(visible = true, points = {{-122.0, -104.0}, {-180.0, -104.0}, {-180.0, -216.0}, {-122.0, -216.0}}, color = {0, 0, 191}));
        connect(Food_Production1.ind_out_pc, Service_Sector_Investment1.ind_out_pc) annotation(
          Line(visible = true, points = {{-122.0, -128.0}, {-188.0, -128.0}, {-188.0, -232.0}, {-122.0, -232.0}}, color = {0, 0, 191}));
        connect(Food_Production1.industrial_output, Service_Sector_Investment1.industrial_output) annotation(
          Line(visible = true, points = {{-122.0, -136.0}, {-184.0, -136.0}, {-184.0, -224.0}, {-122.0, -224.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.capital_util_fr, Service_Sector_Investment1.capital_util_fr) annotation(
          Line(visible = true, points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {-172.0, -180.0}, {-172.0, -208.0}, {-122.0, -208.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(visible = true, points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 18.0}, {70.0, 18.0}, {108.0, 18.0}, {108.0, 2.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.service_capital, Labor_Utilization1.service_capital) annotation(
          Line(visible = true, points = {{-78.0, -220.0}, {4.0, -220.0}, {4.0, -4.0}, {98.0, -4.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_tech_mult_icor_COPM, Industrial_Investment1.ppoll_tech_mult_icor_COPM) annotation(
          Line(visible = true, origin = {10.0, 88.0}, points = {{-88.0, 0.0}, {88.0, 0.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.population, NR_Resource_Utilization1.population) annotation(
          Line(visible = true, points = {{318.0, -20.0}, {260.0, -20.0}, {260.0, -120.0}, {318.0, -120.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.total_fertility, Population_Dynamics1.total_fertility) annotation(
          Line(visible = true, points = {{142.0, 180.0}, {196.0, 180.0}, {196.0, 144.0}, {-200.0, 144.0}, {-200.0, 190.0}, {-122.0, 190.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.life_expectancy, Population_Dynamics1.life_expectancy) annotation(
          Line(visible = true, points = {{98.0, 180.0}, {32.0, 180.0}, {32.0, 128.0}, {-190.0, 128.0}, {-190.0, 170.0}, {-122.0, 170.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Human_Fertility1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {36.0, 30.0}, {36.0, 170.0}, {98.0, 170.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.population, Pollution_Dynamics1.population) annotation(
          Line(visible = true, points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 140.0}, {-180.0, 140.0}, {-180.0, 88.0}, {-122.0, 88.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.arable_land, Pollution_Dynamics1.arable_land) annotation(
          Line(visible = true, points = {{-78.0, -20.0}, {-20.0, -20.0}, {-20.0, 26.0}, {-176.0, 26.0}, {-176.0, 64.0}, {-122.0, 64.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_gen_rt, Human_Ecological_Footprint1.ppoll_gen_rt) annotation(
          Line(visible = true, points = {{-78.0, 64.0}, {-20.0, 64.0}, {-20.0, 148.0}, {256.0, 148.0}, {256.0, 170.0}, {318.0, 170.0}}, color = {0, 0, 191}));
        connect(Food_Production1.marg_prod_agr_inp, Arable_Land_Dynamics1.marg_prod_agr_inp) annotation(
          Line(visible = true, points = {{-78.0, -120.0}, {-24.0, -120.0}, {-24.0, -64.0}, {-172.0, -64.0}, {-172.0, -12.0}, {-122.0, -12.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Arable_Land_Dynamics1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {-188.0, 30.0}, {-188.0, -28.0}, {-122.0, -28.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.population, Arable_Land_Dynamics1.population) annotation(
          Line(visible = true, points = {{-122.0, 88.0}, {-180.0, 88.0}, {-180.0, -36.0}, {-122.0, -36.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.fr_inp_al_land_dev, Food_Production1.fr_inp_al_land_dev) annotation(
          Line(visible = true, points = {{-78.0, -10.0}, {-28.0, -10.0}, {-28.0, -68.0}, {-172.0, -68.0}, {-172.0, -120.0}, {-122.0, -120.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.urban_ind_land, Human_Ecological_Footprint1.urban_ind_land) annotation(
          Line(visible = true, points = {{-78.0, -30.0}, {-24.0, -30.0}, {-24.0, 136.0}, {252.0, 136.0}, {252.0, 180.0}, {318.0, 180.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.yield_tech_LYTD, Food_Production1.yield_tech_LYTD) annotation(
          Line(visible = true, points = {{142.0, -110.0}, {192.0, -110.0}, {192.0, -82.0}, {-112.0, -82.0}, {-112.0, -87.9893}, {-112.0, -98.0}}, color = {0, 0, 191}));
        connect(Food_Production1.food_ratio, Land_Fertility1.food_ratio) annotation(
          Line(visible = true, points = {{-78.0, -104.0}, {10.0, -104.0}, {10.0, -110.0}, {98.0, -110.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_index, Land_Fertility1.ppoll_index) annotation(
          Line(visible = true, points = {{-78.0, 80.0}, {20.0, 80.0}, {20.0, -130.0}, {98.0, -130.0}}, color = {0, 0, 191}));
        connect(Food_Production1.land_yield, Arable_Land_Dynamics1.land_yield) annotation(
          Line(visible = true, points = {{-78.0, -112.0}, {-20.0, -112.0}, {-20.0, -60.0}, {-192.0, -60.0}, {-192.0, -4.0}, {-122.0, -4.0}}, color = {0, 0, 191}));
        connect(Food_Production1.agr_inp_per_hect, Pollution_Dynamics1.agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -56.0}, {-196.0, -56.0}, {-196.0, 72.0}, {-122.0, 72.0}}, color = {0, 0, 191}));
        connect(Food_Production1.p_fr_inp_for_land_maint, Land_Fertility1.p_fr_inp_for_land_maint) annotation(
          Line(visible = true, points = {{-88.0, -142.0}, {-88.0, -160.0}, {44.0, -160.0}, {44.0, -120.0}, {98.0, -120.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.s_yield_mlt_air_poll, Food_Production1.s_yield_mlt_air_poll) annotation(
          Line(visible = true, points = {{-78.0, 72.0}, {32.0, 72.0}, {32.0, -168.0}, {-104.0, -168.0}, {-104.0, -142.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.land_fertility, Food_Production1.land_fertility) annotation(
          Line(visible = true, points = {{142.0, -120.0}, {192.0, -120.0}, {192.0, -164.0}, {-112.0, -164.0}, {-112.0, -142.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, NR_Resource_Utilization1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -110.0}, {318.0, -110.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.pc_res_use_mlt, Pollution_Dynamics1.pc_res_use_mlt) annotation(
          Line(visible = true, points = {{362.0, -108.0}, {424.0, -108.0}, {424.0, 124.0}, {-176.0, 124.0}, {-176.0, 96.0}, {-122.0, 96.0}}, color = {0, 0, 191}));
        connect(Human_Welfare_Index1.life_expectancy, Human_Fertility1.life_expectancy) annotation(
          Line(visible = true, points = {{318.0, 90.0}, {250.0, 90.0}, {250.0, 128.0}, {32.0, 128.0}, {32.0, 180.0}, {98.0, 180.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.life_expectancy, Human_Welfare_Index1.life_expectancy) annotation(
          Line(visible = true, points = {{362.0, -20.0}, {420.0, -20.0}, {420.0, 40.0}, {250.0, 40.0}, {250.0, 90.0}, {318.0, 90.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Human_Welfare_Index1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 70.0}, {318.0, 70.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_capital, Labor_Utilization1.industrial_capital) annotation(
          Line(visible = true, points = {{142.0, 76.0}, {196.0, 76.0}, {196.0, -78.0}, {44.0, -78.0}, {44.0, -20.0}, {98.0, -20.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_output, NR_Resource_Utilization1.industrial_output) annotation(
          Line(visible = true, points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, -130.0}, {318.0, -130.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_output, Pollution_Dynamics1.industrial_output) annotation(
          Line(visible = true, points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, 22.0}, {-184.0, 22.0}, {-184.0, 80.0}, {-122.0, 80.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.ind_cap_out_ratio_2_ICOR2T, Industrial_Investment1.ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(visible = true, points = {{362.0, -124.0}, {428.0, -124.0}, {428.0, 120.0}, {108.0, 120.0}, {108.0, 102.0}}, color = {0, 0, 191}));
        connect(Food_Production1.yield_tech_mult_icor_COYM, Industrial_Investment1.yield_tech_mult_icor_COYM) annotation(
          Line(visible = true, points = {{-96.0, -142.0}, {-96.0, -174.0}, {28.0, -174.0}, {28.0, 96.0}, {98.0, 96.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.s_fr_cap_al_obt_res, Industrial_Investment1.s_fr_cap_al_obt_res) annotation(
          Line(visible = true, points = {{362.0, -132.0}, {432.0, -132.0}, {432.0, 132.0}, {44.0, 132.0}, {44.0, 72.0}, {98.0, 72.0}}, color = {0, 0, 191}));
        connect(Food_Production1.s_fioa_agr, Industrial_Investment1.s_fioa_agr) annotation(
          Line(visible = true, points = {{-78.0, -136.0}, {-4.0, -136.0}, {-4.0, 64.0}, {98.0, 64.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.population, Life_Expectancy1.population) annotation(
          Line(visible = true, points = {{116.0, 58.0}, {116.0, 34.0}, {260.0, 34.0}, {260.0, -20.0}, {318.0, -20.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.population, Industrial_Investment1.population) annotation(
          Line(visible = true, points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 34.0}, {116.0, 34.0}, {116.0, 58.0}}, color = {0, 0, 191}));
        connect(Food_Production1.tot_agric_invest, Arable_Land_Dynamics1.tot_agric_invest) annotation(
          Line(visible = true, points = {{-88.0, -98.0}, {-88.0, -52.0}, {-200.0, -52.0}, {-200.0, -20.0}, {-122.0, -20.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.arable_land, Food_Production1.arable_land) annotation(
          Line(visible = true, points = {{-122.0, 64.0}, {-176.0, 64.0}, {-176.0, -112.0}, {-122.0, -112.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.population, Food_Production1.population) annotation(
          Line(visible = true, points = {{-122.0, -36.0}, {-180.0, -36.0}, {-180.0, -104.0}, {-122.0, -104.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.ind_out_pc, Food_Production1.ind_out_pc) annotation(
          Line(visible = true, points = {{-122.0, -28.0}, {-188.0, -28.0}, {-188.0, -128.0}, {-122.0, -128.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.industrial_output, Food_Production1.industrial_output) annotation(
          Line(visible = true, points = {{-122.0, 80.0}, {-184.0, 80.0}, {-184.0, -136.0}, {-122.0, -136.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.capital_util_fr, Industrial_Investment1.capital_util_fr) annotation(
          Line(visible = true, points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {24.0, -180.0}, {24.0, 80.0}, {98.0, 80.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Life_Expectancy1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -12.0}, {318.0, -12.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(visible = true, points = {{318.0, -4.0}, {218.0, -4.0}, {218.0, 18.0}, {108.0, 18.0}, {108.0, 12.9215}, {108.0, 2.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.ind_out_pc, Labor_Utilization1.ind_out_pc) annotation(
          Line(visible = true, points = {{98.0, 170.0}, {36.0, 170.0}, {36.0, -12.0}, {98.0, -12.0}}, color = {0, 0, 191}));
        connect(Food_Production1.agr_inp_per_hect, Labor_Utilization1.agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -28.0}, {98.0, -28.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.arable_land, Human_Ecological_Footprint1.arable_land) annotation(
          Line(visible = true, points = {{98.0, -36.0}, {40.0, -36.0}, {40.0, -64.0}, {264.0, -64.0}, {264.0, 190.0}, {318.0, 190.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.arable_land, Labor_Utilization1.arable_land) annotation(
          Line(visible = true, points = {{-78.0, -20.0}, {40.0, -20.0}, {40.0, -36.0}, {98.0, -36.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.labor_force, Labor_Utilization1.labor_force) annotation(
          Line(visible = true, points = {{-78.0, 170.0}, {12.0, 170.0}, {12.0, -60.0}, {108.0, -60.0}, {108.0, -42.0}}, color = {0, 0, 191}));
        connect(Food_Production1.food_pc, Life_Expectancy1.food_pc) annotation(
          Line(visible = true, points = {{-96.0, -98.0}, {-96.0, -74.0}, {256.0, -74.0}, {256.0, -28.0}, {318.0, -28.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.ppoll_index, Life_Expectancy1.ppoll_index) annotation(
          Line(visible = true, points = {{98.0, -130.0}, {20.0, -130.0}, {20.0, -70.0}, {268.0, -70.0}, {268.0, -36.0}, {318.0, -36.0}}, color = {0, 0, 191}));
        population = Population_Dynamics1.Population.y;
        food = Food_Production1.Food.food;
        industrial_output = Industrial_Investment1.Industrial_Output.industrial_output;
        ppoll_index = Pollution_Dynamics1.PPoll_Index.y;
        nr_resources = NR_Resource_Utilization1.NR_Resources.y;
        fioa_ind = Industrial_Investment1.FIOA_Ind.fioa_ind;
        s_fioa_agr = Food_Production1.S_FIOA_Agr.s_fioa_agr;
        s_fioa_cons = Industrial_Investment1.S_FIOA_Cons.s_fioa_cons;
        s_fioa_serv = Service_Sector_Investment1.S_FIOA_Serv.s_fioa_serv;
        s_fr_cap_al_obt_res = NR_Resource_Utilization1.S_Fr_Cap_Al_Obt_Res.s_fr_cap_al_obt_res;
        life_expectancy = Life_Expectancy1.Life_Expectancy.y;
        food_pc = Food_Production1.Food_PC.y;
        serv_out_pc = Service_Sector_Investment1.Serv_Out_PC.y;
        ind_out_pc = Industrial_Investment1.Ind_Out_PC.y;
        human_ecological_footprint = Human_Ecological_Footprint1.HEF_Human_Ecological_Footprint.hef_human_ecological_footprint;
        human_welfare_index = Human_Welfare_Index1.HWI_Human_Welfare_Index.hwi_human_welfare_index;
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {2.0, -1.0}, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-222.0, -260.0}, {440.0, 222.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-70.0, 58.0}, {286.0, 132.0}}, textString = "More Abundant", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-84.0, -14.0}, {302.0, 52.0}}, textString = "Non-recoverable", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-114.0, -106.0}, {324.0, -2.0}}, textString = "Natural Resources", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, -178.0}, {316.0, -78.0}}, textString = "and Birth Control", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
          experiment(StartTime = 1900, StopTime = 2100),
          experimentSetupOutput,
          Documentation(info = "<html>
This is <font color=red><b>Scenario #7</b></font> of the <font color=red><b>WORLD3</b></font> model. This scenario starts out with the same assumptions as <font color=red><b>Scenario #2</b></font>. <p>
 
We now want to try out another approach.  Instead of improving the means of production, we shall attempt strict birth control.  Every family is limited to two children only.  Due to the age structure momentum, the population keeps growing for another generation.  Then it will finally start on its path of natural attrition. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.L., W.W. Behrens III, D.M., Meadows, R.F. Naill, J. Randers, and E.K.O. Zahn (1974), <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>, Wright-Allen Press, 637p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
 
In order to accomplish this change, you need to reset two of the switching times in the model: <p>
<font color=red>parameter Real t_fert_cont_eff_time(unit=\"yr\") = <b>2002</b> \"Year of continued fertility change\";</font>. <p>
<font color=red>parameter Real t_zero_pop_grow_time(unit=\"yr\") = <b>2002</b> \"Time to zero population growth\";</font>. <p>
 
<hr> <p>
 
Simulate the model from 1900 until 2100, and display the same variables as in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> at page 241: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_22.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_23.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_24.png\"> <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_7;

      model Scenario_8 "More abundant non-recoverable natural resources, birth control, and stable industrial output"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 350 "Desired annual industrial per capita output";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2.5 "Controlled average life of agricultural input";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 18 "Controlled average life of industrial capital";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 25 "Controlled average life of service sector capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real reproductive_lifetime(unit = "yr") = 30.0 "Reproductive life time";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_fcaor_time(unit = "yr") = 2002 "Year of capital allocation to resource use efficiency";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 2002 "Year of continued fertility change";
        parameter Real t_ind_equil_time(unit = "yr") = 2002 "Year of industrial equilibrium";
        parameter Real t_land_life_time(unit = "yr") = 4000 "Land life time";
        parameter Real t_policy_year(unit = "yr") = 2002 "Year of policy change";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 2002 "Time to zero population growth";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_ppoll_tech_chg_mlt[:] = {0, 0, 0, 0} "Persistent pollution technology change multiplier";
        parameter Real p_res_tech_chg_mlt[:] = {0, 0, 0, 0} "Resource technology change multiplier";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0, 0} "Yield technology change multiplier";
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real nr_resources_init(unit = "ton") = 2000000000000.0 "Initial available non-recoverable resources";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        output Real population "Total human world population";
        output Real food(unit = "dollar/yr") "Total annually produced food";
        output Real industrial_output(unit = "dollar/yr") "Total annual world industrial output";
        output Real ppoll_index "Persistent pollution index";
        output Real nr_resources "Remaining non-recoverable natural resources";
        output Real fioa_ind "Fraction of industrial output allocated to industrial/military complex";
        output Real s_fioa_agr "Fraction of industrial output allocated to food production";
        output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        output Real life_expectancy(unit = "yr") "Life expectancy";
        output Real food_pc(unit = "dollar/yr") "Total annual food per person";
        output Real serv_out_pc(unit = "dollar/yr") "Total annual services per person";
        output Real ind_out_pc(unit = "dollar/yr") "Total annual consumer goods per person";
        output Real human_ecological_footprint(unit = "Gha") "Human ecological footprint";
        output Real human_welfare_index "Human welfare index";
        SystemDynamics.WorldDynamics.World3.Population_Dynamics Population_Dynamics1(pop1_init = pop1_init, pop2_init = pop2_init, pop3_init = pop3_init, pop4_init = pop4_init, labor_force_partic = labor_force_partic, reproductive_lifetime = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "Population dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Pollution_Dynamics Pollution_Dynamics1(agr_mtl_toxic_index = agr_mtl_toxic_index, assim_half_life_1970 = assim_half_life_1970, des_ppoll_index_DPOLX = des_ppoll_index_DPOLX, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl, frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index, ind_out_in_1970 = ind_out_in_1970, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1, pers_pollution_init = pers_pollution_init, ppoll_in_1970 = ppoll_in_1970, ppoll_tech_init = ppoll_tech_init, ppoll_trans_del = ppoll_trans_del, t_air_poll_time = t_air_poll_time, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, p_ppoll_tech_chg_mlt = p_ppoll_tech_chg_mlt) "Persistent pollution generation" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Arable_Land_Dynamics Arable_Land_Dynamics1(arable_land_init = arable_land_init, avg_life_land_norm = avg_life_land_norm, inherent_land_fert = inherent_land_fert, pot_arable_land_init = pot_arable_land_init, pot_arable_land_tot = pot_arable_land_tot, social_discount = social_discount, t_land_life_time = t_land_life_time, urban_ind_land_init = urban_ind_land_init, urb_ind_land_dev_time = urb_ind_land_dev_time) "Arable land dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Food_Production Food_Production1(agr_inp_init = agr_inp_init, food_short_perc_del = food_short_perc_del, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2, p_land_yield_fact_1 = p_land_yield_fact_1, perc_food_ratio_init = perc_food_ratio_init, processing_loss = processing_loss, subsist_food_pc = subsist_food_pc, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, land_fr_harvested = land_fr_harvested) "Food production" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Ecological_Footprint Human_Ecological_Footprint1 "Human ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {340.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Fertility Human_Fertility1(des_compl_fam_size_norm = des_compl_fam_size_norm, hlth_serv_impact_del = hlth_serv_impact_del, income_expect_avg_time = income_expect_avg_time, lifet_perc_del = lifet_perc_del, max_tot_fert_norm = max_tot_fert_norm, social_adj_del = social_adj_del, t_fert_cont_eff_time = t_fert_cont_eff_time, t_zero_pop_grow_time = t_zero_pop_grow_time) "Human fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Welfare_Index Human_Welfare_Index1 "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {340.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Industrial_Investment Industrial_Investment1(industrial_capital_init = industrial_capital_init, ind_out_pc_des = ind_out_pc_des, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2, p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1, t_ind_equil_time = t_ind_equil_time, t_policy_year = t_policy_year) "Industrial investment" annotation(
          Placement(visible = true, transformation(origin = {120.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Labor_Utilization Labor_Utilization1(labor_util_fr_del_init = labor_util_fr_del_init, labor_util_fr_del_time = labor_util_fr_del_time) "Labor utilization" annotation(
          Placement(visible = true, transformation(origin = {120.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Land_Fertility Land_Fertility1(des_food_ratio_dfr = des_food_ratio_dfr, inherent_land_fert = inherent_land_fert, land_fertility_init = land_fertility_init, t_policy_year = t_policy_year, yield_tech_init = yield_tech_init, p_yield_tech_chg_mlt = p_yield_tech_chg_mlt) "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Life_Expectancy Life_Expectancy1(hlth_serv_impact_del = hlth_serv_impact_del, life_expect_norm = life_expect_norm, subsist_food_pc = subsist_food_pc) "Life expectancy" annotation(
          Placement(visible = true, transformation(origin = {340.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.NR_Resource_Utilization NR_Resource_Utilization1(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR, nr_resources_init = nr_resources_init, p_nr_res_use_fact_1 = p_nr_res_use_fact_1, res_tech_init = res_tech_init, t_policy_year = t_policy_year, t_fcaor_time = t_fcaor_time, tech_dev_del_TDD = tech_dev_del_TDD, p_res_tech_chg_mlt = p_res_tech_chg_mlt, p_fr_cap_al_obt_res_2 = p_fr_cap_al_obt_res_2) "Non-recoverable natural resource utilization" annotation(
          Placement(visible = true, transformation(origin = {340.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Service_Sector_Investment Service_Sector_Investment1(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2, service_capital_init = service_capital_init) "Service sector investment" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -220.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      equation
        connect(Population_Dynamics1.labor_force, Labor_Utilization1.labor_force) annotation(
          Line(visible = true, points = {{-78.0, 170.0}, {12.0, 170.0}, {12.0, -57.8391}, {108.0, -57.8391}, {108.0, -42.0}}, color = {0, 0, 191}));
        connect(Food_Production1.agr_inp_per_hect, Labor_Utilization1.agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -28.0}, {98.0, -28.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.s_fioa_serv, Industrial_Investment1.s_fioa_serv) annotation(
          Line(visible = true, points = {{-78.0, -230.0}, {16.0, -230.0}, {16.0, 38.0}, {108.0, 38.0}, {108.0, 58.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.population, Industrial_Investment1.population) annotation(
          Line(visible = true, points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 34.0}, {116.0, 34.0}, {116.0, 58.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.population, Life_Expectancy1.population) annotation(
          Line(visible = true, points = {{116.0, 58.0}, {116.0, 34.0}, {260.0, 34.0}, {260.0, -20.0}, {318.0, -20.0}}, color = {0, 0, 191}));
        connect(Food_Production1.s_fioa_agr, Industrial_Investment1.s_fioa_agr) annotation(
          Line(visible = true, points = {{-78.0, -136.0}, {-4.0, -136.0}, {-4.0, 64.0}, {98.0, 64.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_gen_rt, Human_Ecological_Footprint1.ppoll_gen_rt) annotation(
          Line(visible = true, points = {{-78.0, 64.0}, {-20.0, 64.0}, {-20.0, 148.0}, {256.0, 148.0}, {256.0, 170.0}, {318.0, 170.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.s_yield_mlt_air_poll, Food_Production1.s_yield_mlt_air_poll) annotation(
          Line(visible = true, points = {{-78.0, 72.0}, {32.0, 72.0}, {32.0, -168.0}, {-104.0, -168.0}, {-104.0, -142.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.s_fr_cap_al_obt_res, Industrial_Investment1.s_fr_cap_al_obt_res) annotation(
          Line(visible = true, points = {{362.0, -132.0}, {432.0, -132.0}, {432.0, 132.0}, {44.0, 132.0}, {44.0, 72.0}, {98.0, 72.0}}, color = {0, 0, 191}));
        connect(Food_Production1.yield_tech_mult_icor_COYM, Industrial_Investment1.yield_tech_mult_icor_COYM) annotation(
          Line(visible = true, points = {{-96.0, -142.0}, {-96.0, -174.0}, {28.0, -174.0}, {28.0, 96.0}, {98.0, 96.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.pc_res_use_mlt, Pollution_Dynamics1.pc_res_use_mlt) annotation(
          Line(visible = true, points = {{362.0, -108.0}, {424.0, -108.0}, {424.0, 124.0}, {-176.0, 124.0}, {-176.0, 96.0}, {-122.0, 96.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.population, Pollution_Dynamics1.population) annotation(
          Line(visible = true, points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 140.0}, {-180.0, 140.0}, {-180.0, 88.0}, {-122.0, 88.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.population, Arable_Land_Dynamics1.population) annotation(
          Line(visible = true, points = {{-122.0, 88.0}, {-180.0, 88.0}, {-180.0, -36.0}, {-122.0, -36.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.arable_land, Pollution_Dynamics1.arable_land) annotation(
          Line(visible = true, points = {{-78.0, -20.0}, {-20.0, -20.0}, {-20.0, 26.0}, {-176.0, 26.0}, {-176.0, 64.0}, {-122.0, 64.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.arable_land, Food_Production1.arable_land) annotation(
          Line(visible = true, points = {{-122.0, 64.0}, {-176.0, 64.0}, {-176.0, -112.0}, {-122.0, -112.0}}, color = {0, 0, 191}));
        connect(Food_Production1.agr_inp_per_hect, Pollution_Dynamics1.agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -56.0}, {-196.0, -56.0}, {-196.0, 72.0}, {-122.0, 72.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.population, Food_Production1.population) annotation(
          Line(visible = true, points = {{-122.0, -36.0}, {-180.0, -36.0}, {-180.0, -104.0}, {-122.0, -104.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Arable_Land_Dynamics1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {-188.0, 30.0}, {-188.0, -28.0}, {-122.0, -28.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.ind_out_pc, Food_Production1.ind_out_pc) annotation(
          Line(visible = true, points = {{-122.0, -28.0}, {-188.0, -28.0}, {-188.0, -128.0}, {-122.0, -128.0}}, color = {0, 0, 191}));
        connect(Food_Production1.marg_prod_agr_inp, Arable_Land_Dynamics1.marg_prod_agr_inp) annotation(
          Line(visible = true, points = {{-78.0, -120.0}, {-24.0, -120.0}, {-24.0, -64.0}, {-172.0, -64.0}, {-172.0, -12.0}, {-122.0, -12.0}}, color = {0, 0, 191}));
        connect(Food_Production1.land_yield, Arable_Land_Dynamics1.land_yield) annotation(
          Line(visible = true, points = {{-78.0, -112.0}, {-20.0, -112.0}, {-20.0, -60.0}, {-192.0, -60.0}, {-192.0, -4.0}, {-122.0, -4.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.fr_inp_al_land_dev, Food_Production1.fr_inp_al_land_dev) annotation(
          Line(visible = true, points = {{-78.0, -10.0}, {-28.0, -10.0}, {-28.0, -68.0}, {-172.0, -68.0}, {-172.0, -120.0}, {-122.0, -120.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.urban_ind_land, Human_Ecological_Footprint1.urban_ind_land) annotation(
          Line(visible = true, points = {{-78.0, -30.0}, {-24.0, -30.0}, {-24.0, 136.0}, {252.0, 136.0}, {252.0, 180.0}, {318.0, 180.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(visible = true, points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 18.0}, {70.0, 18.0}, {108.0, 18.0}, {108.0, 2.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(visible = true, points = {{318.0, -4.0}, {218.0, -4.0}, {218.0, 18.0}, {108.0, 18.0}, {108.0, 11.6909}, {108.0, 2.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.service_capital, Labor_Utilization1.service_capital) annotation(
          Line(visible = true, points = {{-78.0, -220.0}, {4.0, -220.0}, {4.0, -4.0}, {98.0, -4.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.ind_out_pc, Labor_Utilization1.ind_out_pc) annotation(
          Line(visible = true, points = {{98.0, 170.0}, {36.0, 170.0}, {36.0, -12.0}, {98.0, -12.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.arable_land, Labor_Utilization1.arable_land) annotation(
          Line(visible = true, points = {{-78.0, -20.0}, {40.0, -20.0}, {40.0, -36.0}, {98.0, -36.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.arable_land, Human_Ecological_Footprint1.arable_land) annotation(
          Line(visible = true, points = {{98.0, -36.0}, {40.0, -36.0}, {40.0, -64.0}, {264.0, -64.0}, {264.0, 190.0}, {318.0, 190.0}}, color = {0, 0, 191}));
        connect(Food_Production1.food_pc, Life_Expectancy1.food_pc) annotation(
          Line(visible = true, points = {{-96.0, -98.0}, {-96.0, -74.0}, {256.0, -74.0}, {256.0, -28.0}, {318.0, -28.0}}, color = {0, 0, 191}));
        connect(Food_Production1.tot_agric_invest, Arable_Land_Dynamics1.tot_agric_invest) annotation(
          Line(visible = true, points = {{-88.0, -98.0}, {-88.0, -52.0}, {-200.0, -52.0}, {-200.0, -20.0}, {-122.0, -20.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.yield_tech_LYTD, Food_Production1.yield_tech_LYTD) annotation(
          Line(visible = true, points = {{142.0, -110.0}, {192.0, -110.0}, {192.0, -82.0}, {-112.0, -82.0}, {-112.0, -86.7587}, {-112.0, -98.0}}, color = {0, 0, 191}));
        connect(Food_Production1.population, Service_Sector_Investment1.population) annotation(
          Line(visible = true, points = {{-122.0, -104.0}, {-180.0, -104.0}, {-180.0, -216.0}, {-122.0, -216.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.industrial_output, Food_Production1.industrial_output) annotation(
          Line(visible = true, points = {{-122.0, 80.0}, {-184.0, 80.0}, {-184.0, -136.0}, {-122.0, -136.0}}, color = {0, 0, 191}));
        connect(Food_Production1.industrial_output, Service_Sector_Investment1.industrial_output) annotation(
          Line(visible = true, points = {{-122.0, -136.0}, {-184.0, -136.0}, {-184.0, -224.0}, {-122.0, -224.0}}, color = {0, 0, 191}));
        connect(Food_Production1.ind_out_pc, Service_Sector_Investment1.ind_out_pc) annotation(
          Line(visible = true, points = {{-122.0, -128.0}, {-188.0, -128.0}, {-188.0, -232.0}, {-122.0, -232.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.capital_util_fr, Service_Sector_Investment1.capital_util_fr) annotation(
          Line(visible = true, points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {-172.0, -180.0}, {-172.0, -208.0}, {-122.0, -208.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.serv_out_pc, Human_Fertility1.serv_out_pc) annotation(
          Line(visible = true, points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 190.0}, {98.0, 190.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.land_fertility, Food_Production1.land_fertility) annotation(
          Line(visible = true, points = {{142.0, -120.0}, {192.0, -120.0}, {192.0, -164.0}, {-112.0, -164.0}, {-112.0, -142.0}}, color = {0, 0, 191}));
        connect(Food_Production1.p_fr_inp_for_land_maint, Land_Fertility1.p_fr_inp_for_land_maint) annotation(
          Line(visible = true, points = {{-88.0, -142.0}, {-88.0, -160.0}, {44.0, -160.0}, {44.0, -120.0}, {98.0, -120.0}}, color = {0, 0, 191}));
        connect(Food_Production1.food_ratio, Land_Fertility1.food_ratio) annotation(
          Line(visible = true, points = {{-78.0, -104.0}, {10.0, -104.0}, {10.0, -110.0}, {98.0, -110.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_index, Land_Fertility1.ppoll_index) annotation(
          Line(visible = true, points = {{-78.0, 80.0}, {20.0, 80.0}, {20.0, -130.0}, {98.0, -130.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.ppoll_index, Life_Expectancy1.ppoll_index) annotation(
          Line(visible = true, points = {{98.0, -130.0}, {20.0, -130.0}, {20.0, -70.0}, {268.0, -70.0}, {268.0, -36.0}, {318.0, -36.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.capital_util_fr, Industrial_Investment1.capital_util_fr) annotation(
          Line(visible = true, points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {24.0, -180.0}, {24.0, 80.0}, {98.0, 80.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.ind_cap_out_ratio_2_ICOR2T, Industrial_Investment1.ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(visible = true, points = {{362.0, -124.0}, {428.0, -124.0}, {428.0, 120.0}, {108.0, 120.0}, {108.0, 102.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_output, NR_Resource_Utilization1.industrial_output) annotation(
          Line(visible = true, points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, -130.0}, {318.0, -130.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, NR_Resource_Utilization1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -110.0}, {318.0, -110.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Life_Expectancy1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -12.0}, {318.0, -12.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Human_Welfare_Index1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 70.0}, {318.0, 70.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_capital, Labor_Utilization1.industrial_capital) annotation(
          Line(visible = true, points = {{142.0, 76.0}, {196.0, 76.0}, {196.0, -78.0}, {44.0, -78.0}, {44.0, -20.0}, {98.0, -20.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_output, Pollution_Dynamics1.industrial_output) annotation(
          Line(visible = true, points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, 22.0}, {-184.0, 22.0}, {-184.0, 80.0}, {-122.0, 80.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.life_expectancy, Human_Welfare_Index1.life_expectancy) annotation(
          Line(visible = true, points = {{362.0, -20.0}, {420.0, -20.0}, {420.0, 40.0}, {250.0, 40.0}, {250.0, 90.0}, {318.0, 90.0}}, color = {0, 0, 191}));
        connect(Human_Welfare_Index1.life_expectancy, Human_Fertility1.life_expectancy) annotation(
          Line(visible = true, points = {{318.0, 90.0}, {250.0, 90.0}, {250.0, 128.0}, {32.0, 128.0}, {32.0, 180.0}, {98.0, 180.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Human_Fertility1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {36.0, 30.0}, {36.0, 170.0}, {98.0, 170.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.life_expectancy, Population_Dynamics1.life_expectancy) annotation(
          Line(visible = true, points = {{98.0, 180.0}, {32.0, 180.0}, {32.0, 128.0}, {-190.0, 128.0}, {-190.0, 170.0}, {-122.0, 170.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.total_fertility, Population_Dynamics1.total_fertility) annotation(
          Line(visible = true, points = {{142.0, 180.0}, {196.0, 180.0}, {196.0, 144.0}, {-200.0, 144.0}, {-200.0, 190.0}, {-122.0, 190.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.population, NR_Resource_Utilization1.population) annotation(
          Line(visible = true, points = {{318.0, -20.0}, {260.0, -20.0}, {260.0, -120.0}, {318.0, -120.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_tech_mult_icor_COPM, Industrial_Investment1.ppoll_tech_mult_icor_COPM) annotation(
          Line(visible = true, origin = {10.0, 88.0}, points = {{-88.0, 0.0}, {88.0, 0.0}}, color = {0, 0, 191}));
        population = Population_Dynamics1.Population.y;
        food = Food_Production1.Food.food;
        industrial_output = Industrial_Investment1.Industrial_Output.industrial_output;
        ppoll_index = Pollution_Dynamics1.PPoll_Index.y;
        nr_resources = NR_Resource_Utilization1.NR_Resources.y;
        fioa_ind = Industrial_Investment1.FIOA_Ind.fioa_ind;
        s_fioa_agr = Food_Production1.S_FIOA_Agr.s_fioa_agr;
        s_fioa_cons = Industrial_Investment1.S_FIOA_Cons.s_fioa_cons;
        s_fioa_serv = Service_Sector_Investment1.S_FIOA_Serv.s_fioa_serv;
        s_fr_cap_al_obt_res = NR_Resource_Utilization1.S_Fr_Cap_Al_Obt_Res.s_fr_cap_al_obt_res;
        life_expectancy = Life_Expectancy1.Life_Expectancy.y;
        food_pc = Food_Production1.Food_PC.y;
        serv_out_pc = Service_Sector_Investment1.Serv_Out_PC.y;
        ind_out_pc = Industrial_Investment1.Ind_Out_PC.y;
        human_ecological_footprint = Human_Ecological_Footprint1.HEF_Human_Ecological_Footprint.hef_human_ecological_footprint;
        human_welfare_index = Human_Welfare_Index1.HWI_Human_Welfare_Index.hwi_human_welfare_index;
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-222.0, -262.0}, {440.0, 220.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-70.0, 96.0}, {286.0, 170.0}}, textString = "More Abundant", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-84.0, 24.0}, {302.0, 90.0}}, textString = "Non-recoverable", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-114.0, -68.0}, {328.0, 36.0}}, textString = "Natural Resources,", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-100.0, -140.0}, {316.0, -40.0}}, textString = "Birth Control, and", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-162.0, -214.0}, {386.0, -112.0}}, textString = "Stable Industrial Output", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})),
          experiment(StartTime = 1900, StopTime = 2100),
          experimentSetupOutput,
          Documentation(info = "<html>
This is <font color=red><b>Scenario #8</b></font> of the <font color=red><b>WORLD3</b></font> model. This scenario starts out with the same assumptions as <font color=red><b>Scenario #7</b></font>.  Birth control allowed the industrial output to grow a bit faster, but ultimately, it got stopped by the increasing cost of controlling pollution. <p>
 
We now want to control the industrial output.  Furthermore, we want to give the capital investment a 25% increased life time. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.L., W.W. Behrens III, D.M., Meadows, R.F. Naill, J. Randers, and E.K.O. Zahn (1974), <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>, Wright-Allen Press, 637p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
 
In order to accomplish this change, you need to reset two of the modify a number of parameters in the model: <p>
<font color=red>parameter Real ind_out_pc_des(unit=\"dollar/yr\") = <b>350</b> \"Desired annual industrial per capita output\";</font>. <p>
<font color=red>parameter Real p_avg_life_agr_inp_2(unit=\"yr\") = <b>2.5</b> \"Controlled average life of agricultural input\";</font>. <p>
<font color=red>parameter Real p_avg_life_ind_cap_2(unit=\"yr\") = <b>18</b> \"Controlled average life of industrial capital\";</font>. <p>
<font color=red>parameter Real p_avg_life_serv_cap_2(unit=\"yr\") = <b>25</b> \"Controlled average life of service sector capital\";</font>. <p>
 
Finally, we need to reset two more of the switching times in the model: <p>
<font color=red>parameter Real t_ind_equil_time(unit=\"yr\") = <b>2002</b> \"Year of industrial equilibrium\";</font>. <p>
<font color=red>parameter Real t_policy_year(unit=\"yr\") = <b>2002</b> \"Year of policy change\";</font>. <p>
 
<hr> <p>
 
Simulate the model from 1900 until 2100, and display the same variables as in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> at page 243: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_25.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_26.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_27.png\"> <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_8;

      model Scenario_9 "Combining the measures of Scenarios #6 and #8"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 350 "Desired annual industrial per capita output";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2.5 "Controlled average life of agricultural input";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 18 "Controlled average life of industrial capital";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 25 "Controlled average life of service sector capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real reproductive_lifetime(unit = "yr") = 30.0 "Reproductive life time";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_fcaor_time(unit = "yr") = 2002 "Year of capital allocation to resource use efficiency";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 2002 "Year of continued fertility change";
        parameter Real t_ind_equil_time(unit = "yr") = 2002 "Year of industrial equilibrium";
        parameter Real t_land_life_time(unit = "yr") = 2002 "Land life time";
        parameter Real t_policy_year(unit = "yr") = 2002 "Year of policy change";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 2002 "Time to zero population growth";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_ppoll_tech_chg_mlt[:] = {-0.04, -0.04, 0, 0} "Persistent pollution technology change multiplier";
        parameter Real p_res_tech_chg_mlt[:] = {-0.04, -0.04, 0, 0} "Resource technology change multiplier";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0.04, 0.04} "Yield technology change multiplier";
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real nr_resources_init(unit = "ton") = 2000000000000.0 "Initial available non-recoverable resources";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        output Real population "Total human world population";
        output Real food(unit = "dollar/yr") "Total annually produced food";
        output Real industrial_output(unit = "dollar/yr") "Total annual world industrial output";
        output Real ppoll_index "Persistent pollution index";
        output Real nr_resources "Remaining non-recoverable natural resources";
        output Real fioa_ind "Fraction of industrial output allocated to industrial/military complex";
        output Real s_fioa_agr "Fraction of industrial output allocated to food production";
        output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        output Real life_expectancy(unit = "yr") "Life expectancy";
        output Real food_pc(unit = "dollar/yr") "Total annual food per person";
        output Real serv_out_pc(unit = "dollar/yr") "Total annual services per person";
        output Real ind_out_pc(unit = "dollar/yr") "Total annual consumer goods per person";
        output Real human_ecological_footprint(unit = "Gha") "Human ecological footprint";
        output Real human_welfare_index "Human welfare index";
        SystemDynamics.WorldDynamics.World3.Population_Dynamics Population_Dynamics1(pop1_init = pop1_init, pop2_init = pop2_init, pop3_init = pop3_init, pop4_init = pop4_init, labor_force_partic = labor_force_partic, reproductive_lifetime = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "Population dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Pollution_Dynamics Pollution_Dynamics1(agr_mtl_toxic_index = agr_mtl_toxic_index, assim_half_life_1970 = assim_half_life_1970, des_ppoll_index_DPOLX = des_ppoll_index_DPOLX, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl, frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index, ind_out_in_1970 = ind_out_in_1970, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1, pers_pollution_init = pers_pollution_init, ppoll_in_1970 = ppoll_in_1970, ppoll_tech_init = ppoll_tech_init, ppoll_trans_del = ppoll_trans_del, t_air_poll_time = t_air_poll_time, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, p_ppoll_tech_chg_mlt = p_ppoll_tech_chg_mlt) "Persistent pollution generation" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Arable_Land_Dynamics Arable_Land_Dynamics1(arable_land_init = arable_land_init, avg_life_land_norm = avg_life_land_norm, inherent_land_fert = inherent_land_fert, pot_arable_land_init = pot_arable_land_init, pot_arable_land_tot = pot_arable_land_tot, social_discount = social_discount, t_land_life_time = t_land_life_time, urban_ind_land_init = urban_ind_land_init, urb_ind_land_dev_time = urb_ind_land_dev_time) "Arable land dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Food_Production Food_Production1(agr_inp_init = agr_inp_init, food_short_perc_del = food_short_perc_del, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2, p_land_yield_fact_1 = p_land_yield_fact_1, perc_food_ratio_init = perc_food_ratio_init, processing_loss = processing_loss, subsist_food_pc = subsist_food_pc, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, land_fr_harvested = land_fr_harvested) "Food production" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Ecological_Footprint Human_Ecological_Footprint1 "Human ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {340.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Fertility Human_Fertility1(des_compl_fam_size_norm = des_compl_fam_size_norm, hlth_serv_impact_del = hlth_serv_impact_del, income_expect_avg_time = income_expect_avg_time, lifet_perc_del = lifet_perc_del, max_tot_fert_norm = max_tot_fert_norm, social_adj_del = social_adj_del, t_fert_cont_eff_time = t_fert_cont_eff_time, t_zero_pop_grow_time = t_zero_pop_grow_time) "Human fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Human_Welfare_Index Human_Welfare_Index1 "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {340.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Industrial_Investment Industrial_Investment1(industrial_capital_init = industrial_capital_init, ind_out_pc_des = ind_out_pc_des, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2, p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1, t_ind_equil_time = t_ind_equil_time, t_policy_year = t_policy_year) "Industrial investment" annotation(
          Placement(visible = true, transformation(origin = {120.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Labor_Utilization Labor_Utilization1(labor_util_fr_del_init = labor_util_fr_del_init, labor_util_fr_del_time = labor_util_fr_del_time) "Labor utilization" annotation(
          Placement(visible = true, transformation(origin = {120.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Land_Fertility Land_Fertility1(des_food_ratio_dfr = des_food_ratio_dfr, inherent_land_fert = inherent_land_fert, land_fertility_init = land_fertility_init, t_policy_year = t_policy_year, yield_tech_init = yield_tech_init, p_yield_tech_chg_mlt = p_yield_tech_chg_mlt) "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Life_Expectancy Life_Expectancy1(hlth_serv_impact_del = hlth_serv_impact_del, life_expect_norm = life_expect_norm, subsist_food_pc = subsist_food_pc) "Life expectancy" annotation(
          Placement(visible = true, transformation(origin = {340.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.NR_Resource_Utilization NR_Resource_Utilization1(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR, nr_resources_init = nr_resources_init, p_nr_res_use_fact_1 = p_nr_res_use_fact_1, res_tech_init = res_tech_init, t_policy_year = t_policy_year, t_fcaor_time = t_fcaor_time, tech_dev_del_TDD = tech_dev_del_TDD, p_res_tech_chg_mlt = p_res_tech_chg_mlt, p_fr_cap_al_obt_res_2 = p_fr_cap_al_obt_res_2) "Non-recoverable natural resource utilization" annotation(
          Placement(visible = true, transformation(origin = {340.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
        SystemDynamics.WorldDynamics.World3.Service_Sector_Investment Service_Sector_Investment1(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2, service_capital_init = service_capital_init) "Service sector investment" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -220.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)));
      equation
        connect(Population_Dynamics1.labor_force, Labor_Utilization1.labor_force) annotation(
          Line(visible = true, points = {{-78.0, 170.0}, {12.0, 170.0}, {12.0, -60.0}, {108.0, -60.0}, {108.0, -42.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_output, Pollution_Dynamics1.industrial_output) annotation(
          Line(visible = true, points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, 22.0}, {-184.0, 22.0}, {-184.0, 80.0}, {-122.0, 80.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_output, NR_Resource_Utilization1.industrial_output) annotation(
          Line(visible = true, points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, -130.0}, {318.0, -130.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.s_fioa_serv, Industrial_Investment1.s_fioa_serv) annotation(
          Line(visible = true, points = {{-78.0, -230.0}, {16.0, -230.0}, {16.0, 38.0}, {108.0, 38.0}, {108.0, 58.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.population, Industrial_Investment1.population) annotation(
          Line(visible = true, points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 34.0}, {116.0, 34.0}, {116.0, 58.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.population, Life_Expectancy1.population) annotation(
          Line(visible = true, points = {{116.0, 58.0}, {116.0, 34.0}, {260.0, 34.0}, {260.0, -20.0}, {318.0, -20.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(visible = true, points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 18.0}, {70.0, 18.0}, {108.0, 18.0}, {108.0, 2.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(visible = true, points = {{318.0, -4.0}, {218.0, -4.0}, {218.0, 18.0}, {108.0, 18.0}, {108.0, 10.0}, {108.0, 2.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.arable_land, Labor_Utilization1.arable_land) annotation(
          Line(visible = true, points = {{-78.0, -20.0}, {40.0, -20.0}, {40.0, -36.0}, {98.0, -36.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.arable_land, Human_Ecological_Footprint1.arable_land) annotation(
          Line(visible = true, points = {{98.0, -36.0}, {40.0, -36.0}, {40.0, -64.0}, {264.0, -64.0}, {264.0, 190.0}, {318.0, 190.0}}, color = {0, 0, 191}));
        connect(Food_Production1.agr_inp_per_hect, Labor_Utilization1.agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -28.0}, {98.0, -28.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.service_capital, Labor_Utilization1.service_capital) annotation(
          Line(visible = true, points = {{-78.0, -220.0}, {4.0, -220.0}, {4.0, -4.0}, {98.0, -4.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.ind_out_pc, Labor_Utilization1.ind_out_pc) annotation(
          Line(visible = true, points = {{98.0, 170.0}, {36.0, 170.0}, {36.0, -12.0}, {98.0, -12.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.urban_ind_land, Human_Ecological_Footprint1.urban_ind_land) annotation(
          Line(visible = true, points = {{-78.0, -30.0}, {-24.0, -30.0}, {-24.0, 136.0}, {252.0, 136.0}, {252.0, 180.0}, {318.0, 180.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.fr_inp_al_land_dev, Food_Production1.fr_inp_al_land_dev) annotation(
          Line(visible = true, points = {{-78.0, -10.0}, {-28.0, -10.0}, {-28.0, -68.0}, {-172.0, -68.0}, {-172.0, -120.0}, {-122.0, -120.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.population, Arable_Land_Dynamics1.population) annotation(
          Line(visible = true, points = {{-122.0, 88.0}, {-180.0, 88.0}, {-180.0, -36.0}, {-122.0, -36.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.population, Food_Production1.population) annotation(
          Line(visible = true, points = {{-122.0, -36.0}, {-180.0, -36.0}, {-180.0, -104.0}, {-122.0, -104.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Arable_Land_Dynamics1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {-188.0, 30.0}, {-188.0, -28.0}, {-122.0, -28.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.ind_out_pc, Food_Production1.ind_out_pc) annotation(
          Line(visible = true, points = {{-122.0, -28.0}, {-188.0, -28.0}, {-188.0, -128.0}, {-122.0, -128.0}}, color = {0, 0, 191}));
        connect(Food_Production1.marg_prod_agr_inp, Arable_Land_Dynamics1.marg_prod_agr_inp) annotation(
          Line(visible = true, points = {{-78.0, -120.0}, {-24.0, -120.0}, {-24.0, -64.0}, {-172.0, -64.0}, {-172.0, -12.0}, {-122.0, -12.0}}, color = {0, 0, 191}));
        connect(Food_Production1.land_yield, Arable_Land_Dynamics1.land_yield) annotation(
          Line(visible = true, points = {{-78.0, -112.0}, {-20.0, -112.0}, {-20.0, -60.0}, {-192.0, -60.0}, {-192.0, -4.0}, {-122.0, -4.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.land_fertility, Food_Production1.land_fertility) annotation(
          Line(visible = true, points = {{142.0, -120.0}, {192.0, -120.0}, {192.0, -164.0}, {-112.0, -164.0}, {-112.0, -142.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.s_yield_mlt_air_poll, Food_Production1.s_yield_mlt_air_poll) annotation(
          Line(visible = true, points = {{-78.0, 72.0}, {32.0, 72.0}, {32.0, -168.0}, {-104.0, -168.0}, {-104.0, -142.0}}, color = {0, 0, 191}));
        connect(Food_Production1.yield_tech_mult_icor_COYM, Industrial_Investment1.yield_tech_mult_icor_COYM) annotation(
          Line(visible = true, points = {{-96.0, -142.0}, {-96.0, -174.0}, {28.0, -174.0}, {28.0, 96.0}, {98.0, 96.0}}, color = {0, 0, 191}));
        connect(Food_Production1.p_fr_inp_for_land_maint, Land_Fertility1.p_fr_inp_for_land_maint) annotation(
          Line(visible = true, points = {{-88.0, -142.0}, {-88.0, -160.0}, {44.0, -160.0}, {44.0, -120.0}, {98.0, -120.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.serv_out_pc, Human_Fertility1.serv_out_pc) annotation(
          Line(visible = true, points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 190.0}, {98.0, 190.0}}, color = {0, 0, 191}));
        connect(Food_Production1.ind_out_pc, Service_Sector_Investment1.ind_out_pc) annotation(
          Line(visible = true, points = {{-122.0, -128.0}, {-188.0, -128.0}, {-188.0, -232.0}, {-122.0, -232.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.capital_util_fr, Service_Sector_Investment1.capital_util_fr) annotation(
          Line(visible = true, points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {-172.0, -180.0}, {-172.0, -208.0}, {-122.0, -208.0}}, color = {0, 0, 191}));
        connect(Food_Production1.population, Service_Sector_Investment1.population) annotation(
          Line(visible = true, points = {{-122.0, -104.0}, {-180.0, -104.0}, {-180.0, -216.0}, {-122.0, -216.0}}, color = {0, 0, 191}));
        connect(Food_Production1.industrial_output, Service_Sector_Investment1.industrial_output) annotation(
          Line(visible = true, points = {{-122.0, -136.0}, {-184.0, -136.0}, {-184.0, -224.0}, {-122.0, -224.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.industrial_output, Food_Production1.industrial_output) annotation(
          Line(visible = true, points = {{-122.0, 80.0}, {-184.0, 80.0}, {-184.0, -136.0}, {-122.0, -136.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.arable_land, Food_Production1.arable_land) annotation(
          Line(visible = true, points = {{-122.0, 64.0}, {-176.0, 64.0}, {-176.0, -112.0}, {-122.0, -112.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.yield_tech_LYTD, Food_Production1.yield_tech_LYTD) annotation(
          Line(visible = true, points = {{142.0, -110.0}, {192.0, -110.0}, {192.0, -82.0}, {-112.0, -82.0}, {-112.0, -90.0}, {-112.0, -98.0}}, color = {0, 0, 191}));
        connect(Food_Production1.tot_agric_invest, Arable_Land_Dynamics1.tot_agric_invest) annotation(
          Line(visible = true, points = {{-88.0, -98.0}, {-88.0, -52.0}, {-200.0, -52.0}, {-200.0, -20.0}, {-122.0, -20.0}}, color = {0, 0, 191}));
        connect(Food_Production1.food_pc, Life_Expectancy1.food_pc) annotation(
          Line(visible = true, points = {{-96.0, -98.0}, {-96.0, -74.0}, {256.0, -74.0}, {256.0, -28.0}, {318.0, -28.0}}, color = {0, 0, 191}));
        connect(Food_Production1.s_fioa_agr, Industrial_Investment1.s_fioa_agr) annotation(
          Line(visible = true, points = {{-78.0, -136.0}, {-4.0, -136.0}, {-4.0, 64.0}, {98.0, 64.0}}, color = {0, 0, 191}));
        connect(Food_Production1.agr_inp_per_hect, Pollution_Dynamics1.agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -56.0}, {-196.0, -56.0}, {-196.0, 72.0}, {-122.0, 72.0}}, color = {0, 0, 191}));
        connect(Food_Production1.food_ratio, Land_Fertility1.food_ratio) annotation(
          Line(visible = true, points = {{-78.0, -104.0}, {10.0, -104.0}, {10.0, -110.0}, {98.0, -110.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_index, Land_Fertility1.ppoll_index) annotation(
          Line(visible = true, points = {{-78.0, 80.0}, {20.0, 80.0}, {20.0, -130.0}, {98.0, -130.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.ppoll_index, Life_Expectancy1.ppoll_index) annotation(
          Line(visible = true, points = {{98.0, -130.0}, {20.0, -130.0}, {20.0, -70.0}, {268.0, -70.0}, {268.0, -36.0}, {318.0, -36.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.capital_util_fr, Industrial_Investment1.capital_util_fr) annotation(
          Line(visible = true, points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {24.0, -180.0}, {24.0, 80.0}, {98.0, 80.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, NR_Resource_Utilization1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -110.0}, {318.0, -110.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.ind_cap_out_ratio_2_ICOR2T, Industrial_Investment1.ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(visible = true, points = {{362.0, -124.0}, {428.0, -124.0}, {428.0, 120.0}, {108.0, 120.0}, {108.0, 102.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.pc_res_use_mlt, Pollution_Dynamics1.pc_res_use_mlt) annotation(
          Line(visible = true, points = {{362.0, -108.0}, {424.0, -106.4486}, {424.0, 124.0}, {-176.0, 124.0}, {-176.0, 96.0}, {-122.0, 96.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Life_Expectancy1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -12.0}, {318.0, -12.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Human_Welfare_Index1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 70.0}, {318.0, 70.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.life_expectancy, Human_Welfare_Index1.life_expectancy) annotation(
          Line(visible = true, points = {{362.0, -20.0}, {420.0, -20.0}, {420.0, 40.0}, {250.0, 40.0}, {250.0, 90.0}, {318.0, 90.0}}, color = {0, 0, 191}));
        connect(Human_Welfare_Index1.life_expectancy, Human_Fertility1.life_expectancy) annotation(
          Line(visible = true, points = {{318.0, 90.0}, {250.0, 90.0}, {250.0, 128.0}, {32.0, 128.0}, {32.0, 180.0}, {98.0, 180.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_capital, Labor_Utilization1.industrial_capital) annotation(
          Line(visible = true, points = {{142.0, 76.0}, {196.0, 76.0}, {196.0, -78.0}, {44.0, -78.0}, {44.0, -20.0}, {98.0, -20.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.s_fr_cap_al_obt_res, Industrial_Investment1.s_fr_cap_al_obt_res) annotation(
          Line(visible = true, points = {{362.0, -132.0}, {432.0, -132.0}, {432.0, 132.0}, {44.0, 132.0}, {44.0, 72.0}, {98.0, 72.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_gen_rt, Human_Ecological_Footprint1.ppoll_gen_rt) annotation(
          Line(visible = true, points = {{-78.0, 64.0}, {-20.0, 64.0}, {-20.0, 148.0}, {256.0, 148.0}, {256.0, 170.0}, {318.0, 170.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.arable_land, Pollution_Dynamics1.arable_land) annotation(
          Line(visible = true, points = {{-78.0, -20.0}, {-20.0, -20.0}, {-20.0, 26.0}, {-176.0, 26.0}, {-176.0, 64.0}, {-122.0, 64.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.population, Pollution_Dynamics1.population) annotation(
          Line(visible = true, points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 140.0}, {-180.0, 140.0}, {-180.0, 88.0}, {-122.0, 88.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Human_Fertility1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {36.0, 30.0}, {36.0, 170.0}, {98.0, 170.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.life_expectancy, Population_Dynamics1.life_expectancy) annotation(
          Line(visible = true, points = {{98.0, 180.0}, {32.0, 180.0}, {32.0, 128.0}, {-190.0, 128.0}, {-190.0, 170.0}, {-122.0, 170.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.total_fertility, Population_Dynamics1.total_fertility) annotation(
          Line(visible = true, points = {{142.0, 180.0}, {196.0, 180.0}, {196.0, 144.0}, {-200.0, 144.0}, {-200.0, 190.0}, {-122.0, 190.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.population, NR_Resource_Utilization1.population) annotation(
          Line(visible = true, points = {{318.0, -20.0}, {260.0, -20.0}, {260.0, -120.0}, {318.0, -120.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_tech_mult_icor_COPM, Industrial_Investment1.ppoll_tech_mult_icor_COPM) annotation(
          Line(visible = true, origin = {10.0, 88.0}, points = {{-88.0, 0.0}, {88.0, 0.0}}, color = {0, 0, 191}));
        population = Population_Dynamics1.Population.y;
        food = Food_Production1.Food.food;
        industrial_output = Industrial_Investment1.Industrial_Output.industrial_output;
        ppoll_index = Pollution_Dynamics1.PPoll_Index.y;
        nr_resources = NR_Resource_Utilization1.NR_Resources.y;
        fioa_ind = Industrial_Investment1.FIOA_Ind.fioa_ind;
        s_fioa_agr = Food_Production1.S_FIOA_Agr.s_fioa_agr;
        s_fioa_cons = Industrial_Investment1.S_FIOA_Cons.s_fioa_cons;
        s_fioa_serv = Service_Sector_Investment1.S_FIOA_Serv.s_fioa_serv;
        s_fr_cap_al_obt_res = NR_Resource_Utilization1.S_Fr_Cap_Al_Obt_Res.s_fr_cap_al_obt_res;
        life_expectancy = Life_Expectancy1.Life_Expectancy.y;
        food_pc = Food_Production1.Food_PC.y;
        serv_out_pc = Service_Sector_Investment1.Serv_Out_PC.y;
        ind_out_pc = Industrial_Investment1.Ind_Out_PC.y;
        human_ecological_footprint = Human_Ecological_Footprint1.HEF_Human_Ecological_Footprint.hef_human_ecological_footprint;
        human_welfare_index = Human_Welfare_Index1.HWI_Human_Welfare_Index.hwi_human_welfare_index;
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-222.0, -262.0}, {440.0, 220.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-64.0, 40.0}, {292.0, 114.0}}, textString = "Combining the", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-78.0, -32.0}, {308.0, 34.0}}, textString = "Measures of", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-136.0, -124.0}, {344.0, -20.0}}, textString = "Scenarios #6 and #8", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})),
          experiment(StartTime = 1900, StopTime = 2100),
          experimentSetupOutput,
          Documentation(info = "<html>
This is <font color=red><b>Scenario #9</b></font> of the <font color=red><b>WORLD3</b></font> model. This scenario starts out with the same assumptions as <font color=red><b>Scenario #8</b></font>.  Control of the industrial output helped to guarantee a relatively high standard of living for a while longer.  Yet, the stressors discussed before finally drag the system down. <p>
 
We now want to combine the measures of <font color=red><b>Scenario #6</b></font> and <font color=red><b>Scenario #8</b></font>. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.L., W.W. Behrens III, D.M., Meadows, R.F. Naill, J. Randers, and E.K.O. Zahn (1974), <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>, Wright-Allen Press, 637p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
 
In order to accomplish this change, you need to modify the three tables as done earlier: <p>
<font color=red>parameter Real p_ppoll_tech_chg_mlt[:] = {<b>-0.04</b>,<b>-0.04</b>,0,0} \"Persistent pollution technology change multiplier\";</font>, <p>
<font color=red>parameter Real p_res_tech_chg_mlt[:] = {<b>-0.04</b>,<b>-0.04</b>,0,0} \"Resource technology change multiplier\";</font>. <p>
<font color=red>parameter Real p_yield_tech_chg_mlt[:] = {0,0,<b>0.04</b>,<b>0.04</b>} \"Yield technology change multiplier\";</font>. <p>
 
We also need to reset one more of the switching times in the model: <p>
<font color=red>parameter Real t_land_life_time(unit=\"yr\") = <b>2002</b> \"Land life time\";</font>. <p>
 
<hr> <p>
 
Simulate the model from 1900 until 2100, and display the same variables as in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> at page 245: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_28.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_29.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_30.png\"> <p>
 
<hr> <p>
 
This seems to have done the trick.  The population no longer declines during the 21<sup>st</sup> century.  Is this effort sustainable? <p>
 
To answer this question, let us simulate the model once more, this time from 1900 until 2500: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_31.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_32.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_33.png\"> <p>
 
<hr> <p>
 
The effort is not sustainable in the long run.  As we continue to produce industrial goods in order to maintain a high standard of living, we continue to use up the non-recoverable resources, albeit at a much slower rate.  Eventually, these resources get exhausted, and at that time, we return to a life in misery. <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_9;

      model Scenario_10 "Influencing the future 20 years earlier"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 350 "Desired annual industrial per capita output";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2.5 "Controlled average life of agricultural input";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 18 "Controlled average life of industrial capital";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 25 "Controlled average life of service sector capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real reproductive_lifetime(unit = "yr") = 30.0 "Reproductive life time";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_fcaor_time(unit = "yr") = 1982 "Year of capital allocation to resource use efficiency";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 1982 "Year of continued fertility change";
        parameter Real t_ind_equil_time(unit = "yr") = 1982 "Year of industrial equilibrium";
        parameter Real t_land_life_time(unit = "yr") = 1982 "Land life time";
        parameter Real t_policy_year(unit = "yr") = 1982 "Year of policy change";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 1982 "Time to zero population growth";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_ppoll_tech_chg_mlt[:] = {-0.04, -0.04, 0, 0} "Persistent pollution technology change multiplier";
        parameter Real p_res_tech_chg_mlt[:] = {-0.04, -0.04, 0, 0} "Resource technology change multiplier";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0.04, 0.04} "Yield technology change multiplier";
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real nr_resources_init(unit = "ton") = 2000000000000.0 "Initial available non-recoverable resources";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        output Real population "Total human world population";
        output Real food(unit = "dollar/yr") "Total annually produced food";
        output Real industrial_output(unit = "dollar/yr") "Total annual world industrial output";
        output Real ppoll_index "Persistent pollution index";
        output Real nr_resources "Remaining non-recoverable natural resources";
        output Real fioa_ind "Fraction of industrial output allocated to industrial/military complex";
        output Real s_fioa_agr "Fraction of industrial output allocated to food production";
        output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        output Real life_expectancy(unit = "yr") "Life expectancy";
        output Real food_pc(unit = "dollar/yr") "Total annual food per person";
        output Real serv_out_pc(unit = "dollar/yr") "Total annual services per person";
        output Real ind_out_pc(unit = "dollar/yr") "Total annual consumer goods per person";
        output Real human_ecological_footprint(unit = "Gha") "Human ecological footprint";
        output Real human_welfare_index "Human welfare index";
        SystemDynamics.WorldDynamics.World3.Population_Dynamics Population_Dynamics1(pop1_init = pop1_init, pop2_init = pop2_init, pop3_init = pop3_init, pop4_init = pop4_init, labor_force_partic = labor_force_partic, reproductive_lifetime = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "Population dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Pollution_Dynamics Pollution_Dynamics1(agr_mtl_toxic_index = agr_mtl_toxic_index, assim_half_life_1970 = assim_half_life_1970, des_ppoll_index_DPOLX = des_ppoll_index_DPOLX, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl, frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index, ind_out_in_1970 = ind_out_in_1970, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1, pers_pollution_init = pers_pollution_init, ppoll_in_1970 = ppoll_in_1970, ppoll_tech_init = ppoll_tech_init, ppoll_trans_del = ppoll_trans_del, t_air_poll_time = t_air_poll_time, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, p_ppoll_tech_chg_mlt = p_ppoll_tech_chg_mlt) "Persistent pollution generation" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Arable_Land_Dynamics Arable_Land_Dynamics1(arable_land_init = arable_land_init, avg_life_land_norm = avg_life_land_norm, inherent_land_fert = inherent_land_fert, pot_arable_land_init = pot_arable_land_init, pot_arable_land_tot = pot_arable_land_tot, social_discount = social_discount, t_land_life_time = t_land_life_time, urban_ind_land_init = urban_ind_land_init, urb_ind_land_dev_time = urb_ind_land_dev_time) "Arable land dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Food_Production Food_Production1(agr_inp_init = agr_inp_init, food_short_perc_del = food_short_perc_del, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2, p_land_yield_fact_1 = p_land_yield_fact_1, perc_food_ratio_init = perc_food_ratio_init, processing_loss = processing_loss, subsist_food_pc = subsist_food_pc, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, land_fr_harvested = land_fr_harvested) "Food production" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Ecological_Footprint Human_Ecological_Footprint1 "Human ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {340.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Fertility Human_Fertility1(des_compl_fam_size_norm = des_compl_fam_size_norm, hlth_serv_impact_del = hlth_serv_impact_del, income_expect_avg_time = income_expect_avg_time, lifet_perc_del = lifet_perc_del, max_tot_fert_norm = max_tot_fert_norm, social_adj_del = social_adj_del, t_fert_cont_eff_time = t_fert_cont_eff_time, t_zero_pop_grow_time = t_zero_pop_grow_time) "Human fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Welfare_Index Human_Welfare_Index1 "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {340.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Industrial_Investment Industrial_Investment1(industrial_capital_init = industrial_capital_init, ind_out_pc_des = ind_out_pc_des, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2, p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1, t_ind_equil_time = t_ind_equil_time, t_policy_year = t_policy_year) "Industrial investment" annotation(
          Placement(visible = true, transformation(origin = {120.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Labor_Utilization Labor_Utilization1(labor_util_fr_del_init = labor_util_fr_del_init, labor_util_fr_del_time = labor_util_fr_del_time) "Labor utilization" annotation(
          Placement(visible = true, transformation(origin = {120.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Land_Fertility Land_Fertility1(des_food_ratio_dfr = des_food_ratio_dfr, inherent_land_fert = inherent_land_fert, land_fertility_init = land_fertility_init, t_policy_year = t_policy_year, yield_tech_init = yield_tech_init, p_yield_tech_chg_mlt = p_yield_tech_chg_mlt) "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Life_Expectancy Life_Expectancy1(hlth_serv_impact_del = hlth_serv_impact_del, life_expect_norm = life_expect_norm, subsist_food_pc = subsist_food_pc) "Life expectancy" annotation(
          Placement(visible = true, transformation(origin = {340.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.NR_Resource_Utilization NR_Resource_Utilization1(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR, nr_resources_init = nr_resources_init, p_nr_res_use_fact_1 = p_nr_res_use_fact_1, res_tech_init = res_tech_init, t_policy_year = t_policy_year, t_fcaor_time = t_fcaor_time, tech_dev_del_TDD = tech_dev_del_TDD, p_res_tech_chg_mlt = p_res_tech_chg_mlt, p_fr_cap_al_obt_res_2 = p_fr_cap_al_obt_res_2) "Non-recoverable natural resource utilization" annotation(
          Placement(visible = true, transformation(origin = {340.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Service_Sector_Investment Service_Sector_Investment1(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2, service_capital_init = service_capital_init) "Service sector investment" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -220.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
      equation
        connect(Food_Production1.tot_agric_invest, Arable_Land_Dynamics1.tot_agric_invest) annotation(
          Line(visible = true, points = {{-88.0, -98.0}, {-88.0, -52.0}, {-200.0, -52.0}, {-200.0, -20.0}, {-122.0, -20.0}}, color = {0, 0, 191}));
        connect(Food_Production1.yield_tech_mult_icor_COYM, Industrial_Investment1.yield_tech_mult_icor_COYM) annotation(
          Line(visible = true, points = {{-96.0, -142.0}, {-96.0, -174.0}, {28.0, -174.0}, {28.0, 96.0}, {98.0, 96.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.urban_ind_land, Human_Ecological_Footprint1.urban_ind_land) annotation(
          Line(visible = true, points = {{-78.0, -30.0}, {-24.0, -30.0}, {-24.0, 136.0}, {252.0, 136.0}, {252.0, 180.0}, {318.0, 180.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_gen_rt, Human_Ecological_Footprint1.ppoll_gen_rt) annotation(
          Line(visible = true, points = {{-78.0, 64.0}, {-20.0, 64.0}, {-20.0, 148.0}, {256.0, 148.0}, {256.0, 170.0}, {318.0, 170.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.s_fr_cap_al_obt_res, Industrial_Investment1.s_fr_cap_al_obt_res) annotation(
          Line(visible = true, points = {{362.0, -132.0}, {432.0, -132.0}, {432.0, 132.0}, {44.0, 132.0}, {44.0, 72.0}, {98.0, 72.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.capital_util_fr, Industrial_Investment1.capital_util_fr) annotation(
          Line(visible = true, points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {24.0, -180.0}, {24.0, 80.0}, {98.0, 80.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.ind_cap_out_ratio_2_ICOR2T, Industrial_Investment1.ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(visible = true, points = {{362.0, -124.0}, {428.0, -124.0}, {428.0, 120.0}, {108.0, 120.0}, {108.0, 102.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_tech_mult_icor_COPM, Industrial_Investment1.ppoll_tech_mult_icor_COPM) annotation(
          Line(visible = true, origin = {10.0, 88.0}, points = {{-88.0, 0.0}, {88.0, 0.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.capital_util_fr, Service_Sector_Investment1.capital_util_fr) annotation(
          Line(visible = true, points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {-172.0, -180.0}, {-172.0, -208.0}, {-122.0, -208.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.s_yield_mlt_air_poll, Food_Production1.s_yield_mlt_air_poll) annotation(
          Line(visible = true, points = {{-78.0, 72.0}, {32.0, 72.0}, {32.0, -168.0}, {-104.0, -168.0}, {-104.0, -142.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.fr_inp_al_land_dev, Food_Production1.fr_inp_al_land_dev) annotation(
          Line(visible = true, points = {{-78.0, -10.0}, {-28.0, -10.0}, {-28.0, -68.0}, {-172.0, -68.0}, {-172.0, -120.0}, {-122.0, -120.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.yield_tech_LYTD, Food_Production1.yield_tech_LYTD) annotation(
          Line(visible = true, points = {{142.0, -110.0}, {192.0, -110.0}, {192.0, -82.0}, {-112.0, -82.0}, {-112.0, -87.9893}, {-112.0, -98.0}}, color = {0, 0, 191}));
        connect(NR_Resource_Utilization1.pc_res_use_mlt, Pollution_Dynamics1.pc_res_use_mlt) annotation(
          Line(visible = true, points = {{362.0, -108.0}, {425.7946, -108.0}, {424.0, 124.0}, {-176.0, 124.0}, {-176.0, 96.0}, {-122.0, 96.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.life_expectancy, Population_Dynamics1.life_expectancy) annotation(
          Line(visible = true, points = {{98.0, 180.0}, {32.0, 180.0}, {32.0, 128.0}, {-190.0, 128.0}, {-190.0, 170.0}, {-122.0, 170.0}}, color = {0, 0, 191}));
        connect(Human_Welfare_Index1.life_expectancy, Human_Fertility1.life_expectancy) annotation(
          Line(visible = true, points = {{318.0, 90.0}, {250.0, 90.0}, {250.0, 128.0}, {32.0, 128.0}, {32.0, 180.0}, {98.0, 180.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.life_expectancy, Human_Welfare_Index1.life_expectancy) annotation(
          Line(visible = true, points = {{362.0, -20.0}, {420.0, -20.0}, {420.0, 40.0}, {250.0, 40.0}, {250.0, 90.0}, {318.0, 90.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.land_fertility, Food_Production1.land_fertility) annotation(
          Line(visible = true, points = {{142.0, -120.0}, {192.0, -120.0}, {192.0, -164.0}, {-112.0, -164.0}, {-112.0, -142.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_capital, Labor_Utilization1.industrial_capital) annotation(
          Line(visible = true, points = {{142.0, 76.0}, {196.0, 76.0}, {196.0, -78.0}, {44.0, -78.0}, {44.0, -20.0}, {98.0, -20.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.total_fertility, Population_Dynamics1.total_fertility) annotation(
          Line(visible = true, points = {{142.0, 180.0}, {196.0, 180.0}, {196.0, 144.0}, {-200.0, 144.0}, {-200.0, 190.0}, {-122.0, 190.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.labor_force, Labor_Utilization1.labor_force) annotation(
          Line(visible = true, points = {{-78.0, 170.0}, {12.0, 170.0}, {12.0, -60.0}, {108.0, -60.0}, {108.0, -42.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.s_fioa_serv, Industrial_Investment1.s_fioa_serv) annotation(
          Line(visible = true, points = {{-78.0, -230.0}, {16.0, -230.0}, {16.0, 38.0}, {108.0, 38.0}, {108.0, 58.0}}, color = {0, 0, 191}));
        connect(Food_Production1.p_fr_inp_for_land_maint, Land_Fertility1.p_fr_inp_for_land_maint) annotation(
          Line(visible = true, points = {{-88.0, -142.0}, {-88.0, -160.0}, {44.0, -160.0}, {44.0, -120.0}, {98.0, -120.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.service_capital, Labor_Utilization1.service_capital) annotation(
          Line(visible = true, points = {{-78.0, -220.0}, {4.0, -220.0}, {4.0, -4.0}, {98.0, -4.0}}, color = {0, 0, 191}));
        connect(Food_Production1.s_fioa_agr, Industrial_Investment1.s_fioa_agr) annotation(
          Line(visible = true, points = {{-78.0, -136.0}, {-4.0, -136.0}, {-4.0, 64.0}, {98.0, 64.0}}, color = {0, 0, 191}));
        connect(Food_Production1.agr_inp_per_hect, Labor_Utilization1.agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -28.0}, {98.0, -28.0}}, color = {0, 0, 191}));
        connect(Food_Production1.agr_inp_per_hect, Pollution_Dynamics1.agr_inp_per_hect) annotation(
          Line(visible = true, points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -56.0}, {-196.0, -56.0}, {-196.0, 72.0}, {-122.0, 72.0}}, color = {0, 0, 191}));
        connect(Food_Production1.marg_prod_agr_inp, Arable_Land_Dynamics1.marg_prod_agr_inp) annotation(
          Line(visible = true, points = {{-78.0, -120.0}, {-24.0, -120.0}, {-24.0, -64.0}, {-172.0, -64.0}, {-172.0, -12.0}, {-122.0, -12.0}}, color = {0, 0, 191}));
        connect(Food_Production1.food_pc, Life_Expectancy1.food_pc) annotation(
          Line(visible = true, points = {{-96.0, -98.0}, {-96.0, -74.0}, {256.0, -74.0}, {256.0, -28.0}, {318.0, -28.0}}, color = {0, 0, 191}));
        connect(Food_Production1.land_yield, Arable_Land_Dynamics1.land_yield) annotation(
          Line(visible = true, points = {{-78.0, -112.0}, {-20.0, -112.0}, {-20.0, -60.0}, {-192.0, -60.0}, {-192.0, -4.0}, {-122.0, -4.0}}, color = {0, 0, 191}));
        connect(Food_Production1.food_ratio, Land_Fertility1.food_ratio) annotation(
          Line(visible = true, points = {{-78.0, -104.0}, {10.0, -104.0}, {10.0, -110.0}, {98.0, -110.0}}, color = {0, 0, 191}));
        connect(Land_Fertility1.ppoll_index, Life_Expectancy1.ppoll_index) annotation(
          Line(visible = true, points = {{98.0, -130.0}, {20.0, -130.0}, {20.0, -70.0}, {268.0, -70.0}, {268.0, -36.0}, {318.0, -36.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.ppoll_index, Land_Fertility1.ppoll_index) annotation(
          Line(visible = true, points = {{-78.0, 80.0}, {20.0, 80.0}, {20.0, -130.0}, {98.0, -130.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(visible = true, points = {{318.0, -4.0}, {218.0, -4.0}, {218.0, 18.0}, {108.0, 18.0}, {108.0, 10.0}, {108.0, 2.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(visible = true, points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 18.0}, {70.0, 18.0}, {108.0, 18.0}, {108.0, 2.0}}, color = {0, 0, 191}));
        connect(Service_Sector_Investment1.serv_out_pc, Human_Fertility1.serv_out_pc) annotation(
          Line(visible = true, points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 190.0}, {98.0, 190.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, NR_Resource_Utilization1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -110.0}, {318.0, -110.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Life_Expectancy1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -12.0}, {318.0, -12.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Human_Welfare_Index1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 70.0}, {318.0, 70.0}}, color = {0, 0, 191}));
        connect(Human_Fertility1.ind_out_pc, Labor_Utilization1.ind_out_pc) annotation(
          Line(visible = true, points = {{98.0, 170.0}, {36.0, 170.0}, {36.0, -12.0}, {98.0, -12.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Human_Fertility1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {36.0, 30.0}, {36.0, 170.0}, {98.0, 170.0}}, color = {0, 0, 191}));
        connect(Food_Production1.ind_out_pc, Service_Sector_Investment1.ind_out_pc) annotation(
          Line(visible = true, points = {{-122.0, -128.0}, {-188.0, -128.0}, {-188.0, -232.0}, {-122.0, -232.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.ind_out_pc, Food_Production1.ind_out_pc) annotation(
          Line(visible = true, points = {{-122.0, -28.0}, {-188.0, -28.0}, {-188.0, -128.0}, {-122.0, -128.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.ind_out_pc, Arable_Land_Dynamics1.ind_out_pc) annotation(
          Line(visible = true, points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {-188.0, 30.0}, {-188.0, -28.0}, {-122.0, -28.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_output, NR_Resource_Utilization1.industrial_output) annotation(
          Line(visible = true, points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, -130.0}, {318.0, -130.0}}, color = {0, 0, 191}));
        connect(Food_Production1.industrial_output, Service_Sector_Investment1.industrial_output) annotation(
          Line(visible = true, points = {{-122.0, -136.0}, {-184.0, -136.0}, {-184.0, -224.0}, {-122.0, -224.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.industrial_output, Food_Production1.industrial_output) annotation(
          Line(visible = true, points = {{-122.0, 80.0}, {-184.0, 80.0}, {-184.0, -136.0}, {-122.0, -136.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.industrial_output, Pollution_Dynamics1.industrial_output) annotation(
          Line(visible = true, points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, 22.0}, {-184.0, 22.0}, {-184.0, 80.0}, {-122.0, 80.0}}, color = {0, 0, 191}));
        connect(Labor_Utilization1.arable_land, Human_Ecological_Footprint1.arable_land) annotation(
          Line(visible = true, points = {{98.0, -36.0}, {40.0, -36.0}, {40.0, -64.0}, {264.0, -64.0}, {264.0, 190.0}, {318.0, 190.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.arable_land, Labor_Utilization1.arable_land) annotation(
          Line(visible = true, points = {{-78.0, -20.0}, {40.0, -20.0}, {40.0, -36.0}, {98.0, -36.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.arable_land, Food_Production1.arable_land) annotation(
          Line(visible = true, points = {{-122.0, 64.0}, {-176.0, 64.0}, {-176.0, -112.0}, {-122.0, -112.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.arable_land, Pollution_Dynamics1.arable_land) annotation(
          Line(visible = true, points = {{-78.0, -20.0}, {-20.0, -20.0}, {-20.0, 26.0}, {-176.0, 26.0}, {-176.0, 64.0}, {-122.0, 64.0}}, color = {0, 0, 191}));
        connect(Life_Expectancy1.population, NR_Resource_Utilization1.population) annotation(
          Line(visible = true, points = {{318.0, -20.0}, {260.0, -20.0}, {260.0, -120.0}, {318.0, -120.0}}, color = {0, 0, 191}));
        connect(Industrial_Investment1.population, Life_Expectancy1.population) annotation(
          Line(visible = true, points = {{116.0, 58.0}, {116.0, 34.0}, {260.0, 34.0}, {260.0, -20.0}, {318.0, -20.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.population, Industrial_Investment1.population) annotation(
          Line(visible = true, points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 34.0}, {116.0, 34.0}, {116.0, 58.0}}, color = {0, 0, 191}));
        connect(Food_Production1.population, Service_Sector_Investment1.population) annotation(
          Line(visible = true, points = {{-122.0, -104.0}, {-180.0, -104.0}, {-180.0, -216.0}, {-122.0, -216.0}}, color = {0, 0, 191}));
        connect(Arable_Land_Dynamics1.population, Food_Production1.population) annotation(
          Line(visible = true, points = {{-122.0, -36.0}, {-180.0, -36.0}, {-180.0, -104.0}, {-122.0, -104.0}}, color = {0, 0, 191}));
        connect(Pollution_Dynamics1.population, Arable_Land_Dynamics1.population) annotation(
          Line(visible = true, points = {{-122.0, 88.0}, {-180.0, 88.0}, {-180.0, -36.0}, {-122.0, -36.0}}, color = {0, 0, 191}));
        connect(Population_Dynamics1.population, Pollution_Dynamics1.population) annotation(
          Line(visible = true, points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 140.0}, {-180.0, 140.0}, {-180.0, 88.0}, {-122.0, 88.0}}, color = {0, 0, 191}));
        population = Population_Dynamics1.Population.y;
        food = Food_Production1.Food.food;
        industrial_output = Industrial_Investment1.Industrial_Output.industrial_output;
        ppoll_index = Pollution_Dynamics1.PPoll_Index.y;
        nr_resources = NR_Resource_Utilization1.NR_Resources.y;
        fioa_ind = Industrial_Investment1.FIOA_Ind.fioa_ind;
        s_fioa_agr = Food_Production1.S_FIOA_Agr.s_fioa_agr;
        s_fioa_cons = Industrial_Investment1.S_FIOA_Cons.s_fioa_cons;
        s_fioa_serv = Service_Sector_Investment1.S_FIOA_Serv.s_fioa_serv;
        s_fr_cap_al_obt_res = NR_Resource_Utilization1.S_Fr_Cap_Al_Obt_Res.s_fr_cap_al_obt_res;
        life_expectancy = Life_Expectancy1.Life_Expectancy.y;
        food_pc = Food_Production1.Food_PC.y;
        serv_out_pc = Service_Sector_Investment1.Serv_Out_PC.y;
        ind_out_pc = Industrial_Investment1.Ind_Out_PC.y;
        human_ecological_footprint = Human_Ecological_Footprint1.HEF_Human_Ecological_Footprint.hef_human_ecological_footprint;
        human_welfare_index = Human_Welfare_Index1.HWI_Human_Welfare_Index.hwi_human_welfare_index;
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-222.0, -262.0}, {440.0, 220.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-64.0, 40.0}, {292.0, 114.0}}, textString = "Influencing the", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-78.0, -32.0}, {308.0, 34.0}}, textString = "Future", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-78.0, -126.0}, {304.0, -26.0}}, textString = "20 Years Earlier", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics),
          experiment(StartTime = 1900, StopTime = 2500),
          experimentSetupOutput,
          Documentation(info = "<html>
This is <font color=red><b>Scenario #10</b></font> of the <font color=red><b>WORLD3</b></font> model. This scenario starts out with the same assumptions as <font color=red><b>Scenario #9</b></font>. <p>
 
We now want to check what would have happened, had we started controlling our resources 20 years earlier. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.L., W.W. Behrens III, D.M., Meadows, R.F. Naill, J. Randers, and E.K.O. Zahn (1974), <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>, Wright-Allen Press, 637p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
 
In order to accomplish this change, we need to reset all of the switching times in the model: <p>
<font color=red>parameter Real t_fcaor_time(unit=\"yr\") = <b>1982</b> \"Year of capital allocation to resource use efficiency\";</font>. <p>
<font color=red>parameter Real t_fert_cont_eff_time(unit=\"yr\") = <b>1982</b> \"Year of continued fertility change\";</font>. <p>
<font color=red>parameter Real t_ind_equil_time(unit=\"yr\") = <b>1982</b> \"Year of industrial equilibrium\";</font>. <p>
<font color=red>parameter Real t_land_life_time(unit=\"yr\") = <b>1982</b> \"Land life time\";</font>. <p>
<font color=red>parameter Real t_policy_year(unit=\"yr\") = <b>1982</b> \"Year of policy change\";</font>. <p>
<font color=red>parameter Real t_zero_pop_grow_time(unit=\"yr\") = <b>1982</b> \"Time to zero population growth\";</font>. <p>
 
<hr> <p>
 
Simulate the model from 1900 until 2500, and display the same variables as in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> at page 245: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_34.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_35.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_36.png\"> <p>
 
<hr> <p>
 
Initially, an earlier reaction would have been beneficial.  The population would have never climbed to 8 billion people.  The attainable standard of living would have been approximately equal.  In the long run, the predicament is the same as with <font color=red><b>Scenario #9</b></font>.  We are running out of the remaining non-recoverable resources.  Yet, the golden age would have lasted a bit longer. <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_10;

      model Scenario_11 "Influencing the future 10 years later"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 350 "Desired annual industrial per capita output";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2.5 "Controlled average life of agricultural input";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 18 "Controlled average life of industrial capital";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 25 "Controlled average life of service sector capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real reproductive_lifetime(unit = "yr") = 30.0 "Reproductive life time";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_fcaor_time(unit = "yr") = 2012 "Year of capital allocation to resource use efficiency";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 2012 "Year of continued fertility change";
        parameter Real t_ind_equil_time(unit = "yr") = 2012 "Year of industrial equilibrium";
        parameter Real t_land_life_time(unit = "yr") = 2012 "Land life time";
        parameter Real t_policy_year(unit = "yr") = 2012 "Year of policy change";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 2012 "Time to zero population growth";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_ppoll_tech_chg_mlt[:] = {-0.04, -0.04, 0, 0} "Persistent pollution technology change multiplier";
        parameter Real p_res_tech_chg_mlt[:] = {-0.04, -0.04, 0, 0} "Resource technology change multiplier";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0.04, 0.04} "Yield technology change multiplier";
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real nr_resources_init(unit = "ton") = 2000000000000.0 "Initial available non-recoverable resources";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        output Real population "Total human world population";
        output Real food(unit = "dollar/yr") "Total annually produced food";
        output Real industrial_output(unit = "dollar/yr") "Total annual world industrial output";
        output Real ppoll_index "Persistent pollution index";
        output Real nr_resources "Remaining non-recoverable natural resources";
        output Real fioa_ind "Fraction of industrial output allocated to industrial/military complex";
        output Real s_fioa_agr "Fraction of industrial output allocated to food production";
        output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        output Real life_expectancy(unit = "yr") "Life expectancy";
        output Real food_pc(unit = "dollar/yr") "Total annual food per person";
        output Real serv_out_pc(unit = "dollar/yr") "Total annual services per person";
        output Real ind_out_pc(unit = "dollar/yr") "Total annual consumer goods per person";
        output Real human_ecological_footprint(unit = "Gha") "Human ecological footprint";
        output Real human_welfare_index "Human welfare index";
        SystemDynamics.WorldDynamics.World3.Population_Dynamics Population_Dynamics1(pop1_init = pop1_init, pop2_init = pop2_init, pop3_init = pop3_init, pop4_init = pop4_init, labor_force_partic = labor_force_partic, reproductive_lifetime = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "Population dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Pollution_Dynamics Pollution_Dynamics1(agr_mtl_toxic_index = agr_mtl_toxic_index, assim_half_life_1970 = assim_half_life_1970, des_ppoll_index_DPOLX = des_ppoll_index_DPOLX, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl, frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index, ind_out_in_1970 = ind_out_in_1970, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1, pers_pollution_init = pers_pollution_init, ppoll_in_1970 = ppoll_in_1970, ppoll_tech_init = ppoll_tech_init, ppoll_trans_del = ppoll_trans_del, t_air_poll_time = t_air_poll_time, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, p_ppoll_tech_chg_mlt = p_ppoll_tech_chg_mlt) "Persistent pollution generation" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Arable_Land_Dynamics Arable_Land_Dynamics1(arable_land_init = arable_land_init, avg_life_land_norm = avg_life_land_norm, inherent_land_fert = inherent_land_fert, pot_arable_land_init = pot_arable_land_init, pot_arable_land_tot = pot_arable_land_tot, social_discount = social_discount, t_land_life_time = t_land_life_time, urban_ind_land_init = urban_ind_land_init, urb_ind_land_dev_time = urb_ind_land_dev_time) "Arable land dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Food_Production Food_Production1(agr_inp_init = agr_inp_init, food_short_perc_del = food_short_perc_del, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2, p_land_yield_fact_1 = p_land_yield_fact_1, perc_food_ratio_init = perc_food_ratio_init, processing_loss = processing_loss, subsist_food_pc = subsist_food_pc, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, land_fr_harvested = land_fr_harvested) "Food production" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Ecological_Footprint Human_Ecological_Footprint1 "Human ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {340.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Fertility Human_Fertility1(des_compl_fam_size_norm = des_compl_fam_size_norm, hlth_serv_impact_del = hlth_serv_impact_del, income_expect_avg_time = income_expect_avg_time, lifet_perc_del = lifet_perc_del, max_tot_fert_norm = max_tot_fert_norm, social_adj_del = social_adj_del, t_fert_cont_eff_time = t_fert_cont_eff_time, t_zero_pop_grow_time = t_zero_pop_grow_time) "Human fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Welfare_Index Human_Welfare_Index1 "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {340.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Industrial_Investment Industrial_Investment1(industrial_capital_init = industrial_capital_init, ind_out_pc_des = ind_out_pc_des, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2, p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1, t_ind_equil_time = t_ind_equil_time, t_policy_year = t_policy_year) "Industrial investment" annotation(
          Placement(visible = true, transformation(origin = {120.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Labor_Utilization Labor_Utilization1(labor_util_fr_del_init = labor_util_fr_del_init, labor_util_fr_del_time = labor_util_fr_del_time) "Labor utilization" annotation(
          Placement(visible = true, transformation(origin = {120.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Land_Fertility Land_Fertility1(des_food_ratio_dfr = des_food_ratio_dfr, inherent_land_fert = inherent_land_fert, land_fertility_init = land_fertility_init, t_policy_year = t_policy_year, yield_tech_init = yield_tech_init, p_yield_tech_chg_mlt = p_yield_tech_chg_mlt) "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Life_Expectancy Life_Expectancy1(hlth_serv_impact_del = hlth_serv_impact_del, life_expect_norm = life_expect_norm, subsist_food_pc = subsist_food_pc) "Life expectancy" annotation(
          Placement(visible = true, transformation(origin = {340.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.NR_Resource_Utilization NR_Resource_Utilization1(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR, nr_resources_init = nr_resources_init, p_nr_res_use_fact_1 = p_nr_res_use_fact_1, res_tech_init = res_tech_init, t_policy_year = t_policy_year, t_fcaor_time = t_fcaor_time, tech_dev_del_TDD = tech_dev_del_TDD, p_res_tech_chg_mlt = p_res_tech_chg_mlt, p_fr_cap_al_obt_res_2 = p_fr_cap_al_obt_res_2) "Non-recoverable natural resource utilization" annotation(
          Placement(visible = true, transformation(origin = {340.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Service_Sector_Investment Service_Sector_Investment1(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2, service_capital_init = service_capital_init) "Service sector investment" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -220.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
      equation
        population = Population_Dynamics1.Population.y;
        food = Food_Production1.Food.food;
        industrial_output = Industrial_Investment1.Industrial_Output.industrial_output;
        ppoll_index = Pollution_Dynamics1.PPoll_Index.y;
        nr_resources = NR_Resource_Utilization1.NR_Resources.y;
        fioa_ind = Industrial_Investment1.FIOA_Ind.fioa_ind;
        s_fioa_agr = Food_Production1.S_FIOA_Agr.s_fioa_agr;
        s_fioa_cons = Industrial_Investment1.S_FIOA_Cons.s_fioa_cons;
        s_fioa_serv = Service_Sector_Investment1.S_FIOA_Serv.s_fioa_serv;
        s_fr_cap_al_obt_res = NR_Resource_Utilization1.S_Fr_Cap_Al_Obt_Res.s_fr_cap_al_obt_res;
        life_expectancy = Life_Expectancy1.Life_Expectancy.y;
        food_pc = Food_Production1.Food_PC.y;
        serv_out_pc = Service_Sector_Investment1.Serv_Out_PC.y;
        ind_out_pc = Industrial_Investment1.Ind_Out_PC.y;
        human_ecological_footprint = Human_Ecological_Footprint1.HEF_Human_Ecological_Footprint.hef_human_ecological_footprint;
        human_welfare_index = Human_Welfare_Index1.HWI_Human_Welfare_Index.hwi_human_welfare_index;
        connect(Population_Dynamics1.population, Pollution_Dynamics1.population) annotation(
          Line(points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 140.0}, {-180.0, 140.0}, {-180.0, 88.0}, {-122.0, 88.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.population, Arable_Land_Dynamics1.population) annotation(
          Line(points = {{-122.0, 88.0}, {-180.0, 88.0}, {-180.0, -36.0}, {-122.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.population, Food_Production1.population) annotation(
          Line(points = {{-122.0, -36.0}, {-180.0, -36.0}, {-180.0, -104.0}, {-122.0, -104.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.population, Service_Sector_Investment1.population) annotation(
          Line(points = {{-122.0, -104.0}, {-180.0, -104.0}, {-180.0, -216.0}, {-122.0, -216.0}}, color = {0, 0, 191}, visible = true));
        connect(Population_Dynamics1.population, Industrial_Investment1.population) annotation(
          Line(points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 34.0}, {116.0, 34.0}, {116.0, 58.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.population, Life_Expectancy1.population) annotation(
          Line(points = {{116.0, 58.0}, {116.0, 34.0}, {260.0, 34.0}, {260.0, -20.0}, {318.0, -20.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.population, NR_Resource_Utilization1.population) annotation(
          Line(points = {{318.0, -20.0}, {260.0, -20.0}, {260.0, -120.0}, {318.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.arable_land, Pollution_Dynamics1.arable_land) annotation(
          Line(points = {{-78.0, -20.0}, {-20.0, -20.0}, {-20.0, 26.0}, {-176.0, 26.0}, {-176.0, 64.0}, {-122.0, 64.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.arable_land, Food_Production1.arable_land) annotation(
          Line(points = {{-122.0, 64.0}, {-176.0, 64.0}, {-176.0, -112.0}, {-122.0, -112.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.arable_land, Labor_Utilization1.arable_land) annotation(
          Line(points = {{-78.0, -20.0}, {40.0, -20.0}, {40.0, -36.0}, {98.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.arable_land, Human_Ecological_Footprint1.arable_land) annotation(
          Line(points = {{98.0, -36.0}, {40.0, -36.0}, {40.0, -64.0}, {264.0, -64.0}, {264.0, 190.0}, {318.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_output, Pollution_Dynamics1.industrial_output) annotation(
          Line(points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, 22.0}, {-184.0, 22.0}, {-184.0, 80.0}, {-122.0, 80.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.industrial_output, Food_Production1.industrial_output) annotation(
          Line(points = {{-122.0, 80.0}, {-184.0, 80.0}, {-184.0, -136.0}, {-122.0, -136.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.industrial_output, Service_Sector_Investment1.industrial_output) annotation(
          Line(points = {{-122.0, -136.0}, {-184.0, -136.0}, {-184.0, -224.0}, {-122.0, -224.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_output, NR_Resource_Utilization1.industrial_output) annotation(
          Line(points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, -130.0}, {318.0, -130.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Arable_Land_Dynamics1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {-188.0, 30.0}, {-188.0, -28.0}, {-122.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.ind_out_pc, Food_Production1.ind_out_pc) annotation(
          Line(points = {{-122.0, -28.0}, {-188.0, -28.0}, {-188.0, -128.0}, {-122.0, -128.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.ind_out_pc, Service_Sector_Investment1.ind_out_pc) annotation(
          Line(points = {{-122.0, -128.0}, {-188.0, -128.0}, {-188.0, -232.0}, {-122.0, -232.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Human_Fertility1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {36.0, 30.0}, {36.0, 170.0}, {98.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.ind_out_pc, Labor_Utilization1.ind_out_pc) annotation(
          Line(points = {{98.0, 170.0}, {36.0, 170.0}, {36.0, -12.0}, {98.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Human_Welfare_Index1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 70.0}, {318.0, 70.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Life_Expectancy1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -12.0}, {318.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, NR_Resource_Utilization1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -110.0}, {318.0, -110.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.serv_out_pc, Human_Fertility1.serv_out_pc) annotation(
          Line(points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 190.0}, {98.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 18.0}, {108.0, 18.0}, {108.0, 11.6909}, {108.0, 2.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(points = {{318.0, -4.0}, {218.0, -4.0}, {218.0, 18.0}, {108.0, 18.0}, {108.0, 10.0}, {108.0, 2.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_index, Land_Fertility1.ppoll_index) annotation(
          Line(points = {{-78.0, 80.0}, {20.0, 80.0}, {20.0, -130.0}, {98.0, -130.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.ppoll_index, Life_Expectancy1.ppoll_index) annotation(
          Line(points = {{98.0, -130.0}, {20.0, -130.0}, {20.0, -70.0}, {268.0, -70.0}, {268.0, -36.0}, {318.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.food_ratio, Land_Fertility1.food_ratio) annotation(
          Line(points = {{-78.0, -104.0}, {10.0, -104.0}, {10.0, -110.0}, {98.0, -110.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.land_yield, Arable_Land_Dynamics1.land_yield) annotation(
          Line(points = {{-78.0, -112.0}, {-20.0, -112.0}, {-20.0, -60.0}, {-192.0, -60.0}, {-192.0, -4.0}, {-122.0, -4.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.food_pc, Life_Expectancy1.food_pc) annotation(
          Line(points = {{-96.0, -98.0}, {-96.0, -74.0}, {256.0, -74.0}, {256.0, -28.0}, {318.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.marg_prod_agr_inp, Arable_Land_Dynamics1.marg_prod_agr_inp) annotation(
          Line(points = {{-78.0, -120.0}, {-24.0, -120.0}, {-24.0, -64.0}, {-172.0, -64.0}, {-172.0, -12.0}, {-122.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.agr_inp_per_hect, Pollution_Dynamics1.agr_inp_per_hect) annotation(
          Line(points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -56.0}, {-196.0, -56.0}, {-196.0, 72.0}, {-122.0, 72.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.agr_inp_per_hect, Labor_Utilization1.agr_inp_per_hect) annotation(
          Line(points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -28.0}, {98.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.s_fioa_agr, Industrial_Investment1.s_fioa_agr) annotation(
          Line(points = {{-78.0, -136.0}, {-4.0, -136.0}, {-4.0, 64.0}, {98.0, 64.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.service_capital, Labor_Utilization1.service_capital) annotation(
          Line(points = {{-78.0, -220.0}, {4.0, -220.0}, {4.0, -4.0}, {98.0, -4.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.p_fr_inp_for_land_maint, Land_Fertility1.p_fr_inp_for_land_maint) annotation(
          Line(points = {{-88.0, -142.0}, {-88.0, -160.0}, {44.0, -160.0}, {44.0, -120.0}, {98.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.s_fioa_serv, Industrial_Investment1.s_fioa_serv) annotation(
          Line(points = {{-78.0, -230.0}, {16.0, -230.0}, {16.0, 38.0}, {108.0, 38.0}, {108.0, 58.0}}, color = {0, 0, 191}, visible = true));
        connect(Population_Dynamics1.labor_force, Labor_Utilization1.labor_force) annotation(
          Line(points = {{-78.0, 170.0}, {12.0, 170.0}, {12.0, -60.0}, {108.0, -60.0}, {108.0, -42.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.total_fertility, Population_Dynamics1.total_fertility) annotation(
          Line(points = {{142.0, 180.0}, {196.0, 180.0}, {196.0, 144.0}, {-200.0, 144.0}, {-200.0, 190.0}, {-122.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_capital, Labor_Utilization1.industrial_capital) annotation(
          Line(points = {{142.0, 76.0}, {196.0, 76.0}, {196.0, -78.0}, {44.0, -78.0}, {44.0, -20.0}, {98.0, -20.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.land_fertility, Food_Production1.land_fertility) annotation(
          Line(points = {{142.0, -120.0}, {192.0, -120.0}, {192.0, -164.0}, {-112.0, -164.0}, {-112.0, -142.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.life_expectancy, Human_Welfare_Index1.life_expectancy) annotation(
          Line(points = {{362.0, -20.0}, {420.0, -20.0}, {420.0, 40.0}, {250.0, 40.0}, {250.0, 90.0}, {318.0, 90.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Welfare_Index1.life_expectancy, Human_Fertility1.life_expectancy) annotation(
          Line(points = {{318.0, 90.0}, {250.0, 90.0}, {250.0, 128.0}, {32.0, 128.0}, {32.0, 180.0}, {98.0, 180.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.life_expectancy, Population_Dynamics1.life_expectancy) annotation(
          Line(points = {{98.0, 180.0}, {32.0, 180.0}, {32.0, 128.0}, {-190.0, 128.0}, {-190.0, 170.0}, {-122.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(NR_Resource_Utilization1.pc_res_use_mlt, Pollution_Dynamics1.pc_res_use_mlt) annotation(
          Line(points = {{362.0, -108.0}, {424.0, -108.0}, {424.0, 124.0}, {-176.0, 124.0}, {-176.0, 96.0}, {-122.0, 96.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.yield_tech_LYTD, Food_Production1.yield_tech_LYTD) annotation(
          Line(points = {{142.0, -110.0}, {192.0, -110.0}, {192.0, -82.0}, {-112.0, -82.0}, {-112.0, -90.0}, {-112.0, -98.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.fr_inp_al_land_dev, Food_Production1.fr_inp_al_land_dev) annotation(
          Line(points = {{-78.0, -10.0}, {-28.0, -10.0}, {-28.0, -68.0}, {-172.0, -68.0}, {-172.0, -120.0}, {-122.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.s_yield_mlt_air_poll, Food_Production1.s_yield_mlt_air_poll) annotation(
          Line(points = {{-78.0, 72.0}, {32.0, 72.0}, {32.0, -168.0}, {-104.0, -168.0}, {-104.0, -142.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.capital_util_fr, Service_Sector_Investment1.capital_util_fr) annotation(
          Line(points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {-172.0, -180.0}, {-172.0, -208.0}, {-122.0, -208.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_tech_mult_icor_COPM, Industrial_Investment1.ppoll_tech_mult_icor_COPM) annotation(
          Line(points = {{-88.0, 0.0}, {88.0, 0.0}}, color = {0, 0, 191}, visible = true, origin = {10.0, 88.0}));
        connect(NR_Resource_Utilization1.ind_cap_out_ratio_2_ICOR2T, Industrial_Investment1.ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(points = {{362.0, -124.0}, {428.0, -124.0}, {428.0, 120.0}, {108.0, 120.0}, {108.0, 102.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.capital_util_fr, Industrial_Investment1.capital_util_fr) annotation(
          Line(points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {24.0, -180.0}, {24.0, 80.0}, {98.0, 80.0}}, color = {0, 0, 191}, visible = true));
        connect(NR_Resource_Utilization1.s_fr_cap_al_obt_res, Industrial_Investment1.s_fr_cap_al_obt_res) annotation(
          Line(points = {{362.0, -132.0}, {432.0, -132.0}, {432.0, 132.0}, {44.0, 132.0}, {44.0, 72.0}, {98.0, 72.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_gen_rt, Human_Ecological_Footprint1.ppoll_gen_rt) annotation(
          Line(points = {{-78.0, 64.0}, {-20.0, 64.0}, {-20.0, 148.0}, {256.0, 148.0}, {256.0, 170.0}, {318.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.urban_ind_land, Human_Ecological_Footprint1.urban_ind_land) annotation(
          Line(points = {{-78.0, -30.0}, {-24.0, -30.0}, {-24.0, 136.0}, {252.0, 136.0}, {252.0, 180.0}, {318.0, 180.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.yield_tech_mult_icor_COYM, Industrial_Investment1.yield_tech_mult_icor_COYM) annotation(
          Line(points = {{-96.0, -142.0}, {-96.0, -174.0}, {28.0, -174.0}, {28.0, 96.0}, {98.0, 96.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.tot_agric_invest, Arable_Land_Dynamics1.tot_agric_invest) annotation(
          Line(points = {{-88.0, -98.0}, {-88.0, -52.0}, {-200.0, -52.0}, {-200.0, -20.0}, {-122.0, -20.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-222.0, -262.0}, {440.0, 220.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-64.0, 40.0}, {292.0, 114.0}}, textString = "Influencing the", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-78.0, -32.0}, {308.0, 34.0}}, textString = "Future", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-72.0, -124.0}, {294.0, -26.0}}, textString = "10 Years Later", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})),
          experiment(StartTime = 1900, StopTime = 2500),
          experimentSetupOutput,
          Documentation(info = "<html>
This is <font color=red><b>Scenario #11</b></font> of the <font color=red><b>WORLD3</b></font> model. This scenario starts out with the same assumptions as <font color=red><b>Scenario #10</b></font>. <p>
 
We now want to check what would have happened, had we started controlling our resources 10 years later. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.L., W.W. Behrens III, D.M., Meadows, R.F. Naill, J. Randers, and E.K.O. Zahn (1974), <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>, Wright-Allen Press, 637p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
 
In order to accomplish this change, we need to reset all of the switching times in the model: <p>
<font color=red>parameter Real t_fcaor_time(unit=\"yr\") = <b>2012</b> \"Year of capital allocation to resource use efficiency\";</font>. <p>
<font color=red>parameter Real t_fert_cont_eff_time(unit=\"yr\") = <b>2012</b> \"Year of continued fertility change\";</font>. <p>
<font color=red>parameter Real t_ind_equil_time(unit=\"yr\") = <b>2012</b> \"Year of industrial equilibrium\";</font>. <p>
<font color=red>parameter Real t_land_life_time(unit=\"yr\") = <b>2012</b> \"Land life time\";</font>. <p>
<font color=red>parameter Real t_policy_year(unit=\"yr\") = <b>2012</b> \"Year of policy change\";</font>. <p>
<font color=red>parameter Real t_zero_pop_grow_time(unit=\"yr\") = <b>2012</b> \"Time to zero population growth\";</font>. <p>
 
<hr> <p>
 
Simulate the model from 1900 until 2500, and display the same variables as in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> at page 245: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_37.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_38.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_39.png\"> <p>
 
<hr> <p>
 
The maximal population will be larger.  The attainable living standard will be approximately equal.  It is still not too late to do something.  Yet, the golden age will end quite a bit sooner. <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_11;

      package Utilities "Utility models of Meadows' WORLD3 model"
        extends Modelica.Icons.Library;

        block Agr_Inp_Per_Hect "Agricultural input per hectare"
          extends Interfaces.Nonlin_3;
          output Real p_fr_inp_for_land_maint "Fraction of agricultural investiment allocated to land maintenance";
          output Real arable_land(unit = "hectare") "Total arable land";
          output Real agr_inp(unit = "dollar/yr") "Agricultural input";
          output Real agr_inp_per_hect(unit = "dollar/(hectare.yr)") "Agricultural input per hectare";
        equation
          p_fr_inp_for_land_maint = u1;
          arable_land = u2;
          agr_inp = u3;
          agr_inp_per_hect = agr_inp * (1 - p_fr_inp_for_land_maint) / arable_land;
          y = agr_inp_per_hect;
          annotation(
            Diagram,
            Documentation(info = "<html>
This function is described on p.294 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Agr_Inp_Per_Hect;

        block BD_Rates "Birth and death rates"
          extends Interfaces.Nonlin_2;
          output Real bd(unit = "1/yr") "Total annual births or deaths";
          output Real pop "Total population";
          output Real bd_rate(unit = "1/yr") "Total annual birth or death rate";
        equation
          bd = u1;
          pop = u2;
          bd_rate = 1000 * bd / pop;
          y = bd_rate;
          annotation(
            Documentation(info = "<html>
This function is described on p.140 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end BD_Rates;

        block Birth_Factors "Birth factors of WORLD3 model"
          extends Interfaces.Nonlin_3;
          parameter Real Repro_Life(unit = "yr") = 30 "Reproductive lifetime";
          parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
          output Real tot_fert "Total fertility";
          output Real deaths "Total deaths";
          output Real pop_15_44 "Population between the ages of 15 and 44";
          output Real births "Total births";
        equation
          tot_fert = u1;
          deaths = u2;
          pop_15_44 = u3;
          births = if time > t_pop_equil_time then deaths else 0.5 * tot_fert * pop_15_44 / Repro_Life;
          y = births;
          annotation(
            Documentation(info = "<html>
This function is described on p.96 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Birth_Factors;

        block Ch_Agr_Inp "Change in agricultural input"
          extends Interfaces.Nonlin_3;
          output Real current_agr_inp(unit = "dollar/yr") "Current agricultural input";
          output Real s_avg_life_agr_inp(unit = "yr") "Average life of agricultural input";
          output Real agr_inp(unit = "dollar/yr") "Agricultural input";
          output Real chg_agr_inp(unit = "dollar/yr2") "Change in agricultural input";
        equation
          current_agr_inp = u1;
          s_avg_life_agr_inp = u2;
          agr_inp = u3;
          chg_agr_inp = (current_agr_inp - agr_inp) / s_avg_life_agr_inp;
          y = chg_agr_inp;
          annotation(
            Documentation(info = "<html>
This function is described on p.292 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Ch_Agr_Inp;

        block Ch_Lab_Util_Fr_Del "Change in delayed labor utilization fraction"
          extends Interfaces.Nonlin_2;
          parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
          output Real labor_util_fr "Labor utilization fraction";
          output Real labor_util_fr_del "Delayed labor utilization fraction";
          output Real chg_lab_util_fr_del(unit = "1/yr") "Change in delayed labor utilization fraction";
        equation
          labor_util_fr = u1;
          labor_util_fr_del = u2;
          chg_lab_util_fr_del = (labor_util_fr - labor_util_fr_del) / labor_util_fr_del_time;
          y = chg_lab_util_fr_del;
          annotation(
            Documentation(info = "<html>
This function is described on p.241 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Ch_Lab_Util_Fr_Del;

        block Ch_Perc_Food_Ratio "Change in perceived food ratio"
          extends Interfaces.Nonlin_2;
          parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
          output Real food_ratio "Food ratio";
          output Real perc_food_ratio "Perceived food ratio";
          output Real chg_perc_food_ratio(unit = "1/yr") "Change in perceived food ratio";
        equation
          food_ratio = u1;
          perc_food_ratio = u2;
          chg_perc_food_ratio = (food_ratio - perc_food_ratio) / food_short_perc_del;
          y = chg_perc_food_ratio;
          annotation(
            Documentation(info = "<html>
This function is described on p.333 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Ch_Perc_Food_Ratio;

        block Current_Agr_Inp "Current agricultural input"
          extends Interfaces.Nonlin_2;
          output Real fr_inp_al_land_dev "Fraction of agricultural input allocated to land development";
          output Real tot_agric_invest(unit = "dollar/yr") "Total agricultural investment";
          output Real current_agr_inp(unit = "dollar/yr") "Current agricultural input";
        equation
          fr_inp_al_land_dev = u1;
          tot_agric_invest = u2;
          current_agr_inp = tot_agric_invest * (1 - fr_inp_al_land_dev);
          y = current_agr_inp;
          annotation(
            Documentation(info = "<html>
This function is described on p.292 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Current_Agr_Inp;

        block Death_Factors "Number of people dying from a given group"
          extends Interfaces.Nonlin_2;
          output Real pop "Population of previous group";
          output Real mort(unit = "1/yr") "Mortality rate of people in previous group";
          output Real deaths(unit = "1/yr") "Number of people dying per year";
        equation
          pop = u1;
          mort = u2;
          deaths = pop * mort;
          y = deaths;
          annotation(
            Documentation(info = "<html>
This function is described on p.57 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Death_Factors;

        block Des_Compl_Fam_Size "Desired complete family size"
          extends Interfaces.Nonlin_2;
          parameter Real t_zero_pop_grow_time(unit = "yr") = 4000 "Time to zero population growth";
          parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
          output Real soc_fam_size_norm "Social family size norm";
          output Real fam_resp_to_soc_norm "Family response to social norm";
          output Real des_compl_fam_size "Desired complete family size";
        equation
          soc_fam_size_norm = u1;
          fam_resp_to_soc_norm = u2;
          des_compl_fam_size = if time > t_zero_pop_grow_time then 2.0 else des_compl_fam_size_norm * fam_resp_to_soc_norm * soc_fam_size_norm;
          y = des_compl_fam_size;
          annotation(
            Documentation(info = "<html>
This function is described on p.113 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Des_Compl_Fam_Size;

        block Fam_Income_Expect "Expected family income"
          extends Interfaces.Nonlin_2;
          output Real ind_out_pc(unit = "dollar/yr") "Per capita industrial output";
          output Real avg_ind_out_pc(unit = "dollar/yr") "Average per capita industrial output";
          output Real fam_income_expect "Expected family income fraction";
        equation
          ind_out_pc = u1;
          avg_ind_out_pc = u2;
          fam_income_expect = max({-0.2, min({0.2, (ind_out_pc - avg_ind_out_pc) / avg_ind_out_pc})});
          y = fam_income_expect;
          annotation(
            Documentation(info = "<html>
This function is described on p.122 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Fam_Income_Expect;

        block Fert_Cont_Eff "Effective fertility continuation"
          extends Interfaces.Nonlin_1;
          parameter Real t_fert_cont_eff_time(unit = "yr") = 4000 "Year of continued fertility change";
          output Real fert_cont_eff_table "Effective fertility continuation table";
          output Real fert_cont_eff "Effective fertility continuation";
        equation
          fert_cont_eff_table = u;
          fert_cont_eff = if time > t_fert_cont_eff_time then 1.0 else fert_cont_eff_table;
          y = fert_cont_eff;
          annotation(
            Documentation(info = "<html>
This function is described on p.133 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Fert_Cont_Eff;

        block FIOA_Ind "Fraction of industrial output allocated to industry"
          extends Interfaces.Nonlin_3;
          output Real s_fioa_agr "Fraction of industrial output allocated to agriculture";
          output Real s_fioa_serv "Fraction of industrial output allocated to the service sector";
          output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
          output Real fioa_ind "Fraction of industrial output allocated to industry";
        equation
          s_fioa_agr = u1;
          s_fioa_serv = u2;
          s_fioa_cons = u3;
          fioa_ind = 1 - s_fioa_agr - s_fioa_serv - s_fioa_cons;
          y = fioa_ind;
          annotation(
            Documentation(info = "<html>
This function is described on p.223 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end FIOA_Ind;

        block Food "Total produced food"
          extends Interfaces.Nonlin_2;
          parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
          parameter Real processing_loss = 0.1 "Processing loss";
          output Real land_yield(unit = "kg/(hectare.yr)") "Land yield";
          output Real arable_land(unit = "hectare") "Total arable land";
          output Real food(unit = "kg/yr") "Total produced food";
        equation
          land_yield = u1;
          arable_land = u2;
          food = land_yield * arable_land * land_fr_harvested * (1.0 - processing_loss);
          y = food;
          annotation(
            Documentation(info = "<html>
This function is described on p.280 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Food;

        block GDP_Index "Gross domestic product index"
          extends Interfaces.Nonlin_1;
          output Real gdp_per_capita(unit = "dollar/yr") "Per capita gross domestic product";
          output Real gdp_index "Gross domestic product index";
        equation
          gdp_per_capita = u;
          gdp_index = (Modelica.Math.log10(gdp_per_capita) - Modelica.Math.log10(24.0)) / (Modelica.Math.log10(9508.0) - Modelica.Math.log10(24.0));
          y = gdp_index;
        end GDP_Index;

        block HEF_Human_Ecological_Footprint "Human ecological footprint"
          extends Interfaces.Nonlin_3;
          output Real arable_land_in_Gha(unit = "Gha") "Arable land in Gigahectare";
          output Real urban_land_in_Gha(unit = "Gha") "Urban land in Gigahectare";
          output Real absorption_land_in_Gha(unit = "Gha") "Absorption land in Gigahectare";
          output Real hef_human_ecological_footprint(unit = "hectare") "Human ecological footprint";
        equation
          arable_land_in_Gha = u1;
          urban_land_in_Gha = u2;
          absorption_land_in_Gha = u3;
          hef_human_ecological_footprint = (arable_land_in_Gha + urban_land_in_Gha + absorption_land_in_Gha) / 1.91;
          y = hef_human_ecological_footprint;
        end HEF_Human_Ecological_Footprint;

        block HWI_Human_Welfare_Index "Human welfare index"
          extends Interfaces.Nonlin_3;
          output Real life_expectancy_index "Life expectancy index";
          output Real education_index "Education index";
          output Real gdp_index "Gross domestic product index";
          output Real hwi_human_welfare_index "Human welfare index";
        equation
          life_expectancy_index = u1;
          education_index = u2;
          gdp_index = u3;
          hwi_human_welfare_index = (life_expectancy_index + education_index + gdp_index) / 3;
          y = hwi_human_welfare_index;
        end HWI_Human_Welfare_Index;

        block Industrial_Output "Industrial output"
          extends Interfaces.Nonlin_4;
          output Real s_fr_cap_al_obt_res "Fraction of capital allocated to obtaining resources";
          output Real capital_util_fr "Capital utilization fraction";
          output Real s_ind_cap_out_ratio(unit = "yr") "Industrial capital output ratio";
          output Real industrial_capital(unit = "dollar") "Capital invested in industry";
          output Real industrial_output(unit = "dollar/yr") "Industrial output";
        equation
          s_fr_cap_al_obt_res = u1;
          capital_util_fr = u2;
          s_ind_cap_out_ratio = u3;
          industrial_capital = u4;
          industrial_output = industrial_capital * (1 - s_fr_cap_al_obt_res) * capital_util_fr / s_ind_cap_out_ratio;
          y = industrial_output;
          annotation(
            Documentation(info = "<html>
This function is described on p.216 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Industrial_Output;

        block Land_Devel_Rt "Land development rate"
          extends Interfaces.Nonlin_3;
          output Real dev_cost_per_hect(unit = "dollar/hectare") "Development cost per hectare";
          output Real fr_inp_al_land_dev "Percentage of land available for development";
          output Real tot_agric_invest(unit = "dollar/yr") "Total agricultural investment";
          output Real land_devel_rt(unit = "hectare/yr") "Land development rate";
        equation
          dev_cost_per_hect = u1;
          fr_inp_al_land_dev = u2;
          tot_agric_invest = u3;
          land_devel_rt = tot_agric_invest * fr_inp_al_land_dev / dev_cost_per_hect;
          y = land_devel_rt;
          annotation(
            Documentation(info = "<html>
This function is described on p.289 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Land_Devel_Rt;

        block Land_Fert_Reg "Land fertility regeneration"
          extends Interfaces.Nonlin_2;
          parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
          output Real land_fert_regen_time(unit = "yr") "Land fertility regeneration time";
          output Real land_fertility(unit = "kg/(hectare.yr)") "Land fertility";
          output Real land_fert_regen(unit = "kg/(hectare.yr2)") "Land fertility regeneration";
        equation
          land_fert_regen_time = u1;
          land_fertility = u2;
          land_fert_regen = (inherent_land_fert - land_fertility) / land_fert_regen_time;
          y = land_fert_regen;
          annotation(
            Documentation(info = "<html>
This function is described on p.328 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Land_Fert_Reg;

        block Land_Rem_Urb_Ind_Use "Land removal for urban/industrial use"
          extends Interfaces.Nonlin_2;
          parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
          output Real urb_ind_land_req(unit = "hectare") "Required urban and industrial land";
          output Real urban_ind_land(unit = "hectare") "Urban and industrial land";
          output Real land_rem_urb_ind_use(unit = "hectare/yr") "Land removal for urban/industrial use";
        equation
          urb_ind_land_req = u1;
          urban_ind_land = u2;
          land_rem_urb_ind_use = (urb_ind_land_req - urban_ind_land) / urb_ind_land_dev_time;
          y = land_rem_urb_ind_use;
          annotation(
            Documentation(info = "<html>
This function is described on p.322 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Land_Rem_Urb_Ind_Use;

        block Lifet_Mlt_Crowd "Life expectancy multiplier due to crowding"
          extends Interfaces.Nonlin_2;
          output Real crowd_mult_ind "Crowding multiplier index";
          output Real fr_pop_urban "Fraction of urban population";
          output Real lifet_mlt_crowd "Life expectancy multiplier due to crowding";
        equation
          crowd_mult_ind = u1;
          fr_pop_urban = u2;
          lifet_mlt_crowd = 1 - crowd_mult_ind * fr_pop_urban;
          y = lifet_mlt_crowd;
          annotation(
            Documentation(info = "<html>
This function is described on p.90 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Lifet_Mlt_Crowd;

        block Lifet_Mult_Hlth_Serv "Life expectancy multiplier due to health services"
          extends Interfaces.Nonlin_2;
          output Real lifet_mlt_hlth_serv_1 "Original life expectancy multiplier due to health services";
          output Real lifet_mlt_hlth_serv_2 "Improved life expectancy multiplier due to health services";
          output Real lifet_mult_hlth_serv "Life expectancy multiplier due to health services";
        equation
          lifet_mlt_hlth_serv_1 = u1;
          lifet_mlt_hlth_serv_2 = u2;
          lifet_mult_hlth_serv = if time > 1940 then lifet_mlt_hlth_serv_2 else lifet_mlt_hlth_serv_1;
          y = lifet_mult_hlth_serv;
          annotation(
            Documentation(info = "<html>
This function is described on p.76 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Lifet_Mult_Hlth_Serv;

        block Marg_Prod_Agr_Inp "Agricultural input for marginally producing land"
          extends Interfaces.Nonlin_4;
          output Real land_yield(unit = "kg/(hectare.yr)") "Total land yield";
          output Real land_yield_mlt_cap "Land yield multiplier from capital";
          output Real marg_land_yield_mlt_cap(unit = "hectare/dollar") "Marginal land yield multiplier from capital";
          output Real s_avg_life_agr_inp(unit = "yr") "Average life of agricultural input";
          output Real marg_prod_agr_inp(unit = "kg/dollar") "Marginal productivity of agricultural inputs";
        equation
          land_yield = u1;
          land_yield_mlt_cap = u2;
          marg_land_yield_mlt_cap = u3;
          s_avg_life_agr_inp = u4;
          marg_prod_agr_inp = s_avg_life_agr_inp * land_yield * marg_land_yield_mlt_cap / land_yield_mlt_cap;
          y = marg_prod_agr_inp;
          annotation(
            Documentation(info = "<html>
This function is described on p.313 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Marg_Prod_Agr_Inp;

        block Marg_Prod_Land_Dev "Development of marginally producing land"
          extends Interfaces.Nonlin_2;
          parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
          output Real land_yield(unit = "kg/(hectare.yr)") "Land yield";
          output Real dev_cost_per_hect(unit = "dollar/hectare") "Development cost per hectare";
          output Real marg_prod_land_dev(unit = "kg/dollar") "Marginal productivity of land development";
        equation
          land_yield = u1;
          dev_cost_per_hect = u2;
          marg_prod_land_dev = land_yield / (dev_cost_per_hect * social_discount);
          y = marg_prod_land_dev;
          annotation(
            Documentation(info = "<html>
This function is described on p.312 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Marg_Prod_Land_Dev;

        block Matur_Factors "Number of people switching groups"
          extends Interfaces.Nonlin_2;
          parameter Real bracket(unit = "yr") = 1 "Time bracket of previous group";
          output Real pop "Population of previous group";
          output Real mort "Mortality rate of people in previous group";
          output Real matur(unit = "1/yr") "Number of people switching groups";
        equation
          pop = u1;
          mort = u2;
          matur = pop * (1 - mort) / bracket;
          y = matur;
          annotation(
            Documentation(info = "<html>
This function is described on p.141 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Matur_Factors;

        block Need_For_Fert_Cont "Need for fertility continuation"
          extends Interfaces.Nonlin_2;
          output Real max_tot_fert "Maximal total fertility";
          output Real des_tot_fert "Desired total fertility";
          output Real need_for_fert_cont "Need for fertility continuation";
        equation
          max_tot_fert = u1;
          des_tot_fert = u2;
          need_for_fert_cont = max({0, min({10, max_tot_fert / des_tot_fert - 1.0})});
          y = need_for_fert_cont;
          annotation(
            Documentation(info = "<html>
This function is described on p.131 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Need_For_Fert_Cont;

        block P_PPoll_Tech_Chg "Percentage of effective pollution technology change"
          extends Interfaces.Nonlin_1;
          parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
          output Real ppoll_index "Persistent pollution index";
          output Real p_ppoll_tech_chg "Percentage of effective pollution technology change";
        equation
          ppoll_index = u;
          p_ppoll_tech_chg = 1 - ppoll_index / des_ppoll_index_DPOLX;
          y = p_ppoll_tech_chg;
        end P_PPoll_Tech_Chg;

        block P_Res_Tech_Chg "Percentage of effective resource technology change"
          extends Interfaces.Nonlin_1;
          parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
          output Real nr_res_use_rate(unit = "ton/yr") "Non-recoverable resource utilization rate";
          output Real p_res_tech_chg "Percentage of effective resource technology change";
        equation
          nr_res_use_rate = u;
          p_res_tech_chg = 1 - nr_res_use_rate / des_res_use_rt_DNRUR;
          y = p_res_tech_chg;
        end P_Res_Tech_Chg;

        block Poll_Intens_Ind "Pollution intensity index"
          extends Interfaces.Nonlin_3;
          output Real industrial_output(unit = "dollar/yr") "Industrial output";
          output Real ppoll_gen_ind(unit = "1/yr") "Persistent pollution index";
          output Real s_ppoll_gen_fact "Pollution generation factor";
          output Real poll_intens_ind(unit = "1/dollar") "Pollution intensity index";
        equation
          industrial_output = u1;
          ppoll_gen_ind = u2;
          s_ppoll_gen_fact = u3;
          poll_intens_ind = ppoll_gen_ind * s_ppoll_gen_fact / industrial_output;
          y = poll_intens_ind;
        end Poll_Intens_Ind;

        block PPoll_Assim_Rt "Persistent pollution assimilation rate"
          extends Interfaces.Nonlin_2;
          output Real pers_pollution "Persistent pollution";
          output Real assim_half_life(unit = "yr") "Persistent pollution assimilation half-life";
          output Real ppoll_assim_rt(unit = "1/yr") "Persistent pollution assimilation rate";
        equation
          pers_pollution = u1;
          assim_half_life = u2;
          ppoll_assim_rt = pers_pollution / (1.4 * assim_half_life);
          y = ppoll_assim_rt;
          annotation(
            Documentation(info = "<html>
This function is described on p.442 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end PPoll_Assim_Rt;

        block PPoll_Gen_Agr "Persistent pollution generated by agricultural output"
          extends Interfaces.Nonlin_2;
          parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
          parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
          output Real agr_inp_per_hect(unit = "dollar/(hectare.yr)") "Agricultural input per hectare";
          output Real arable_land(unit = "hectare") "Total arable land";
          output Real ppoll_gen_agr(unit = "1/yr") "Persistent pollution generated by agricultural output";
        equation
          agr_inp_per_hect = u1;
          arable_land = u2;
          ppoll_gen_agr = agr_inp_per_hect * arable_land * fr_agr_inp_pers_mtl * agr_mtl_toxic_index;
          y = ppoll_gen_agr;
          annotation(
            Documentation(info = "<html>
This function is described on p.433 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end PPoll_Gen_Agr;

        block PPoll_Gen_Ind "Persistent pollution generated by industrial output"
          extends Interfaces.Nonlin_2;
          parameter Real frac_res_pers_mtl = 0.02 "Fraction of resources as persistent materials";
          parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
          parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
          output Real pc_res_use_mlt(unit = "ton/yr") "Per capita resource utilization multiplier";
          output Real population "Total population";
          output Real ppoll_gen_ind(unit = "1/yr") "Persistent pollution generated by industrial output";
        equation
          pc_res_use_mlt = u1;
          population = u2;
          ppoll_gen_ind = pc_res_use_mlt * population * frac_res_pers_mtl * ind_mtl_emiss_fact * ind_mtl_toxic_index;
          y = ppoll_gen_ind;
          annotation(
            Documentation(info = "<html>
This function is described on p.429 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end PPoll_Gen_Ind;

        block PPoll_Gen_Rt "Persistent pollution generation rate"
          extends Interfaces.Nonlin_3;
          output Real s_ppoll_gen_fact "Percentage of effective persistent pollution generation";
          output Real ppoll_gen_ind(unit = "1/yr") "Persistent pollution generation from industry";
          output Real ppoll_gen_agr(unit = "1/yr") "Persistent pollution generation from agriculture";
          output Real ppoll_gen_rt(unit = "1/yr") "Persistent pollution generation rate";
        equation
          s_ppoll_gen_fact = u1;
          ppoll_gen_ind = u2;
          ppoll_gen_agr = u3;
          ppoll_gen_rt = (ppoll_gen_ind + ppoll_gen_agr) * s_ppoll_gen_fact;
          y = ppoll_gen_rt;
          annotation(
            Documentation(info = "<html>
This function is described on p.428 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end PPoll_Gen_Rt;

        block PPoll_Tech_Chg_Rt "Persistent pollution technology change rate"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_ppoll_tech_chg_mlt_POLGFM "Percentage of effective technology change on pollution generation";
          output Real ppoll_tech_PTD(unit = "1/yr") "Persistent pollution technology change factor";
          output Real ppoll_tech_chg_rt(unit = "1/yr") "Persistent pollution technology change rate";
        equation
          p_ppoll_tech_chg_mlt_POLGFM = u1;
          ppoll_tech_PTD = u2;
          ppoll_tech_chg_rt = if time > t_policy_year then p_ppoll_tech_chg_mlt_POLGFM * ppoll_tech_PTD else 0;
          y = ppoll_tech_chg_rt;
        end PPoll_Tech_Chg_Rt;

        block Res_Tech_Ch_Rt_NRATE "Non-recoverable resource technology change rate"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_res_tech_chg_mlt_NRCM "Percentage of effective technology change";
          output Real res_tech_NRTD(unit = "1/yr") "Non-recoverable resource technology change factor";
          output Real res_tech_ch_rt_NRATE(unit = "1/yr") "Non-recoverable resource technology change rate";
        equation
          p_res_tech_chg_mlt_NRCM = u1;
          res_tech_NRTD = u2;
          res_tech_ch_rt_NRATE = if time > t_policy_year then p_res_tech_chg_mlt_NRCM * res_tech_NRTD else 0;
          y = res_tech_ch_rt_NRATE;
        end Res_Tech_Ch_Rt_NRATE;

        block S_Avg_Life_Agr_Inp "Average life of service sector capital"
          extends Interfaces.Nonlin_0;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
          parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2 "Controlled average life of agricultural input";
          output Real s_avg_life_agr_inp(unit = "yr") "Average life of agricultural input";
        equation
          s_avg_life_agr_inp = if time > t_policy_year then p_avg_life_agr_inp_2 else p_avg_life_agr_inp_1;
          y = s_avg_life_agr_inp;
          annotation(
            Documentation(info = "<html>
This function is described on p.293 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Avg_Life_Agr_Inp;

        block S_Avg_Life_Ind_Cap "Average life of industrial capital"
          extends Interfaces.Nonlin_0;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
          parameter Real p_avg_life_ind_cap_2(unit = "yr") = 14 "Controlled average life of industrial capital";
          output Real s_avg_life_ind_cap(unit = "yr") "Average life of industrial capital";
        equation
          s_avg_life_ind_cap = if time > t_policy_year then p_avg_life_ind_cap_2 else p_avg_life_ind_cap_1;
          y = s_avg_life_ind_cap;
          annotation(
            Documentation(info = "<html>
This function is described on p.221 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Avg_Life_Ind_Cap;

        block S_Avg_Life_Serv_Cap "Average life of service sector capital"
          extends Interfaces.Nonlin_0;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
          parameter Real p_avg_life_serv_cap_2(unit = "yr") = 20 "Controlled average life of service sector capital";
          output Real s_avg_life_serv_cap(unit = "yr") "Average life of service sector capital";
        equation
          s_avg_life_serv_cap = if time > t_policy_year then p_avg_life_serv_cap_2 else p_avg_life_serv_cap_1;
          y = s_avg_life_serv_cap;
          annotation(
            Documentation(info = "<html>
This function is described on p.231 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Avg_Life_Serv_Cap;

        block S_FIOA_Agr "Fraction of industrial output allocated to agricultural sector"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_fr_io_al_agr_1 "Default fraction of industrial output allocated to agricultural sector";
          output Real p_fr_io_al_agr_2 "Controlled fraction of industrial output allocated to agricultural sector";
          output Real s_fioa_agr "Fraction of industrial output allocated to agricultural sector";
        equation
          p_fr_io_al_agr_1 = u1;
          p_fr_io_al_agr_2 = u2;
          s_fioa_agr = if time > t_policy_year then p_fr_io_al_agr_2 else p_fr_io_al_agr_1;
          y = s_fioa_agr;
          annotation(
            Documentation(info = "<html>
This function is described on p.287 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_FIOA_Agr;

        block S_FIOA_Cons "Fraction of industrial output allocated to consumption"
          extends Interfaces.Nonlin_2;
          parameter Real t_ind_equil_time(unit = "yr") = 4000 "Year of industrial equilibrium";
          output Real s_fioa_cons_const "Original capital allocation to resource use efficiency";
          output Real p_fioa_cons_var "Modified capital allocation to resource use efficiency";
          output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        equation
          s_fioa_cons_const = u1;
          p_fioa_cons_var = u2;
          s_fioa_cons = if time > t_ind_equil_time then p_fioa_cons_var else s_fioa_cons_const;
          y = s_fioa_cons;
          annotation(
            Documentation(info = "<html>
This function is described on p.223 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_FIOA_Cons;

        block S_FIOA_Cons_Const "Fraction of industrial output allocated to consumption"
          extends Interfaces.Nonlin_0;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
          parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
          output Real s_fioa_cons_const "Fraction of industrial output allocated to consumption";
        equation
          s_fioa_cons_const = if time > t_policy_year then p_fioa_cons_const_2 else p_fioa_cons_const_1;
          y = s_fioa_cons_const;
          annotation(
            Documentation(info = "<html>
This function is described on p.223 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_FIOA_Cons_Const;

        block S_FIOA_Serv "Fraction of industrial output allocated to service sector"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_fr_io_al_serv_1 "Default fraction of industrial output allocated to service sector";
          output Real p_fr_io_al_serv_2 "Controlled fraction of industrial output allocated to service sector";
          output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        equation
          p_fr_io_al_serv_1 = u1;
          p_fr_io_al_serv_2 = u2;
          s_fioa_serv = if time > t_policy_year then p_fr_io_al_serv_2 else p_fr_io_al_serv_1;
          y = s_fioa_serv;
          annotation(
            Documentation(info = "<html>
This function is described on p.229 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_FIOA_Serv;

        block S_Fr_Cap_Al_Obt_Res "Fraction of capital allocated to resource use efficiency"
          extends Interfaces.Nonlin_2;
          parameter Real t_fcaor_time(unit = "yr") = 4000 "Year of capital allocation to resource use efficiency";
          output Real p_fr_cap_al_obt_res_1 "Original capital allocation to resource use efficiency";
          output Real p_fr_cap_al_obt_res_2 "Modified capital allocation to resource use efficiency";
          output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        equation
          p_fr_cap_al_obt_res_1 = u1;
          p_fr_cap_al_obt_res_2 = u2;
          s_fr_cap_al_obt_res = if time > t_fcaor_time then p_fr_cap_al_obt_res_2 else p_fr_cap_al_obt_res_1;
          y = s_fr_cap_al_obt_res;
          annotation(
            Documentation(info = "<html>
This function is described on p.393 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Fr_Cap_Al_Obt_Res;

        block S_Ind_Cap_Out_Ratio "Industrial capital output ratio"
          extends Interfaces.Nonlin_1;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
          output Real p_ind_cap_out_ratio_2(unit = "yr") "Controlled industrial capital output ratio";
          output Real s_ind_cap_out_ratio(unit = "yr") "Industrial capital output ratio";
        equation
          p_ind_cap_out_ratio_2 = u;
          s_ind_cap_out_ratio = if time > t_policy_year then p_ind_cap_out_ratio_2 else p_ind_cap_out_ratio_1;
          y = s_ind_cap_out_ratio;
          annotation(
            Documentation(info = "<html>
This function is described on p.216 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Ind_Cap_Out_Ratio;

        block S_Indic_Food_PC "Indicated food per capita"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_indic_food_pc_1(unit = "kg/yr") "Default indicated food per capita";
          output Real p_indic_food_pc_2(unit = "kg/yr") "Controlled indicated food per capita";
          output Real s_indic_food_pc(unit = "kg/yr") "Indicated food per capita";
        equation
          p_indic_food_pc_1 = u1;
          p_indic_food_pc_2 = u2;
          s_indic_food_pc = if time > t_policy_year then p_indic_food_pc_2 else p_indic_food_pc_1;
          y = s_indic_food_pc;
          annotation(
            Documentation(info = "<html>
This function is described on p.286 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Indic_Food_PC;

        block S_Indic_Serv_PC "Fraction of per capita indicated output allocated to service sector"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_indic_serv_pc_1(unit = "dollar/yr") "Default fraction of per capita indicated output allocated to service sector";
          output Real p_indic_serv_pc_2(unit = "dollar/yr") "Controlled fraction of per capita indicated output allocated to service sector";
          output Real s_indic_serv_pc(unit = "dollar/yr") "Fraction of per capita indicated output allocated to service sector";
        equation
          p_indic_serv_pc_1 = u1;
          p_indic_serv_pc_2 = u2;
          s_indic_serv_pc = if time > t_policy_year then p_indic_serv_pc_2 else p_indic_serv_pc_1;
          y = s_indic_serv_pc;
          annotation(
            Documentation(info = "<html>
This function is described on p.227 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Indic_Serv_PC;

        block S_Land_Life_Mlt_Yield "Land Life Yield Factor"
          extends Interfaces.Nonlin_2;
          constant Real time_unit(unit = "yr") = 1 "Unit conversion constant";
          parameter Real t_land_life_time(unit = "yr") = 4000 "Land life time";
          output Real p_land_life_mlt_yield_1 "Percentage of land with multiple yield - first model";
          output Real p_land_life_mlt_yield_2 "Percentage of land with multiple yield - second model";
          output Real s_land_life_mlt_yield "Land Life Yield Factor";
        protected
          Real k "Homotopy factor";
        equation
          p_land_life_mlt_yield_1 = u1;
          p_land_life_mlt_yield_2 = u2;
          if time > t_land_life_time then
            k = 0.95 ^ ((time - t_land_life_time) / time_unit);
          else
            k = 1;
          end if;
          s_land_life_mlt_yield = k * p_land_life_mlt_yield_1 + (1 - k) * p_land_life_mlt_yield_2;
          y = s_land_life_mlt_yield;
          annotation(
            Documentation(info = "<html>
This function is described on p.317 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Land_Life_Mlt_Yield;

        block S_Land_Yield_Fact "Land yield factor"
          extends Interfaces.Nonlin_1;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
          output Real p_land_yield_fact_2 "Controlled land yield factor";
          output Real s_land_yield_fact "Land yield factor";
        equation
          p_land_yield_fact_2 = u;
          s_land_yield_fact = if time > t_policy_year then p_land_yield_fact_2 else p_land_yield_fact_1;
          y = s_land_yield_fact;
          annotation(
            Documentation(info = "<html>
This function is described on p.307 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Land_Yield_Fact;

        block S_NR_Res_Use_Fact "Non-recoverable resource utilization factor"
          extends Interfaces.Nonlin_1;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
          output Real p_nr_res_use_fact_2 "Controlled non-recoverable resource utilization factor";
          output Real s_nr_res_use_fact "Non-recoverable resource utilization factor";
        equation
          p_nr_res_use_fact_2 = u;
          s_nr_res_use_fact = if time > t_policy_year then p_nr_res_use_fact_2 else p_nr_res_use_fact_1;
          y = s_nr_res_use_fact;
          annotation(
            Documentation(info = "<html>
This function is described on p.390 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_NR_Res_Use_Fact;

        block S_PPoll_Gen_Fact "Persistent pollution generation factor"
          extends Interfaces.Nonlin_1;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
          output Real p_ppoll_gen_fact_2 "Controlled persistent pollution generation factor";
          output Real s_ppoll_gen_fact "Persistent pollution generation factor";
        equation
          p_ppoll_gen_fact_2 = u;
          s_ppoll_gen_fact = if time > t_policy_year then p_ppoll_gen_fact_2 else p_ppoll_gen_fact_1;
          y = s_ppoll_gen_fact;
          annotation(
            Documentation(info = "<html>
This function is described on p.428 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_PPoll_Gen_Fact;

        block S_Serv_Cap_Out_Ratio "Service sector capital output ratio"
          extends Interfaces.Nonlin_0;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
          parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
          output Real s_serv_cap_out_ratio(unit = "yr") "Service sector capital output ratio";
        equation
          s_serv_cap_out_ratio = if time > t_policy_year then p_serv_cap_out_ratio_2 else p_serv_cap_out_ratio_1;
          y = s_serv_cap_out_ratio;
          annotation(
            Documentation(info = "<html>
This function is described on p.232 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Serv_Cap_Out_Ratio;

        block S_Yield_Mlt_Air_Poll "Air pollution factor on agricultural yield"
          extends Interfaces.Nonlin_2;
          parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
          output Real p_yield_mlt_air_poll_1 "Default air pollution factor on agricultural yield";
          output Real p_yield_mlt_air_poll_2 "Controlled air pollution factor on agricultural yield";
          output Real s_yield_mlt_air_poll "Air pollution factor on agricultural yield";
        equation
          p_yield_mlt_air_poll_1 = u1;
          p_yield_mlt_air_poll_2 = u2;
          s_yield_mlt_air_poll = if time > t_air_poll_time then p_yield_mlt_air_poll_2 else p_yield_mlt_air_poll_1;
          y = s_yield_mlt_air_poll;
          annotation(
            Documentation(info = "<html>
This function is described on p.310 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end S_Yield_Mlt_Air_Poll;

        block Service_Output "Service sector output"
          extends Interfaces.Nonlin_3;
          output Real capital_util_fr "Fraction of capacity utilization";
          output Real s_serv_cap_out_ratio(unit = "yr") "Service sector capital output ratio";
          output Real service_capital(unit = "dollar") "Capital invested in the service sector";
          output Real service_output(unit = "dollar/yr") "Service sector output";
        equation
          capital_util_fr = u1;
          s_serv_cap_out_ratio = u2;
          service_capital = u3;
          service_output = service_capital * capital_util_fr / s_serv_cap_out_ratio;
          y = service_output;
          annotation(
            Documentation(info = "<html>
This function is described on p.231 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Service_Output;

        block Total_Fertility "Total fertility"
          extends Interfaces.Nonlin_3;
          output Real fert_cont_eff "Fertility control effectiveness";
          output Real max_tot_fert "Maximum total fertility";
          output Real des_tot_fert "Desired total fertility";
          output Real total_fertility "Total fertility";
        equation
          fert_cont_eff = u1;
          max_tot_fert = u2;
          des_tot_fert = u3;
          total_fertility = min({max_tot_fert, fert_cont_eff * des_tot_fert + (1 - fert_cont_eff) * max_tot_fert});
          y = total_fertility;
          annotation(
            Documentation(info = "<html>
This function is described on p.97 of <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.
</html>"));
        end Total_Fertility;

        block Yield_Tech_Chg_Rt "Yield technology change rate"
          extends Interfaces.Nonlin_2;
          parameter Real t_policy_year(unit = "yr") = 4000 "Year of policy change";
          output Real p_yield_tech_chg_mlt_LYCM "Yield technology change factor";
          output Real yield_tech_LYTD "Yield technology";
          output Real yield_tech_chg_rt(unit = "1/yr") "Yield technology change rate";
        equation
          p_yield_tech_chg_mlt_LYCM = u1;
          yield_tech_LYTD = u2;
          yield_tech_chg_rt = if time > t_policy_year then p_yield_tech_chg_mlt_LYCM * yield_tech_LYTD else 0;
          y = yield_tech_chg_rt;
        end Yield_Tech_Chg_Rt;
        annotation(
          preferedView = "info",
          Documentation(info = "<html>
Utility models of Meadows' <font color=red><b>WORLD3</b></font> model.
</html>"));
      end Utilities;

      model Scenario_12 "Influencing the future 10 years later"
        parameter Real agr_mtl_toxic_index(unit = "1/dollar") = 1 "Agricultural materials toxicity index";
        parameter Real assim_half_life_1970(unit = "yr") = 1.5 "Pollution assimilation half life in 1970";
        parameter Real avg_life_land_norm(unit = "yr") = 1000 "Normal life span of land";
        parameter Real des_compl_fam_size_norm = 3.8 "Desired normal complete family size";
        parameter Real des_food_ratio_dfr = 2 "Desired food ratio";
        parameter Real des_ppoll_index_DPOLX = 1.2 "Desired persistent pollution index";
        parameter Real des_res_use_rt_DNRUR(unit = "ton/yr") = 4800000000.0 "Desired resource utilization rate";
        parameter Real food_short_perc_del(unit = "yr") = 2 "Food shortage perception delay";
        parameter Real fr_agr_inp_pers_mtl = 0.001 "Effective fraction of agricultural pollution input";
        parameter Real frac_res_pers_mtl = 0.02 "Effective fraction of resource utilization on pollution generation";
        parameter Real hlth_serv_impact_del(unit = "yr") = 20 "Health service impact delay";
        parameter Real income_expect_avg_time(unit = "yr") = 3 "Income expected average time";
        parameter Real ind_mtl_emiss_fact(unit = "1/ton") = 0.1 "Industrial materials emission factor";
        parameter Real ind_mtl_toxic_index = 10.0 "Industrial materials toxicity index";
        parameter Real ind_out_pc_des(unit = "dollar/yr") = 350 "Desired annual industrial per capita output";
        parameter Real ind_out_in_1970(unit = "dollar/yr") = 790000000000.0 "Industrial output in 1970";
        parameter Real inherent_land_fert(unit = "kg/(hectare.yr)") = 600 "Inherent land fertility";
        parameter Real labor_force_partic = 0.75 "Percentage of participating labor force";
        parameter Real labor_util_fr_del_time(unit = "yr") = 2 "Labor utilization fraction delay time";
        parameter Real land_fr_harvested = 0.7 "Land fraction harvested";
        parameter Real life_expect_norm(unit = "yr") = 28 "Normal life expectancy";
        parameter Real lifet_perc_del(unit = "yr") = 20 "Perceived life-time delay";
        parameter Real max_tot_fert_norm = 12 "Normal maximal total fertility";
        parameter Real p_avg_life_agr_inp_1(unit = "yr") = 2 "Default average life of agricultural input";
        parameter Real p_avg_life_agr_inp_2(unit = "yr") = 2.5 "Controlled average life of agricultural input";
        parameter Real p_avg_life_ind_cap_1(unit = "yr") = 14 "Default average life of industrial capital";
        parameter Real p_avg_life_ind_cap_2(unit = "yr") = 18 "Controlled average life of industrial capital";
        parameter Real p_avg_life_serv_cap_1(unit = "yr") = 20 "Default average life of service sector capital";
        parameter Real p_avg_life_serv_cap_2(unit = "yr") = 25 "Controlled average life of service sector capital";
        parameter Real p_fioa_cons_const_1 = 0.43 "Default fraction of industrial output allocated to consumption";
        parameter Real p_fioa_cons_const_2 = 0.43 "Controlled fraction of industrial output allocated to consumption";
        parameter Real p_ind_cap_out_ratio_1(unit = "yr") = 3 "Default industrial capital output ratio";
        parameter Real p_land_yield_fact_1 = 1 "Default land yield factor";
        parameter Real p_nr_res_use_fact_1 = 1 "Default non-recoverable resource utilization factor";
        parameter Real p_ppoll_gen_fact_1 = 1 "Default persistent pollution generation factor";
        parameter Real p_serv_cap_out_ratio_1(unit = "yr") = 1.0 "Default fraction of service sector output ratio";
        parameter Real p_serv_cap_out_ratio_2(unit = "yr") = 1.0 "Controlled fraction of service sector output ratio";
        parameter Real pot_arable_land_tot(unit = "hectare") = 3200000000.0 "Total potential arable land";
        parameter Real ppoll_in_1970 = 136000000.0 "Persistent pollution in 1970";
        parameter Real ppoll_trans_del(unit = "yr") = 20 "Persistent pollution transmission delay";
        parameter Real processing_loss = 0.1 "Processing loss";
        parameter Real reproductive_lifetime(unit = "yr") = 30.0 "Reproductive life time";
        parameter Real social_adj_del(unit = "yr") = 20 "Social adjustment delay";
        parameter Real social_discount(unit = "1/yr") = 0.07 "Social discount";
        parameter Real subsist_food_pc(unit = "kg/yr") = 230 "Available per capita food";
        parameter Real tech_dev_del_TDD(unit = "yr") = 20 "Technology development time";
        parameter Real urb_ind_land_dev_time(unit = "yr") = 10 "Urban and industrial land development time";
        parameter Real t_air_poll_time(unit = "yr") = 4000 "Air pollution change time";
        parameter Real t_fcaor_time(unit = "yr") = 2012 "Year of capital allocation to resource use efficiency";
        parameter Real t_fert_cont_eff_time(unit = "yr") = 2012 "Year of continued fertility change";
        parameter Real t_ind_equil_time(unit = "yr") = 2012 "Year of industrial equilibrium";
        parameter Real t_land_life_time(unit = "yr") = 2012 "Land life time";
        parameter Real t_policy_year(unit = "yr") = 2012 "Year of policy change";
        parameter Real t_pop_equil_time(unit = "yr") = 4000 "Population equilibrium time";
        parameter Real t_zero_pop_grow_time(unit = "yr") = 2012 "Time to zero population growth";
        parameter Real p_fr_cap_al_obt_res_2[:] = {1, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05} "Non-renewable resource fraction remaining";
        parameter Real p_ppoll_tech_chg_mlt[:] = {-0.04, -0.04, 0, 0} "Persistent pollution technology change multiplier";
        parameter Real p_res_tech_chg_mlt[:] = {-0.04, -0.04, 0, 0} "Resource technology change multiplier";
        parameter Real p_yield_tech_chg_mlt[:] = {0, 0, 0.04, 0.04} "Yield technology change multiplier";
        parameter Real agr_inp_init(unit = "dollar/yr") = 5000000000.0 "Initial agricultural input";
        parameter Real arable_land_init(unit = "hectare") = 900000000.0 "Initial arable land";
        parameter Real industrial_capital_init(unit = "dollar") = 210000000000.0 "Initial industrial investment";
        parameter Real labor_util_fr_del_init = 1 "Initial delayed labor utilization fraction";
        parameter Real land_fertility_init(unit = "kg/(hectare.yr)") = 600 "Initial industrial investment";
        parameter Real nr_resources_init(unit = "ton") = 2000000000000.0 "Initial available non-recoverable resources";
        parameter Real perc_food_ratio_init = 1 "Initial perceived food ratio";
        parameter Real pers_pollution_init = 25000000.0 "Initial persistent pollution";
        parameter Real pop1_init = 650000000.0 "Initial population 14 years and younger";
        parameter Real pop2_init = 700000000.0 "Initial population 15 to 44 years old";
        parameter Real pop3_init = 190000000.0 "Initial population 45 to 64 years old";
        parameter Real pop4_init = 60000000.0 "Initial population 65 years and older";
        parameter Real pot_arable_land_init(unit = "hectare") = 2300000000.0 "Initial potential arable land";
        parameter Real ppoll_tech_init = 1 "Initial persistent pollution technology change factor";
        parameter Real res_tech_init = 1 "Initial non-recoverable resource technology factor";
        parameter Real service_capital_init(unit = "dollar") = 144000000000.0 "Initial service sector investment";
        parameter Real urban_ind_land_init(unit = "hectare") = 8200000.0 "Initial urban and industrial land";
        parameter Real yield_tech_init = 1 "Initial yield technology factor";
        output Real population "Total human world population";
        output Real food(unit = "dollar/yr") "Total annually produced food";
        output Real industrial_output(unit = "dollar/yr") "Total annual world industrial output";
        output Real ppoll_index "Persistent pollution index";
        output Real nr_resources "Remaining non-recoverable natural resources";
        output Real fioa_ind "Fraction of industrial output allocated to industrial/military complex";
        output Real s_fioa_agr "Fraction of industrial output allocated to food production";
        output Real s_fioa_cons "Fraction of industrial output allocated to consumption";
        output Real s_fioa_serv "Fraction of industrial output allocated to service sector";
        output Real s_fr_cap_al_obt_res "Fraction of capital allocated to resource use efficiency";
        output Real life_expectancy(unit = "yr") "Life expectancy";
        output Real food_pc(unit = "dollar/yr") "Total annual food per person";
        output Real serv_out_pc(unit = "dollar/yr") "Total annual services per person";
        output Real ind_out_pc(unit = "dollar/yr") "Total annual consumer goods per person";
        output Real human_ecological_footprint(unit = "Gha") "Human ecological footprint";
        output Real human_welfare_index "Human welfare index";
        SystemDynamics.WorldDynamics.World3.Population_Dynamics Population_Dynamics1(pop1_init = pop1_init, pop2_init = pop2_init, pop3_init = pop3_init, pop4_init = pop4_init, labor_force_partic = labor_force_partic, reproductive_lifetime = reproductive_lifetime, t_pop_equil_time = t_pop_equil_time) "Population dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Pollution_Dynamics Pollution_Dynamics1(agr_mtl_toxic_index = agr_mtl_toxic_index, assim_half_life_1970 = assim_half_life_1970, des_ppoll_index_DPOLX = des_ppoll_index_DPOLX, fr_agr_inp_pers_mtl = fr_agr_inp_pers_mtl, frac_res_pers_mtl = frac_res_pers_mtl, ind_mtl_emiss_fact = ind_mtl_emiss_fact, ind_mtl_toxic_index = ind_mtl_toxic_index, ind_out_in_1970 = ind_out_in_1970, p_ppoll_gen_fact_1 = p_ppoll_gen_fact_1, pers_pollution_init = pers_pollution_init, ppoll_in_1970 = ppoll_in_1970, ppoll_tech_init = ppoll_tech_init, ppoll_trans_del = ppoll_trans_del, t_air_poll_time = t_air_poll_time, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, p_ppoll_tech_chg_mlt = p_ppoll_tech_chg_mlt) "Persistent pollution generation" annotation(
          Placement(visible = true, transformation(origin = {-100.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Arable_Land_Dynamics Arable_Land_Dynamics1(arable_land_init = arable_land_init, avg_life_land_norm = avg_life_land_norm, inherent_land_fert = inherent_land_fert, pot_arable_land_init = pot_arable_land_init, pot_arable_land_tot = pot_arable_land_tot, social_discount = social_discount, t_land_life_time = t_land_life_time, urban_ind_land_init = urban_ind_land_init, urb_ind_land_dev_time = urb_ind_land_dev_time) "Arable land dynamics" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Food_Production Food_Production1(agr_inp_init = agr_inp_init, food_short_perc_del = food_short_perc_del, p_avg_life_agr_inp_1 = p_avg_life_agr_inp_1, p_avg_life_agr_inp_2 = p_avg_life_agr_inp_2, p_land_yield_fact_1 = p_land_yield_fact_1, perc_food_ratio_init = perc_food_ratio_init, processing_loss = processing_loss, subsist_food_pc = subsist_food_pc, t_policy_year = t_policy_year, tech_dev_del_TDD = tech_dev_del_TDD, land_fr_harvested = land_fr_harvested) "Food production" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Ecological_Footprint Human_Ecological_Footprint1 "Human ecological footprint" annotation(
          Placement(visible = true, transformation(origin = {340.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Fertility Human_Fertility1(des_compl_fam_size_norm = des_compl_fam_size_norm, hlth_serv_impact_del = hlth_serv_impact_del, income_expect_avg_time = income_expect_avg_time, lifet_perc_del = lifet_perc_del, max_tot_fert_norm = max_tot_fert_norm, social_adj_del = social_adj_del, t_fert_cont_eff_time = t_fert_cont_eff_time, t_zero_pop_grow_time = t_zero_pop_grow_time) "Human fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, 180.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Human_Welfare_Index Human_Welfare_Index1 "Human welfare index" annotation(
          Placement(visible = true, transformation(origin = {340.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Industrial_Investment Industrial_Investment1(industrial_capital_init = industrial_capital_init, ind_out_pc_des = ind_out_pc_des, p_avg_life_ind_cap_1 = p_avg_life_ind_cap_1, p_avg_life_ind_cap_2 = p_avg_life_ind_cap_2, p_fioa_cons_const_1 = p_fioa_cons_const_1, p_fioa_cons_const_2 = p_fioa_cons_const_2, p_ind_cap_out_ratio_1 = p_ind_cap_out_ratio_1, t_ind_equil_time = t_ind_equil_time, t_policy_year = t_policy_year) "Industrial investment" annotation(
          Placement(visible = true, transformation(origin = {120.0, 80.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Labor_Utilization Labor_Utilization1(labor_util_fr_del_init = labor_util_fr_del_init, labor_util_fr_del_time = labor_util_fr_del_time) "Labor utilization" annotation(
          Placement(visible = true, transformation(origin = {120.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Land_Fertility Land_Fertility1(des_food_ratio_dfr = des_food_ratio_dfr, inherent_land_fert = inherent_land_fert, land_fertility_init = land_fertility_init, t_policy_year = t_policy_year, yield_tech_init = yield_tech_init, p_yield_tech_chg_mlt = p_yield_tech_chg_mlt) "Land fertility" annotation(
          Placement(visible = true, transformation(origin = {120.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Life_Expectancy Life_Expectancy1(hlth_serv_impact_del = hlth_serv_impact_del, life_expect_norm = life_expect_norm, subsist_food_pc = subsist_food_pc) "Life expectancy" annotation(
          Placement(visible = true, transformation(origin = {340.0, -20.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.NR_Resource_Utilization NR_Resource_Utilization1(des_res_use_rt_DNRUR = des_res_use_rt_DNRUR, nr_resources_init = nr_resources_init, p_nr_res_use_fact_1 = p_nr_res_use_fact_1, res_tech_init = res_tech_init, t_policy_year = t_policy_year, t_fcaor_time = t_fcaor_time, tech_dev_del_TDD = tech_dev_del_TDD, p_res_tech_chg_mlt = p_res_tech_chg_mlt, p_fr_cap_al_obt_res_2 = p_fr_cap_al_obt_res_2) "Non-recoverable natural resource utilization" annotation(
          Placement(visible = true, transformation(origin = {340.0, -120.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
        SystemDynamics.WorldDynamics.World3.Service_Sector_Investment Service_Sector_Investment1(t_policy_year = t_policy_year, p_avg_life_serv_cap_1 = p_avg_life_serv_cap_1, p_avg_life_serv_cap_2 = p_avg_life_serv_cap_2, p_serv_cap_out_ratio_1 = p_serv_cap_out_ratio_1, p_serv_cap_out_ratio_2 = p_serv_cap_out_ratio_2, service_capital_init = service_capital_init) "Service sector investment" annotation(
          Placement(visible = true, transformation(origin = {-100.0, -220.0}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0)),
          Dialog(group = "Variables"));
      equation
        population = Population_Dynamics1.Population.y;
        food = Food_Production1.Food.food;
        industrial_output = Industrial_Investment1.Industrial_Output.industrial_output;
        ppoll_index = Pollution_Dynamics1.PPoll_Index.y;
        nr_resources = NR_Resource_Utilization1.NR_Resources.y;
        fioa_ind = Industrial_Investment1.FIOA_Ind.fioa_ind;
        s_fioa_agr = Food_Production1.S_FIOA_Agr.s_fioa_agr;
        s_fioa_cons = Industrial_Investment1.S_FIOA_Cons.s_fioa_cons;
        s_fioa_serv = Service_Sector_Investment1.S_FIOA_Serv.s_fioa_serv;
        s_fr_cap_al_obt_res = NR_Resource_Utilization1.S_Fr_Cap_Al_Obt_Res.s_fr_cap_al_obt_res;
        life_expectancy = Life_Expectancy1.Life_Expectancy.y;
        food_pc = Food_Production1.Food_PC.y;
        serv_out_pc = Service_Sector_Investment1.Serv_Out_PC.y;
        ind_out_pc = Industrial_Investment1.Ind_Out_PC.y;
        human_ecological_footprint = Human_Ecological_Footprint1.HEF_Human_Ecological_Footprint.hef_human_ecological_footprint;
        human_welfare_index = Human_Welfare_Index1.HWI_Human_Welfare_Index.hwi_human_welfare_index;
        connect(Population_Dynamics1.population, Pollution_Dynamics1.population) annotation(
          Line(points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 140.0}, {-180.0, 140.0}, {-180.0, 88.0}, {-122.0, 88.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.population, Arable_Land_Dynamics1.population) annotation(
          Line(points = {{-122.0, 88.0}, {-180.0, 88.0}, {-180.0, -36.0}, {-122.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.population, Food_Production1.population) annotation(
          Line(points = {{-122.0, -36.0}, {-180.0, -36.0}, {-180.0, -104.0}, {-122.0, -104.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.population, Service_Sector_Investment1.population) annotation(
          Line(points = {{-122.0, -104.0}, {-180.0, -104.0}, {-180.0, -216.0}, {-122.0, -216.0}}, color = {0, 0, 191}, visible = true));
        connect(Population_Dynamics1.population, Industrial_Investment1.population) annotation(
          Line(points = {{-78.0, 190.0}, {-10.0, 190.0}, {-10.0, 34.0}, {116.0, 34.0}, {116.0, 58.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.population, Life_Expectancy1.population) annotation(
          Line(points = {{116.0, 58.0}, {116.0, 34.0}, {260.0, 34.0}, {260.0, -20.0}, {318.0, -20.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.population, NR_Resource_Utilization1.population) annotation(
          Line(points = {{318.0, -20.0}, {260.0, -20.0}, {260.0, -120.0}, {318.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.arable_land, Pollution_Dynamics1.arable_land) annotation(
          Line(points = {{-78.0, -20.0}, {-20.0, -20.0}, {-20.0, 26.0}, {-176.0, 26.0}, {-176.0, 64.0}, {-122.0, 64.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.arable_land, Food_Production1.arable_land) annotation(
          Line(points = {{-122.0, 64.0}, {-176.0, 64.0}, {-176.0, -112.0}, {-122.0, -112.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.arable_land, Labor_Utilization1.arable_land) annotation(
          Line(points = {{-78.0, -20.0}, {40.0, -20.0}, {40.0, -36.0}, {98.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.arable_land, Human_Ecological_Footprint1.arable_land) annotation(
          Line(points = {{98.0, -36.0}, {40.0, -36.0}, {40.0, -64.0}, {264.0, -64.0}, {264.0, 190.0}, {318.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_output, Pollution_Dynamics1.industrial_output) annotation(
          Line(points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, 22.0}, {-184.0, 22.0}, {-184.0, 80.0}, {-122.0, 80.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.industrial_output, Food_Production1.industrial_output) annotation(
          Line(points = {{-122.0, 80.0}, {-184.0, 80.0}, {-184.0, -136.0}, {-122.0, -136.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.industrial_output, Service_Sector_Investment1.industrial_output) annotation(
          Line(points = {{-122.0, -136.0}, {-184.0, -136.0}, {-184.0, -224.0}, {-122.0, -224.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_output, NR_Resource_Utilization1.industrial_output) annotation(
          Line(points = {{142.0, 84.3414}, {210.0, 84.3414}, {210.0, -130.0}, {318.0, -130.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Arable_Land_Dynamics1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {-188.0, 30.0}, {-188.0, -28.0}, {-122.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.ind_out_pc, Food_Production1.ind_out_pc) annotation(
          Line(points = {{-122.0, -28.0}, {-188.0, -28.0}, {-188.0, -128.0}, {-122.0, -128.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.ind_out_pc, Service_Sector_Investment1.ind_out_pc) annotation(
          Line(points = {{-122.0, -128.0}, {-188.0, -128.0}, {-188.0, -232.0}, {-122.0, -232.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Human_Fertility1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 30.0}, {36.0, 30.0}, {36.0, 170.0}, {98.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.ind_out_pc, Labor_Utilization1.ind_out_pc) annotation(
          Line(points = {{98.0, 170.0}, {36.0, 170.0}, {36.0, -12.0}, {98.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Human_Welfare_Index1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, 70.0}, {318.0, 70.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, Life_Expectancy1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -12.0}, {318.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.ind_out_pc, NR_Resource_Utilization1.ind_out_pc) annotation(
          Line(points = {{142.0, 68.0}, {200.0, 68.0}, {200.0, -110.0}, {318.0, -110.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.serv_out_pc, Human_Fertility1.serv_out_pc) annotation(
          Line(points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 190.0}, {98.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(points = {{-78.0, -210.0}, {0.0, -210.0}, {0.0, 18.0}, {108.0, 18.0}, {108.0, 11.6909}, {108.0, 2.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.serv_out_pc, Labor_Utilization1.serv_out_pc) annotation(
          Line(points = {{318.0, -4.0}, {218.0, -4.0}, {218.0, 18.0}, {108.0, 18.0}, {108.0, 10.0}, {108.0, 2.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_index, Land_Fertility1.ppoll_index) annotation(
          Line(points = {{-78.0, 80.0}, {20.0, 80.0}, {20.0, -130.0}, {98.0, -130.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.ppoll_index, Life_Expectancy1.ppoll_index) annotation(
          Line(points = {{98.0, -130.0}, {20.0, -130.0}, {20.0, -70.0}, {268.0, -70.0}, {268.0, -36.0}, {318.0, -36.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.food_ratio, Land_Fertility1.food_ratio) annotation(
          Line(points = {{-78.0, -104.0}, {10.0, -104.0}, {10.0, -110.0}, {98.0, -110.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.land_yield, Arable_Land_Dynamics1.land_yield) annotation(
          Line(points = {{-78.0, -112.0}, {-20.0, -112.0}, {-20.0, -60.0}, {-192.0, -60.0}, {-192.0, -4.0}, {-122.0, -4.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.food_pc, Life_Expectancy1.food_pc) annotation(
          Line(points = {{-96.0, -98.0}, {-96.0, -74.0}, {256.0, -74.0}, {256.0, -28.0}, {318.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.marg_prod_agr_inp, Arable_Land_Dynamics1.marg_prod_agr_inp) annotation(
          Line(points = {{-78.0, -120.0}, {-24.0, -120.0}, {-24.0, -64.0}, {-172.0, -64.0}, {-172.0, -12.0}, {-122.0, -12.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.agr_inp_per_hect, Pollution_Dynamics1.agr_inp_per_hect) annotation(
          Line(points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -56.0}, {-196.0, -56.0}, {-196.0, 72.0}, {-122.0, 72.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.agr_inp_per_hect, Labor_Utilization1.agr_inp_per_hect) annotation(
          Line(points = {{-78.0, -128.0}, {-16.0, -128.0}, {-16.0, -28.0}, {98.0, -28.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.s_fioa_agr, Industrial_Investment1.s_fioa_agr) annotation(
          Line(points = {{-78.0, -136.0}, {-4.0, -136.0}, {-4.0, 64.0}, {98.0, 64.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.service_capital, Labor_Utilization1.service_capital) annotation(
          Line(points = {{-78.0, -220.0}, {4.0, -220.0}, {4.0, -4.0}, {98.0, -4.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.p_fr_inp_for_land_maint, Land_Fertility1.p_fr_inp_for_land_maint) annotation(
          Line(points = {{-88.0, -142.0}, {-88.0, -160.0}, {44.0, -160.0}, {44.0, -120.0}, {98.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Service_Sector_Investment1.s_fioa_serv, Industrial_Investment1.s_fioa_serv) annotation(
          Line(points = {{-78.0, -230.0}, {16.0, -230.0}, {16.0, 38.0}, {108.0, 38.0}, {108.0, 58.0}}, color = {0, 0, 191}, visible = true));
        connect(Population_Dynamics1.labor_force, Labor_Utilization1.labor_force) annotation(
          Line(points = {{-78.0, 170.0}, {12.0, 170.0}, {12.0, -60.0}, {108.0, -60.0}, {108.0, -42.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.total_fertility, Population_Dynamics1.total_fertility) annotation(
          Line(points = {{142.0, 180.0}, {196.0, 180.0}, {196.0, 144.0}, {-200.0, 144.0}, {-200.0, 190.0}, {-122.0, 190.0}}, color = {0, 0, 191}, visible = true));
        connect(Industrial_Investment1.industrial_capital, Labor_Utilization1.industrial_capital) annotation(
          Line(points = {{142.0, 76.0}, {196.0, 76.0}, {196.0, -78.0}, {44.0, -78.0}, {44.0, -20.0}, {98.0, -20.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.land_fertility, Food_Production1.land_fertility) annotation(
          Line(points = {{142.0, -120.0}, {192.0, -120.0}, {192.0, -164.0}, {-112.0, -164.0}, {-112.0, -142.0}}, color = {0, 0, 191}, visible = true));
        connect(Life_Expectancy1.life_expectancy, Human_Welfare_Index1.life_expectancy) annotation(
          Line(points = {{362.0, -20.0}, {420.0, -20.0}, {420.0, 40.0}, {250.0, 40.0}, {250.0, 90.0}, {318.0, 90.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Welfare_Index1.life_expectancy, Human_Fertility1.life_expectancy) annotation(
          Line(points = {{318.0, 90.0}, {250.0, 90.0}, {250.0, 128.0}, {32.0, 128.0}, {32.0, 180.0}, {98.0, 180.0}}, color = {0, 0, 191}, visible = true));
        connect(Human_Fertility1.life_expectancy, Population_Dynamics1.life_expectancy) annotation(
          Line(points = {{98.0, 180.0}, {32.0, 180.0}, {32.0, 128.0}, {-190.0, 128.0}, {-190.0, 170.0}, {-122.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(NR_Resource_Utilization1.pc_res_use_mlt, Pollution_Dynamics1.pc_res_use_mlt) annotation(
          Line(points = {{362.0, -108.0}, {424.0, -108.0}, {424.0, 124.0}, {-176.0, 124.0}, {-176.0, 96.0}, {-122.0, 96.0}}, color = {0, 0, 191}, visible = true));
        connect(Land_Fertility1.yield_tech_LYTD, Food_Production1.yield_tech_LYTD) annotation(
          Line(points = {{142.0, -110.0}, {192.0, -110.0}, {192.0, -82.0}, {-112.0, -82.0}, {-112.0, -90.0}, {-112.0, -98.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.fr_inp_al_land_dev, Food_Production1.fr_inp_al_land_dev) annotation(
          Line(points = {{-78.0, -10.0}, {-28.0, -10.0}, {-28.0, -68.0}, {-172.0, -68.0}, {-172.0, -120.0}, {-122.0, -120.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.s_yield_mlt_air_poll, Food_Production1.s_yield_mlt_air_poll) annotation(
          Line(points = {{-78.0, 72.0}, {32.0, 72.0}, {32.0, -168.0}, {-104.0, -168.0}, {-104.0, -142.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.capital_util_fr, Service_Sector_Investment1.capital_util_fr) annotation(
          Line(points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {-172.0, -180.0}, {-172.0, -208.0}, {-122.0, -208.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_tech_mult_icor_COPM, Industrial_Investment1.ppoll_tech_mult_icor_COPM) annotation(
          Line(points = {{-88.0, 0.0}, {88.0, 0.0}}, color = {0, 0, 191}, visible = true, origin = {10.0, 88.0}));
        connect(NR_Resource_Utilization1.ind_cap_out_ratio_2_ICOR2T, Industrial_Investment1.ind_cap_out_ratio_2_ICOR2T) annotation(
          Line(points = {{362.0, -124.0}, {428.0, -124.0}, {428.0, 120.0}, {108.0, 120.0}, {108.0, 102.0}}, color = {0, 0, 191}, visible = true));
        connect(Labor_Utilization1.capital_util_fr, Industrial_Investment1.capital_util_fr) annotation(
          Line(points = {{142.0, -28.0}, {224.0, -28.0}, {224.0, -180.0}, {24.0, -180.0}, {24.0, 80.0}, {98.0, 80.0}}, color = {0, 0, 191}, visible = true));
        connect(NR_Resource_Utilization1.s_fr_cap_al_obt_res, Industrial_Investment1.s_fr_cap_al_obt_res) annotation(
          Line(points = {{362.0, -132.0}, {432.0, -132.0}, {432.0, 132.0}, {44.0, 132.0}, {44.0, 72.0}, {98.0, 72.0}}, color = {0, 0, 191}, visible = true));
        connect(Pollution_Dynamics1.ppoll_gen_rt, Human_Ecological_Footprint1.ppoll_gen_rt) annotation(
          Line(points = {{-78.0, 64.0}, {-20.0, 64.0}, {-20.0, 148.0}, {256.0, 148.0}, {256.0, 170.0}, {318.0, 170.0}}, color = {0, 0, 191}, visible = true));
        connect(Arable_Land_Dynamics1.urban_ind_land, Human_Ecological_Footprint1.urban_ind_land) annotation(
          Line(points = {{-78.0, -30.0}, {-24.0, -30.0}, {-24.0, 136.0}, {252.0, 136.0}, {252.0, 180.0}, {318.0, 180.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.yield_tech_mult_icor_COYM, Industrial_Investment1.yield_tech_mult_icor_COYM) annotation(
          Line(points = {{-96.0, -142.0}, {-96.0, -174.0}, {28.0, -174.0}, {28.0, 96.0}, {98.0, 96.0}}, color = {0, 0, 191}, visible = true));
        connect(Food_Production1.tot_agric_invest, Arable_Land_Dynamics1.tot_agric_invest) annotation(
          Line(points = {{-88.0, -98.0}, {-88.0, -52.0}, {-200.0, -52.0}, {-200.0, -20.0}, {-122.0, -20.0}}, color = {0, 0, 191}, visible = true));
        annotation(
          Icon(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-222.0, -262.0}, {440.0, 220.0}}), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-64.0, 40.0}, {292.0, 114.0}}, textString = "Influencing the", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-78.0, -32.0}, {308.0, 34.0}}, textString = "Future", fontName = "Arial"), Text(visible = true, lineColor = {0, 0, 255}, extent = {{-72.0, -124.0}, {294.0, -26.0}}, textString = "10 Years Later", fontName = "Arial")}),
          Diagram(coordinateSystem(extent = {{-220.0, -260.0}, {440.0, 220.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})),
          experiment(StartTime = 1900, StopTime = 2500),
          experimentSetupOutput,
          Documentation(info = "<html>
This is <font color=red><b>Scenario #11</b></font> of the <font color=red><b>WORLD3</b></font> model. This scenario starts out with the same assumptions as <font color=red><b>Scenario #10</b></font>. <p>
 
We now want to check what would have happened, had we started controlling our resources 10 years later. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.L., W.W. Behrens III, D.M., Meadows, R.F. Naill, J. Randers, and E.K.O. Zahn (1974), <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>, Wright-Allen Press, 637p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
 
In order to accomplish this change, we need to reset all of the switching times in the model: <p>
<font color=red>parameter Real t_fcaor_time(unit=\"yr\") = <b>2012</b> \"Year of capital allocation to resource use efficiency\";</font>. <p>
<font color=red>parameter Real t_fert_cont_eff_time(unit=\"yr\") = <b>2012</b> \"Year of continued fertility change\";</font>. <p>
<font color=red>parameter Real t_ind_equil_time(unit=\"yr\") = <b>2012</b> \"Year of industrial equilibrium\";</font>. <p>
<font color=red>parameter Real t_land_life_time(unit=\"yr\") = <b>2012</b> \"Land life time\";</font>. <p>
<font color=red>parameter Real t_policy_year(unit=\"yr\") = <b>2012</b> \"Year of policy change\";</font>. <p>
<font color=red>parameter Real t_zero_pop_grow_time(unit=\"yr\") = <b>2012</b> \"Time to zero population growth\";</font>. <p>
 
<hr> <p>
 
Simulate the model from 1900 until 2500, and display the same variables as in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a> at page 245: <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_37.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_38.png\"> <p>
<img src=\"modelica://SystemDynamics/Resources/Images/World3_39.png\"> <p>
 
<hr> <p>
 
The maximal population will be larger.  The attainable living standard will be approximately equal.  It is still not too late to do something.  Yet, the golden age will end quite a bit sooner. <p>
 
<hr> <p>
</html>", revisions = ""));
      end Scenario_12;
      annotation(
        preferedView = "info",
        Documentation(info = "<html>
This model implements <a href=\"http://en.wikipedia.org/wiki/Dennis_Meadows\">Dennis (and Dana) Meadows'</a> <font color=red><b>WORLD3</b></font> model as described in their 1972 book <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>.  The book has seen two later editions, one published in 1992 (20-year edition), and the most recent one published in 2004 (30-year edition).  Each of these new editions was accompanied by an updated model.  The model contained in this library is the newest model discussed in the 2004 edition <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>.  <p>
 
Whereas Jay Forrester listed his entire model in his book \"World Dynamics,\" Dennis Meadows only talked in \"Limits to Growth\" about the results obtained using his model.  The model itself is not listed. <p>
 
This was partly done because the <font color=red><b>WORLD3</b></font> model is considerably more complex than the <font color=red><b>WORLD2</b></font> model, and consequently, a thorough discussion of all facets of the model would have eaten up much more space in the book, but there is another reason as well. <p>
 
Stephen Hawking wrote in the introduction to one of his more popular books (<a href=\"http://www.amazon.com/Brief-History-Time-Stephen-Hawking/dp/0553380168\">A Brief History of Time: From the Big Bang to Black Holes</a>) that he had asked his publisher whether he could include some equations with the book.  The publisher answered that he would print anything that Stephen Hawking cared to submit for publication, but that the number of books sold would shrink by a facter of two for every added equation.  Hence Hawking decided to refrain from placing <i>any</i> equations in his book. <p>
 
Meadows is an <i>educator</i> even more than a <i>scientist</i>.  He believes strongly in his message, and he wanted to reach as many people with it as he possibly could.  Leaving the model equations out was the best way of accomplishing this goal. <p>
 
Yet, Meadows never tried to hide his model from public scrutiny.  In fact, he wrote an internal report of 637 pages that describes all facets of his model.  He published that internal report as a separate book in 1974: <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>.  The book is still available if anyone cares to buy it.  However, whereas Meadows sold millions of copies of his (popular) <i>Limits to Growth</i> book, he probably sold no more than a few hundred copies of his (technical) <i>Dynamics of Growth in a Finite World</i> report. <p>
 
Since the <font color=red><b>WORLD3</b></font> model is fairly complex, it won't fit on a single screen.  For this reason, I subdivided the model into 13 different sectors (i.e., sub-models) describing some aspects of: <br>
 
<ol>
<li> arable land dynamics,
<li> food production,
<li> <a href=\"http://www.footprintnetwork.org/gfn_sub.php?content=whoweare\">Mathis Wackernagel's</a> <a href=\"http://www.footprintnetwork.org/gfn_sub.php?content=footprint_overview\">human ecological footprint</a>,
<li>human fertility,
<li><a href=\"http://links.jstor.org/sici?sici=0004-5608(198812)78%3A4%3C580%3AWVIHWA%3E2.0.CO%3B2-A\">human welfare index</a>,
<li>industrial investment,
<li>labor utilization,
<li>land fertility,
<li>life expectancy,
<li>non-recoverable resource utilization,
<li>pollution dynamics,
<li>population dynamics, and
<li>service-sector investment.
</ol> <p>
 
The sub-models use green icons.  In the main model (yellow icon), I simply dropped one sub-model of each type onto the screen, and connected these models appropriately. <p>
 
Whereas the <font color=red><b>WORLD2</b></font> model lumped the entire population into a single state variable, the <font color=red><b>WORLD3</b></font> model offers a demographic population dynamics model that distinguishes between children and adolescents, young adults of child-bearing age, older adults who are still integrated into the work force, and the retired population. <p>
 
The capital investment is subdivided into investments in the military/industrial complex, in the service sector, and in agriculture. <p>
 
Both the natural resources and pollution models have been upgraded by including changes in technology as factors influencing the depletion of resources and the release of pollutants.  This is meaningful as improved technology may enable us to use the available resources more efficiently, and may also make it possible to produce goods in a cleaner fashion. <p>
 
The over-all (compiled) <font color=red><b>WORLD3</b></font> model contains 41 state variables and 245 algebraic variables. <p>
 
At this time, all that remains is to thank <a href=\"http://en.wikipedia.org/wiki/Dennis_Meadows\">Prof. Meadows</a> for his support of my efforts.  Dennis was kind enough to send me his complete <font color=red><b>WORLD3</b></font> model (2004 edition, coded in <font color=red><b>STELLA</b></font>) on a CD.  All that I had to do was to translate the model, equation by equation, from <font color=red><b>STELLA</b></font> to <font color=red><b>Modelica</b></font>. <p>
 
Unfortunately, <font color=red><b>STELLA</b></font> doesn't offer means for documenting models in an explicit way.  There was not a single line of comments in the entire model.  Meadows compensated for this lack of documentability by choosing very long variable names.  These helped tremendously in deciphering the meaning of the model.  I hope I didn't goof up too badly in doing so. <p>
 
In order to make it as easy as possible to compare the <font color=red><b>Modelica</b></font> version of the <font color=red><b>WORLD3</b></font> model with the <font color=red><b>STELLA</b></font>-coded original, I decided to keep the same variable names in my model that Dennis had chosen for his version. <p>
 
I also wish to acknowledge <a href=\"http://www.bi.no/Content/AcademicProfile____63388.aspx?ansattid=/fgl99096\">Prof. J�rgen Randers</a> who provided me with the information necessary to reproduce the 10 scenarios proposed in the book <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>. <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.L., W.W. Behrens III, D.H. Meadows, R.F. Naill, J. Randers, and E.K.O. Zahn (1974), <a href=\"http://www.pegasuscom.com/BookDetail.asp?BookQuery_Action=Find('ISBN','XDYGO')\">Dynamics of Growth in a Finite World</a>, Wright-Allen Press, 637p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
</html>", revisions = ""),
        Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {160, 160, 160}), Text(lineColor = {0, 0, 255}, extent = {{-80, 90}, {76, 36}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "WORLD3"), Text(lineColor = {0, 0, 255}, extent = {{-73.9, 25.05}, {72, -18}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "world model as proposed"), Text(lineColor = {0, 0, 255}, extent = {{-69.8, 38.1}, {68, 12}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "describes the enhanced"), Text(lineColor = {0, 0, 255}, extent = {{-39.7, -30.85}, {42, -58}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "in their book"), Text(lineColor = {0, 0, 255}, extent = {{-91.6, -2.8}, {94, -38}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "by Dennis and Dana Meadows"), Text(lineColor = {0, 0, 255}, extent = {{-49.7, -52.85}, {56, -84}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "Limits to Growth.")}));
    end World3;
    annotation(
      preferedView = "info",
      Documentation(info = "<html>
This package offers currently two different world models: <a href=\"http://en.wikipedia.org/wiki/Jay_Wright_Forrester\">Jay Forrester's</a> <font color=red><b>WORLD2</b></font> model (1971), and <a href=\"http://en.wikipedia.org/wiki/Dennis_Meadows\">Dennis (and Dana) Meadows'</a> <font color=red><b>WORLD3</b></font> model (1972), the latter in its most recently updated form of 2004. <p>
 
World modeling is one of the most important applications of the System Dynamics methodology.  This application, highly popular in the 1970s, has recently found renewed interest due to the widely discussed advents of <font color=red><b>Peak Oil</b></font> and <font color=red><b>Global Warming</b></font>. <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Forrester, J.W. (1971), <a href=\"http://www.amazon.com/World-Dynamics-Jay-W-Forrester/dp/1883823382/ref=ed_oe_h/103-2487145-1208659\">World Dynamics</a>, Pegasus Communications, 160p.
<li> Meadows, D.H., D.L. Meadows, J. Randers, and W.W. Behrens III (1972), <i>Limits to Growth: A Report for the Club of Rome's Project on the Predicament of Mankind</i>, Universe Books, New York, 205p.
<li> Meadows, D.H., D.L. Meadows, and J. Randers (1992), <i>Beyond the Limits</i>, Chelsea Green, 300p.
<li> Meadows, D.H., J. Randers, and D.L. Meadows (2004), <a href=\"http://www.amazon.com/Limits-Growth-Donella-H-Meadows/dp/193149858X\">Limits to Growth: The 30-Year Update</a>, Chelsea Green, 368p.
</ol> <p>
 
<hr> <p>
</html>"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {160, 160, 160}), Text(lineColor = {0, 0, 255}, extent = {{-80, 90}, {76, 36}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "World Dynamics"), Text(lineColor = {0, 0, 255}, extent = {{-65.9, 17.05}, {64, -20}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "for discussing some"), Text(lineColor = {0, 0, 255}, extent = {{-59.8, 30.1}, {56, 8}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "global world models"), Text(lineColor = {0, 0, 255}, extent = {{-45.7, -4.85}, {44, -38}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "aspects of the"), Text(lineColor = {0, 0, 255}, extent = {{-79.6, -25.8}, {80, -58}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "predicament of mankind."), Text(lineColor = {0, 0, 255}, extent = {{-54, 54}, {48, 22}}, fillColor = {0, 0, 0}, lineThickness = 0.5, textString = "provides a set of")}));
  end WorldDynamics;