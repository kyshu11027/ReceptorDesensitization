function dxdt = DE2(t, conc, k)
    %k is a vector of size 9
    %index 1 is L, 2 is R, 3 is LR, 4 is LD, 5 is D
    dxdt = [k(2)*conc(3)+k(6)*conc(4)-k(5)*conc(1)*conc(5)-k(1)*conc(1)*conc(2)+NicDelivRate(t)-k(9)*conc(1); 
        k(8)*conc(5)+k(2)*conc(3)-k(7)*conc(2)-k(1)*conc(1)*conc(2); 
        k(1)*conc(1)*conc(2) + k(4)*conc(4) - k(2)*conc(3) - k(3)*conc(3); 
        k(3)*conc(3) + k(5)*conc(1)*conc(5) - k(4)*conc(4) - k(6)*conc(4);
        k(6)*conc(4) + k(7)*conc(2) - k(5)*conc(1)*conc(5) - k(8)*conc(5)];

end