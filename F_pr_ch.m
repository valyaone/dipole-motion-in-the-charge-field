﻿function f_vector=F_pr_ch(U,L)
    
    q1 = 1;
    q2 = -1;
    Q = 1;
    m1 = 1;
    m2 = 1;
    k = 1;

    betta_1 = k*q1*Q/( m1*( U(1)^2 + U(2)^2 )^(3/2) );
    betta_2 = k*Q*q2/( m2*( U(5)^2 + U(6)^2 )^(3/2) );

 
    f_vector(1) = U(3);
    f_vector(2) = U(4);
    f_vector(3) = betta_1*U(1) + 2*U(9)/m1*( U(1) - U(5) );
    f_vector(4) = betta_1*U(2) + 2*U(9)/m1*( U(2) - U(6) );
    f_vector(5) = U(7);
    f_vector(6) = U(8);
    f_vector(7) = betta_2*U(5) + 2*U(9)/m2*( U(5) - U(1) );
    f_vector(8) = betta_2*U(6) + 2*U(9)/m2*( U(6) - U(2) );
    f_vector(9) = ( U(1) - U(5) )^2 + ( U(2) - U(6) )^2 - L^2;


end








