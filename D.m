function D_matrix = D(N)
    
    D_matrix = zeros(N,N);
    for n = 1:(N - 1)
        D_matrix(n,n) = 1;
    end
    
end
