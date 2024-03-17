function y = jacobi_inv(u)
a1 = 50; a2= 100;  a3= 100; 

q1= u(1) ; q2= u(2) ; q3 = u(3); 
c23 =cos(q2+q3); s23=sin(q2+q3);
dx= u(4) ; dy= u(5) ; dz = u(6); 


jacobi=  [-sin(q1)*(a1 + a3*c23 + a2*cos(q2)),                 -cos(q1)*(a3*s23 + a2*sin(q2)),          -a3*s23*cos(q1);
          cos(q1)*(a1 + a3*c23 + a2*cos(q2)),                 -sin(q1)*(a3*s23 + a2*sin(q2)),          -a3*s23*sin(q1);
                                           0,                          - a3*c23 - a2*cos(q2),                  -a3*c23;
                                           0,                                       -sin(q1),                 -sin(q1);
                                           0,                                        cos(q1),                  cos(q1);
                                           1,                                              0,                        0];
y = (pinv(jacobi))* [dx ;dy;dz; 0;0;0];

