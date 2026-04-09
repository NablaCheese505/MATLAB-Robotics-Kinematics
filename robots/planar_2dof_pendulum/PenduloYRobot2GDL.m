%% Reporte
% Robot pendulo
%     Cinematica Directa
%         Simbolico
%         Real con grafica
% Robot 2GDL
%     Cinematica Directa con casa en X y en Y
%          Simbolico
%          Numerico con gráficas
%     Cinematica Diferencial (solamente simbolica)
%         Determinante de la Cinematica diferencial
%     Cinematica Inversa con casa en X y en Y
%         Crear función y comprobarla
clc; clear; close all;
%% Cinemática Directa
% Robot Péndulo
%syms theta1 beta1 l1 a1;
theta1 = 20;
theta2 = 60;
beta1 = 0.01;
beta2 = beta1;
l1 = 0.7;
l2 = 0.5;
H1_0 = Hrz(theta1)*Htz(beta1)*Htx(l1)*Hrx(0);
disp("Matriz H1_0");
disp(H1_0);
%% Robot 2GDLHome en X
disp("---ROBOT 2GDL HOME EN X---")

% syms theta2 beta2 l2 a2;

H2_1 = Hrz(theta2)*Htz(beta2)*Htx(l2)*Hrx(0);
% H2_0 = simplify(H1_0*H2_1);
H2_0 = H1_0 * H2_1;
disp(">>>Matriz H2_0");
disp(H2_0);

Pf = [H2_0(1,4);H2_0(2,4);H2_0(3,4)];
disp(">>>Punto Final");
disp(Pf);

% disp(">>>Cinematica diferencial");
% J = jacobian(Pf,[theta1,theta2]);
% Jd = [J(1,1),J(1,2);J(2,1),J(2,2)];
% disp("Jacobiano");
% disp(J);
% disp("Determinante");
% disp(simplify(det(Jd)));

Sigma1 = [H1_0(1,4);H1_0(2,4);H1_0(3,4)];
disp(">>>\Sigma_1")
disp(Sigma1)

figure(1)
plot3(0,0,0,'o')
hold on 
plot3(Sigma1(1),Sigma1(2),Sigma1(3),'x') % posicion Sigma 1
hold on
plot3([0,Sigma1(1)],[0,Sigma1(2)],[0,Sigma1(3)],'r') % Eslabon 1
hold on
plot3([Sigma1(1),Pf(1)],[Sigma1(2),Pf(2)],[Sigma1(3),Pf(3)],'b') % Eslabon 2
hold on
plot3([0,Pf(1)],[0,Pf(2)],[0,Pf(3)],'--')
grid on
axis equal
% %% Robot 2GDLHome en y
% disp("---ROBOT 2GDL HOME EN y---")
% 
% syms theta2 beta2 l2 a2;
% H2_0_Y0 = round(Hrz(-90))*H2_0;
% disp(">>>Matriz H2_0");
% disp(H2_0_Y0);
% 
% Pf_Y = [H2_0_Y0(1,4);H2_0_Y0(2,4);H2_0_Y0(3,4)];
% disp(">>>Punto Final");
% disp(Pf_Y);

% disp(">>>Cinematica diferencial");
% J = jacobian(Pf,[theta1,theta2]);
% Jd = [J(1,1),J(1,2);J(2,1),J(2,2)];
% disp("Jacobiano");
% disp(J);
% disp("Determinante");
% disp(simplify(det(Jd)));


        
    