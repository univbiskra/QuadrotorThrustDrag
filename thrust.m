
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PWM=[1000;1100;1200;1300;1400;1500;1600;1700;1800;1900;2000];
Thrust1weight  = [0;21;56;95;141;209;285;368;451;533;593]; %grames
RPM_1          = [0;167^2;260^2;330^2;394^2;468^2;542^2;613^2;676^2;734^2;772^2];
Thrust2=[0;20;56;93;140;210;280;369;450;520;581];
Thrust3=[0;21;56;97;141;206;280;360;436;513;578];
% plot(PWM,Thrust1weight); hold on
% plot(PWM,Thrust2); grid on
% plot(PWM,Thrust3); zoom on
% % Time   DiodV  PWM   dT   RPM


figure  %grames
plot(PWM,Thrust1weight,'b--o',...
    'LineWidth',3,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5]) ; hold on; grid on
plot(PWM,Thrust2,'r-*',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5])

plot(PWM,Thrust3,'--gs',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','gr',...
    'MarkerFaceColor',[0.5,0.5,0.5])

title('Thrust Force Relative To PWM','FontSize',15)
xlabel('Pulse Width (Microsecondes)','FontSize',13)
ylabel('Thrust (Grames)','FontSize',13)
legend('Run 1','Run 2','Run 3','Location','northwest','FontSize',15)
 legend('boxoff')
 
 figure  %%%% Newoten
% Thrust1weight*9.80665*0.001/1;    %  9.80665 N  = 1kg   ===> 
plot(PWM,Thrust1weight*9.80665*0.001,'b--o',...
    'LineWidth',3,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5]) ; hold on; grid on
plot(PWM,Thrust2*9.80665*0.001,'r-*',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5])

plot(PWM,Thrust3*9.80665*0.001,'--gs',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','gr',...
    'MarkerFaceColor',[0.5,0.5,0.5])

title('Thrust Force Relative To PWM','FontSize',15)
xlabel('Pulse Width (Microsecondes)','FontSize',13)
ylabel('Thrust (Newton)','FontSize',13)
legend('Run 1','Run 2','Run 3','Location','northwest','FontSize',15)
 legend('boxoff')

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% calculat thrust coeffetion%%%%%%%%%%%%%%%%%%%%%%
 figure(3)
TotalRPM    = [RPM_1 ;RPM_1 ;RPM_1 ];
TotalThrust = [Thrust1weight;Thrust2;Thrust3];
 K = fit(TotalRPM,TotalThrust*9.80665*0.001,'poly1') 
    plot(TotalRPM,TotalThrust*9.80665*0.001,'o') ; hold on; grid on
    plot(K);   %,TotalRPM,TotalThrust*9.80665*0.001)
title('Thrust Coefficient ','FontSize',15)
xlabel('Angular Velocity^2 (rad/s)^2','FontSize',13)
ylabel('Thrust (Newton)','FontSize',13)
legend('Experimental Data','Best Fit','Location','northwest','FontSize',15)
 legend('boxoff')
%  
%  K = 
% 
%      Linear model Poly1:
%      K(x) = p1*x + p2
%      Coefficients (with 95% confidence bounds):
%        p1 =     9.7e-06  (9.602e-06, 9.798e-06)
%        p2 =    -0.07972  (-0.1117, -0.0477)
       
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ù
 
 figure(2)
%thrust = K*RPM^2
K1 = fit(RPM_1,Thrust1weight*9.80665*0.001,'poly1')
K2 = fit(RPM_1,Thrust2*9.80665*0.001,'poly1')
K3 = fit(RPM_1,Thrust3*9.80665*0.001,'poly1')
plot(RPM_1,Thrust1weight*9.80665*0.001,'b--o',...
    'LineWidth',3,...
    'MarkerSize',6,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5]) ; hold on; grid on
plot(RPM_1,Thrust2*9.80665*0.001,'r-*',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5])

plot(RPM_1,Thrust3*9.80665*0.001,'--gs',...
    'LineWidth',2,...
    'MarkerSize',5,...
    'MarkerEdgeColor','gr',...
    'MarkerFaceColor',[0.5,0.5,0.5])

plot(K1,RPM_1,Thrust1weight*9.80665*0.001)
plot(K2,RPM_1,Thrust2*9.80665*0.001)
plot(K3,RPM_1,Thrust3*9.80665*0.001)  

title('Thrust Coefficient "Thrust = K * W^2" ','FontSize',15)
xlabel('Angular Velocity (rad/s)','FontSize',13)
ylabel('Thrust (Newton)','FontSize',13)
legend('Run 1','Run 2','Run 3','Location','northwest','FontSize',15)
 legend('boxoff')
 
 
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ù
 % % Time   DiodV  PWM   dT   RPM
load test3
t_start = 1;%300
t_end = 3560;
time = test3(t_start:t_end,1)/1e3;  
PWM = test3(t_start:t_end,3);                                %PWM from 1000 to 2000
RPM = test3(t_start:t_end,5)/2; % 2 blades/propellor         %RPM from is by rad/s
RPMfindex = RPM <= 800;
RPM = RPM(RPMfindex);
time=time(RPMfindex);

%plot(time,RPM)
% Wiehgt=K*RPM^2


% x = Thrust1weight./RPM_1;
% k = mean(x(2:end));                    %9.2370e-04
% % means that  Weight =  9.2370e-04 * RPM^2
% %Yvalidation  = 0.0009237*RPM_1;
% Yvalidation2 = 0.0009841*RPM_1;
% hold on;  plot(RPM_1,Yvalidation2)

%using curve fitting tools we get
% Linear model Poly1:
%      f(x) = p1*x + p2
% Coefficients (with 95% confidence bounds):
%        p1 =    0.001006  (0.0009911, 0.001021)
%        p2 =      -9.579  (-14.49, -4.669)
%then   Kthrust ==== 0.001006  
       
    



