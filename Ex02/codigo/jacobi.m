function [x, Iter, Info] = jacobi(n, A, b, Toler, IterMax)
  % Algoritmo de Jacobi

  %Retirando inicializacao
  % valor inicial de x
  %for i = 1:n
  %  x(i) = b(i) / A(i,i);
  %end

  Iter = 0;
  x = zeros(n, 1);
  v = zeros(n,1);

  % iterações de Jacobi
  while true
    Iter = Iter + 1;

    % cálculo de v = próximo x
    for i = 1:n
      Soma = 0;
      for j = 1:n
        if i ~= j
          Soma = Soma + A(i,j) * x(j);
        endif
      endfor
      v(i) = (b(i) - Soma) / A(i,i);
    endfor

    % teste de convergência (norma relativa)
    NormaNum = 0; 
    NormaDen = 0;
    for i = 1:n
      t = abs(v(i) - x(i));
      if t > NormaNum
        NormaNum = t;
      endif
      if abs(v(i)) > NormaDen
        NormaDen = abs(v(i));
      endif
      x(i) = v(i);
    endfor
    NormaRel = NormaNum / NormaDen;

    % escreva Iter, x, NormaRel
    fprintf('Iter = %d, x = [', Iter);
    fprintf('%g ', x);
    fprintf('], NormaRel = %g\n', NormaRel);

    % critério de parada
    if NormaRel <= Toler || Iter >= IterMax
      break;
    endif
  endwhile

  % sinaliza convergência
  if NormaRel <= Toler
    Info = 0;
  else
    Info = 1;
  end
endfunction
