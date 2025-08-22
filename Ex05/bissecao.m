function [Raiz, Iter, Info] = bissecao(a, b, Toler, IterMax, f)
    Fa = f(a);
    Fb = f(b);

    if Fa * Fb > 0
        Info = -1;
        return;
    endif

    deltax = abs(b - a);
    Iter = 0;

    while true
        deltax = deltax / 2;
        x = (a + b) / 2;
        Fx = f(x);

        if (deltax <= Toler && abs(Fx) <= Toler) || (Iter >= IterMax)
            break;
        endif

        if Fa * Fx > 0
            a = x;
            Fa = Fx;
        else
            b = x;
            Fb = Fx;
        endif

        Iter = Iter + 1;
    endwhile

    Raiz = x;

    if deltax <= Toler && abs(Fx) <= Toler
        Info = 0;
    else
        Info = 1;
    endif
endfunction
