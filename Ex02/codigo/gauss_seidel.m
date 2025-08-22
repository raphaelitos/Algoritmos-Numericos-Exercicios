function [x, Iter, Info] = gauss_seidel(n, A, b, Toler, IterMax)
  % Algoritmo de Gauss–Seidel para resolver Ax = b

  %* valor inicial de x
  %for i = 1:n
  %  x(i) = b(i) / A(i,i);
  %end
  %x = x(:);

  Iter = 0;
  v = zeros(n,1);
  x = zeros(n,1);

  % iterações de Gauss–Seidel
  while true
    Iter = Iter + 1;
    NormaNum = 0;
    NormaDen = 0;

    for i = 1:n
      Soma = 0;
      for j = 1:n
        if i ~= j
          Soma = Soma + A(i,j) * x(j);
        endif
      endfor

      % guarda valor antigo e atualiza x(i)
      v(i) = x(i);
      x(i) = (b(i) - Soma) / A(i,i);

      % erro absoluto na componente i
      t = abs(v(i) - x(i));
      if t > NormaNum
        NormaNum = t;
      endif
      if abs(x(i)) > NormaDen
        NormaDen = abs(x(i));
      endif
    endfor

    % norma relativa
    NormaRel = NormaNum / NormaDen;

    % saída de status
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
