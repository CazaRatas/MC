%Metodo de Gauss Jordan

clear
clc

disp('----------------------');

n = input('Ingrese el orden del sistema: ');
B = zeros(n,1);
disp('Ingrese la matriz de coeficientes....');
for i = 1 : 1 : n
  for j = 1 : 1 : n
    A(i,j) = input(' ');
  end
end

disp('Ingrese el vector de terminos independientes...');
for i = 1 : 1 : n
  B(i) = input(' ');
end
A
B

for i = 1 : 1 : n
  p = A(i,i);
  for j = i : 1 : n
    A(i,j) = A(i,j)/p;
  end
  B(i) = B(i)/p;
  j = 1;

  while (j <= n)
    if ((j ~= n)||(j ~= i))
      if(i ~= j)
        f = -A(j,i);
        for k = i : 1 : n
          A(j,k) = A(j,k) + f * A(i,k);
        end
        B(j) = B(j) + f * B(i);
      end
    end
    j = j +1;
  end
end

B
