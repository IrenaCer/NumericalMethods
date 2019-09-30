function [] = iterative(x0, l, r, epsilon);
    syms f(x);
    f(x) = tan(x) + x - 1;
    %f(x) = x - tan(5*x)+1;
    syms g(x);
    g(x) = atan(1-x)
    %g(x) = 1/5 * atan(x + 1)
    
    fplot(f);
    hold on
    grid on

    ginv = -g;
    n = 1;
    xn = x0;
    xnp1 = g(xn);
    gder = diff(g);
    
    iteration = [n];
    xnArr = [double(xn)];
    xnp1Arr = [double(xnp1)];
    fplot(xn, f(xn), 'pr');
    fplot(xnp1, f(xnp1), 'pr');
    
    q = abs(gder(fminbnd(diff(ginv), l, r)));
    %disp(double(q))
    while(abs(xnp1 - xn) > ((1-q)/q)*epsilon)
        n = n + 1;
        xn = xnp1;
        xnp1 = g(xn);
        iteration = [iteration; n];
        xnArr = [xnArr; double(xn)];
        xnp1Arr = [xnp1Arr; double(xnp1)];
        
        fplot(xnp1, f(xnp1), 'pr');
    end
    %disp(double(xnp1));
    disp(n);
    disp(double((1-q)/q));
    
    T = table(iteration, xnArr, xnp1Arr);
    T.AbsErr = abs(T.xnp1Arr - T.xnArr);
    T.Properties.VariableNames = {'i', 'xn', 'xn+1', '|xn+1 - xn|'};
    
    disp(T);
    
    
    