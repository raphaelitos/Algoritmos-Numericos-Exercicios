function x = substituicoes_retroativas(n, U, d)
  %Resolve U x = d por substituições retroativas
  %   n : ordem de U (n×n)
  %   U : matriz triangular superior
  %   d : vetor independente (n×1)
  %   x : solução do sistema triangular superior

  % última componente
  x(n) = d(n) / U(n,n);

  % loop de retro-substituição
  for i = n-1 : -1 : 1
    soma = 0;
    for j = i+1 : n
      soma = soma + U(i,j) * x(j);
    end
    x(i) = (d(i) - soma) / U(i,i);
  end
end
