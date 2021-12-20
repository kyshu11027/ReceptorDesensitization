function dxdt = NicDelivRate(t)
    %conditional statements to set nicotine delivery rate based on time.
    if t>0 && t<=0.5/60
        dxdt = 36 + 15/(0.5/60);
    elseif t>1 && t<=1+(0.5/60)
        dxdt = 36 + 15/(0.5/60);
    elseif t>2 && t<=2+(0.5/60)
        dxdt = 36 + 15/(0.5/60);
    else
        dxdt = 36;
    end
end