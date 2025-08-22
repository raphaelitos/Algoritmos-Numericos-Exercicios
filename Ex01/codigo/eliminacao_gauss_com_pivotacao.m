function [U, b, Info] = eliminacao_gauss_com_pivotacao(n, A, b)
  % Eliminação de Gauss com pivotação parcial
  % A     : matriz de coeficientes (n×n)
  % b     : vetor de termos independentes (n×1)
  % U     : matriz triangular superior resultante
  % b     : vetor modificado após eliminação
  % Info  : 0 se A não singular; senão, índice do pivo singular

  %Inicializacao
  U = A;
  Det  = 1;
  Info = 0;

  for j = 1 : n-1
    %pivotação parcial na coluna j
    [Amax, p_rel] = max( abs(U(j:n, j)) );
    p = p_rel + j - 1;

    if p ~= j
      % troca de linhas j e p em U e em b
      U([j, p], :) = U([p, j], :);
      b([j, p])   = b([p, j]);
      Det = -Det;
    end

    %acumula fator no determinante
    Det = Det * U(j, j);

    if abs(U(j, j)) > 0
      %eliminação na coluna j
      inv_pivot = 1 / U(j, j);
      for i = j+1 : n
        Mult = U(i, j) * inv_pivot;
        U(i, j) = 0;
        % atualiza linha i e b
        U(i, j+1:n) = U(i, j+1:n) - Mult * U(j, j+1:n);
        b(i) = b(i) - Mult * b(j);
      end
    else
      % pivo zero detectado
      if Info == 0
        Info = j;
      end
    end
  end

  % ultimo elemento para o determinante
  Det = Det * U(n, n);
  if Info == 0 && abs(U(n, n)) == 0
    Info = n;
  end
end
