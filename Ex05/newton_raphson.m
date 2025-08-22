function [Raiz, Iter, Info] = newton_raphson(x, Toler, IterMax, f, df)
    Epsilon = eps;
    deltax = 1 + Toler;
    Iter = 0;

    while true
        Fx = f(x);
        DFx = df(x);

        if (abs(deltax) <= Toler && abs(Fx) <= Toler) || abs(DFx) < Epsilon || Iter >= IterMax
            break;
        endif

        deltax = Fx / DFx;
        x = x - deltax;

        Iter = Iter + 1;
    endwhile

    Raiz = x;

    if abs(deltax) <= Toler && abs(Fx) <= Toler
        Info = 0;
    else
        Info = 1;
    endif
endfunction
