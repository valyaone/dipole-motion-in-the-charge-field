function [Fu,var] = yakobian(L)
    
    q1 = 1;
    q2 = -1;
    Q = 1;
    m1 = 1;
    m2 = 1;
    k = 1;
          
    syms x1 y1 vx1 vy1 x2 y2 vx2 vy2 l;
    u = [x1; y1; vx1; vy1; x2; y2; vx2; vy2; l;];
    a1 = k*q1*Q/( m1*( y1^2 + x1^2 )^(3/2) );
    a2 = k*Q*q2/( m2*( x2^2 + y2^2 )^(3/2) );

    F = [vx1; vy1; a1*x1 + 2*l/m1*( x1 - x2 ); a1*y1 + 2*l/m1*( y1 - y2 ); vx2; vy2; a2*x2 - 2*l/m2*( x1 - x2 ); a2*y2  - 2*l/m2*( y1 - y2 ); ( x1 - x2 )^2 + ( y1 - y2 )^2 - L^2];
    Fu = jacobian(F,u);
    var = symvar(Fu); 
  
end
