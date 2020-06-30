function f_y_matrix = f_y(y,q_m,q_p,Q_p,m,l)
    
    f_y_matrix = zeros(9,9);
    
    f_y_matrix(1,5) = 1;
    f_y_matrix(2,6) = 1;
    f_y_matrix(3,7) = 1;
    f_y_matrix(4,8) = 1;
    f_y_matrix(5,1) = -abs(q_m)*Q_p/m*(y(2)^2 - 2*y(1)^2)/...
        (y(1)^2 + y(2)^2)^(5/2) - ...
        2/m*y(9);
    f_y_matrix(5,2) = -abs(q_m)*Q_p/m*(-3*y(1)*y(2))/...
        (y(1)^2 + y(2)^2)^(5/2);
    f_y_matrix(5,3) = 2/m*y(9);
    f_y_matrix(5,9) = -2/m*(y(1) - y(3));
    f_y_matrix(6,1) = -abs(q_m)*Q_p/m*(-3*y(1)*y(2))/...
        (y(1)^2 + y(2)^2)^(5/2);
    f_y_matrix(6,2) = -abs(q_m)*Q_p/m*(y(1)^2 - 2*y(2)^2)/...
        (y(1)^2 + y(2)^2)^(5/2) - ...
        2/m*y(9);
    f_y_matrix(6,4) = 2/m*y(9);
    f_y_matrix(6,9) = -2/m*(y(2) - y(4));
    f_y_matrix(7,1) = 2/m*y(9);
    f_y_matrix(7,3) = abs(q_p)*Q_p/m*(y(4)^2 - 2*y(3)^2)/...
        (y(3)^2 + y(4)^2)^(5/2) - ...
        2/m*y(9);
    f_y_matrix(7,4) = abs(q_p)*Q_p/m*(-3*y(3)*y(4))/...
        (y(3)^2 + y(4)^2)^(5/2);
    f_y_matrix(7,9) = 2/m*(y(1) - y(3));
    f_y_matrix(8,2) = 2/m*y(9);
    f_y_matrix(8,3) = abs(q_p)*Q_p/m*(-3*y(3)*y(4))/...
        (y(3)^2 + y(4)^2)^(5/2);
    f_y_matrix(8,4) = abs(q_p)*Q_p/m*(y(3)^2 - 2*y(4)^2)/...
        (y(3)^2 + y(4)^2)^(5/2) - ...
        2/m*y(9);
    f_y_matrix(8,9) = 2/m*(y(2) - y(4));
    f_y_matrix(9,1) = -2*(y(1) - y(3));
    f_y_matrix(9,2) = -2*(y(2) - y(4));
    f_y_matrix(9,3) = 2*(y(1) - y(3));
    f_y_matrix(9,4) = 2*(y(2) - y(4));
   
end