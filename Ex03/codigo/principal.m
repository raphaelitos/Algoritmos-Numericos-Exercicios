x = [2.0 2.2 2.4 2.5 2.7 2.9];
y = [5.6569 7.1789 8.9234 9.8821 11.9787 14.3217];
z = 2.1;

m = 2;
%m = 3;
%m = 4;

m
x
y
z

%printf("Interpolacao via polinomio de Lagrange\n");
%[Pz] = polinomio_lagrange(m, x, y, z);

printf("Interpolacao via polinomio de Newton\n");
[Pz] = polinomio_newton(m, x, y, z);

Pz
