clear; clc;

t_0 = 0; T = 1500;

a = 0.5;
l = 0.1;

x_m_init = a; y_m_init = l/2;
x_p_init = a; y_p_init = -l/2;

v_x_m_init = 0; v_y_m_init = 0; 
v_x_p_init = 0; v_y_p_init = 0;

q_m = -10^(-7); q_p = 10^(-7);
Q_p = 1;

mass = 0.1;

lambda_init = 1; % Обсудим позже

M = 400;

a_11 = (1 + 1i)/2;  % Обсудим позже
% a_11 = 1/2;

tau = (T - t_0)/M;

t = t_0:tau:T;

y = zeros(M + 1,9);

y(1,:) = [x_m_init y_m_init x_p_init y_p_init ...
    v_x_m_init v_y_m_init v_x_p_init v_y_p_init lambda_init];

for m = 1:M
    
    w_1 = (D(9) - a_11*tau*f_y(y(m,:),q_m,q_p,Q_p,mass,l))\f(y(m,:),q_m,q_p,Q_p,mass,l);
    y(m + 1,:) = y(m,:) + tau*real(w_1)';
    
end

% plot(t,(y(:,1)-y(:,3)).^2 + (y(:,2)-y(:,4)).^2);
% axis([t_0 T 0 0.012])

figure;
for m = 1:(M + 1)
    
    plot(0,0,'or','MarkerSize',7); hold on;
    
    plot(y(m,1),y(m,2),'ob','MarkerSize',7); hold on;
    plot(y(m,3),y(m,4),'or','MarkerSize',7); hold on;
    plot([y(m,1) y(m,3)],[y(m,2) y(m,4)],'-','LineWidth',3); hold on; 
    
    axis([-0.2*a 1.2*a -0.6*a 0.6*a]);
   
    hold off; drawnow; pause(0.01);
    
    m
    
end








