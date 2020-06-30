function f_vector = f(y,q_m,q_p,Q_p,m,l)
    
    f_vector = zeros(9,1);
    f_vector(1) = y(5);
    f_vector(2) = y(6);
    f_vector(3) = y(7);
    f_vector(4) = y(8);
    f_vector(5) = -abs(q_m)*Q_p*y(1)/m/(y(1)^2 + y(2)^2)^(3/2) - ...
        2/m*y(9)*(y(1) - y(3));
    f_vector(6) = -abs(q_m)*Q_p*y(2)/m/(y(1)^2 + y(2)^2)^(3/2) - ...
        2/m*y(9)*(y(2) - y(4));
    f_vector(7) = abs(q_p)*Q_p*y(3)/m/(y(3)^2 + y(4)^2)^(3/2) + ...
        2/m*y(9)*(y(1) - y(3));
    f_vector(8) = abs(q_p)*Q_p*y(4)/m/(y(3)^2 + y(4)^2)^(3/2) + ...
        2/m*y(9)*(y(2) - y(4));
    f_vector(9) = l^2 - (y(1) - y(3))^2 - (y(2) - y(4))^2;

end