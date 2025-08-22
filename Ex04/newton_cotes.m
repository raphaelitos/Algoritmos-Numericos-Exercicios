function [Integral, Info] = newton_cotes(a, b, n, m, f)

  Integral = 0;
  Info = 0;

  % Coeficientes de Cotes
  [d, c, Info] = coeficientes_cotes(n);

  % Consistência dos parâmetros
  if (mod(m, n) != 0 || m < 0)
    Info = Info -10;
  endif

  if (Info != 0)
    return;
  endif

  % Cálculo da integral
  h = (b - a) / m;
  j = 0;

  for i = 0:m
    x = a + i * h;
    y = f(x);     
    j = j + 1;
    k = c(j);

    if (mod(i, n) == 0 && i != 0 && i != m)
      k = k + k;
      j = 1;
    endif

    Integral = Integral + y * k;
  endfor

  Integral = n * h/d * Integral;
endfunction
