function [] = secant(xn, xnp1, epsilon)
    syms f(x);
    
    %f(x) = x^3 - x - 3;
    f(x) = tan(x) + x - 1;
    fplot(f);
    hold on
    grid on
    
    n = 0;
    xnp2 = xnp1 - f(xnp1) * (xnp1 - xn) / (f(xnp1) - f(xn));
    
    iteration = [];
    xnArr = [];
    xnp1Arr = [];
    xnp2Arr = [];
    
    while(abs(xnp1 -xn)>= epsilon)
        xn = xnp1;
        xnp1 = xnp2;
        xnp2 = xnp1 - f(xnp1) * (xnp1 - xn) / (f(xnp1) - f(xn));
        n = n + 1;
        iteration = [iteration; n];
        xnArr = [xnArr; double(xn)];
        xnp1Arr = [xnp1Arr; double(xnp1)];
        xnp2Arr = [xnp2Arr; double(xnp2)];
        plot([xnp1 xnp2] , [f(xnp1) f(xnp2)]);
    end
    
    T = table(iteration, xnArr, xnp1Arr, xnp2Arr);
    T.AbsErr = abs(T.xnp1Arr - T.xnArr);
    T.Properties.VariableNames = {'i', 'xn', 'xn+1','xn+2', '|xn+1 - xn|'};
    
    disp(T);
