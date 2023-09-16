PWM   = [1100;1200;1300;1400;1500;1600;1700;1800;1900;2000];
RPM_1 = [167^2;260^2;330^2;394^2;468^2;542^2;613^2;676^2;734^2;772^2];
Drag3=[1;3;7;11;15;24;30;42;55;62];
Drag4=[1;3;7;10;16;22;32;43;57;64];
Drag5=[2;4;8;11;16;22;31;43;56;66];  
% the Drag coefficient should be in N.m not in grammes  
%Drag moment == Force (N) *   distance (M)
Drag3 = (Drag3 * 9.80665*0.001 ) *1 ;
Drag4 = (Drag4 * 9.80665*0.001 ) *1 ;
Drag5 = (Drag5 * 9.80665*0.001 ) *1 ;
      %         N                *  distance
 
plot(PWM,Drag3); hold on
plot(PWM,Drag4); grid on
plot(PWM,Drag5); zoom on


figure  %grames
plot(PWM,Drag3,'b--o',...
    'LineWidth',3,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5]) ; hold on; grid on
plot(PWM,Drag4,'r-*',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5])

plot(PWM,Drag5,'--gs',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','gr',...
    'MarkerFaceColor',[0.5,0.5,0.5])

title('Drag Moment Relative To PWM','FontSize',15)
xlabel('Pulse Width (Microsecondes)','FontSize',13)
ylabel('Drag moment (N.m)','FontSize',13)
legend('Run 1','Run 2','Run 3','Location','northwest','FontSize',15)
 legend('boxoff')
 
 %%%%%%%%%%%%%%%%%%%%%%%
 
  figure(3)
TotalRPM    = [RPM_1 ;RPM_1 ;RPM_1 ];
TotalThrust = [Drag3;Drag4;Drag5];

 K = fit(TotalRPM,TotalThrust,'poly1') 
    plot(TotalRPM,TotalThrust,'o',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])

 hold on; grid on
    plot(K);   %,TotalRPM,TotalThrust*9.80665*0.001)
title('Drag Moment Coefficient ','FontSize',15)
xlabel('Angular Velocity^2 (rad/s)^2','FontSize',13)
ylabel('Drag Moment (N.m)','FontSize',13)
legend('Experimental Data','Best Fit','Location','northwest','FontSize',15)
 legend('boxoff')
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
K1 = fit(RPM_1,Drag3*9.80665*0.001,'poly1')
K2 = fit(RPM_1,Drag4*9.80665*0.001,'poly1')
K3 = fit(RPM_1,Drag5*9.80665*0.001,'poly1')
plot(RPM_1,Drag3*9.80665*0.001); hold on ;  plot(K1)
plot(RPM_1,Drag4*9.80665*0.001); hold on ;  plot(K2)
plot(RPM_1,Drag5*9.80665*0.001); hold on ;  plot(K3)
