%DH- parameters using peter corke robotics
clear all
syms a1 a2 a3 q1 q2 q3
%L = link([Theta d a alpha],'p') if presimatic put p not remove
L(1) = Link([0 0 a1 -pi/2]);
L(2) = Link([0 0 a2 0]);
L(3) = Link([0 0 a3 0]);
%DH=[L(1); L(2); L(2)];
A1=L(1).A(q1);
A2=L(2).A(q2);
A3=L(3).A(q3);
%for asseply all the robot we use serial link
hexapod_leg= SerialLink(L);
% make a name for the robot
hexapod_leg.name='hexapod_leg'
%Transformation Matrices
T1_0=double(A1);
T2_0=double(simplify(A1*A2));
T3_0=double(simplify(A1*A2*A3));
% Z and O for Jacobian
z0=[0; 0;1]; o0=[0; 0; 0];
z1=T1_0(1:3,3); 
o1=T1_0(1:3,4);
z2=T2_0(1:3,3);
o2=T2_0(1:3,4);
o3=T3_0(1:3,4);
%Jacobian formation
J1=[simplify(cross(z0,(o3-o0)));z0];
J2=[simplify(cross(z1,(o3-o1)));z1];
J3=[simplify(cross(z2,(o3-o2)));z2];
jacobian_matrix=[J1 J2 J3]






