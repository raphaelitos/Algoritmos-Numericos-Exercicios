function [U, b, Info] = eliminacao_gauss_sem_pivotacao(n, A, b)
  % n     : ordem de A (n×n)
  % A     : matriz de coeficientes
  % b     : vetor de termos independentes
  % U     : matriz triangular superior resultante
  % b     : vetor modificado após eliminação
  % Info  : 0 se A não singular; senão, índice do primeiro pivo zero

  % Inicialização
  U    = A;
  Det  = 1;
  Info = 0;

  % Processo de eliminação sem troca de linhas
  for j = 1 : n-1

    if U(j,j) ~= 0
      % elimina abaixo do pivo U(j,j)
      for i = j+1 : n
        Mult    = U(i,j) / U(j,j);
        U(i,j)  = 0;
        % atualiza os demais elementos da linha i
        U(i, j+1:n) = U(i, j+1:n) - Mult * U(j, j+1:n);
        % atualiza o vetor b
        b(i) = b(i) - Mult * b(j);
      end
    else
      % pivo zero detectado
      if Info == 0
        Info = j;
      end
    end
  end

  %inclui o último elemento no determinante
  Det = Det * U(n,n);
  if Info == 0 && U(n,n) == 0
    Info = n;
  end
end
