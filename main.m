% Design of Square Sloped Footing

clc;
clear all;
format short g;

load value.mat
load input.mat
disp ("Design of Square Sloped Footing")
disp("\n")
%Compute the Area of the Footing
Load_on_Column = Load;
printf("Load_on_Column = %d KN \n",Load_on_Column)

Assume_the_Self_Weight_of_Footing = (Self_Weight);
printf("Assume_the_Self_Weight_of_Footing = %d %% \n",Assume_the_Self_Weight_of_Footing)

Load_inc = (Self_Weight/100)*Load;
Self_Weight_of_Footing = Load_inc;
printf("Self_Weight_of_Footing = %d KN \n",Self_Weight_of_Footing)

Vertical_Load_on_Column = Load+Load_inc;
printf("Vertical_Load_on_Column = %d KN \n",Vertical_Load_on_Column)

disp("\n")
Required_Area_of_Footing = (Vertical_Load_on_Column/Soil_Pressure);
printf("Required_Area_of_Footing = %d m^2 \n",Required_Area_of_Footing)

% Side of Rectangular Footing
Side_of_Footing = ceil((sqrt(Required_Area_of_Footing))/0.1)*0.1;
printf("Side_of_Footing = %d m \n",Side_of_Footing)

Provided_Area_of_Footing = Side_of_Footing*Side_of_Footing;
printf("Provided_Area_of_Footing = %d m^2 \n",Provided_Area_of_Footing)

% Net Upward pressure
Net_Upward_Pressure = ceil((Load)/(Side_of_Footing*Side_of_Footing));
printf("Net_Upward_Pressure = %d KN/m^2 \n",Net_Upward_Pressure)

% Depth on the basis of moment
disp("\n")
disp("Depth on the basis of Bending Compression")

M = Net_Upward_Pressure*(Side_of_Footing/8)*(Side_of_Footing-Side_of_Column)*(Side_of_Footing-Side_of_Column)*1000000;
printf("Moment at the Face of the Column = %d Nmm \n",M)

Factored_Moment_at_the_Face_of_the_Column = 1.5*M;
printf("Factored_Moment_at_the_Face_of_the_Column = %d Nmm \n",Factored_Moment_at_the_Face_of_the_Column)

xu_max_by_d = (700)/(1100+0.87*Fy);
Ru = (0.36*Fck*xu_max_by_d*(1-0.416*xu_max_by_d));

Effective_Depth_on_the_basis_of_Moment= round(sqrt((Factored_Moment_at_the_Face_of_the_Column)/(Ru*Side_of_Column*1000))/10)*10;
printf("Effective_Depth_on_the_basis_of_Moment = %d mm \n",Effective_Depth_on_the_basis_of_Moment)

Overall_Depth_on_the_basis_of_Moment = Effective_Depth_on_the_basis_of_Moment+Clear_Cover_for_Footing;
printf("Overall_Depth_on_the_basis_of_Moment  = %d mm \n",Overall_Depth_on_the_basis_of_Moment)

Effective_Depth_Moment_for_lower_layer = Overall_Depth_on_the_basis_of_Moment-Clear_Cover;
Effective_Depth_Moment_for_upper_layer = Effective_Depth_Moment_for_lower_layer-dia;

Depth_at_edge = ceil((0.2*Effective_Depth_on_the_basis_of_Moment)/100)*100;
printf("Depth_at_edge  = %d mm \n",Depth_at_edge)

Eff_depth_edge_for_lower_layer = Depth_at_edge-Clear_Cover;
Eff_depth_edge_for_upper_layer = Eff_depth_edge_for_lower_layer-dia;

if(Effective_Depth_Moment_for_lower_layer>Eff_depth_edge_for_lower_layer)
Effective_Depth_Moment = Effective_Depth_Moment_for_lower_layer;
printf("Effective_Depth_Moment  = %d mm \n",Effective_Depth_Moment)

elseif(Effective_Depth_Moment_for_lower_layer<Eff_depth_edge_for_lower_layer)
Effective_Depth_Moment = Eff_depth_edge_for_lower_layer;
printf("Effective_Depth_Moment  = %d mm \n",Effective_Depth_Moment)
endif















