%Triangulacion de Gauss

clear
clc

disp('-------------------');

n = input ('Ingresar el orden del sistema: ');
disp('Matriz de coeficientes...');
for i = 1 : 1 : n
  for j = 1 : 1 : n
    A(i,j) = input(' ');
  end
end

disp('Valor de terminos independientes...');
for i = 1 : 1 : n
  B(i) = input(' ');
end

for i = 1 : 1 : n - 1
  p = A(i,i);
  for j = i : 1 : n
    A(i,j) = A(i,j) / p;
  end

  B(i) = B(i) / p;

  for j = i+1 : 1 : n
    f = -A(j,i);
    for k = i : 1 : n
      A(j,k) = A(j,k) + f * A(i,k);
    end
    B(j) = B(j) + f * B(i);
  end
end

X(n) = B(n) / A(n,n);
for i = n-1 : -1 : 1
  s = 0;
  for k = i + 1 : 1 : n
    s = s + A(i,k) * X(k);
  end
  X(i) = (B(i) - s);
end
X
A

%sistema de ecuaciones lineales metodo de la triangular de gauss
clc
clear all
n=input("introduzca el orden de la matriz de coeficientes: ");
disp("Matriz A: ");
for i=1:n
    for j=1:n
        A(i,j)=input(['introduzca el termino A(' num2str(i) ',' num2str(j) '): ']);
    end
end
disp("matriz B: ");
for i=1:n
    B(i,1)=input(['Introduzca el termino ( ' num2str(i) ',1): ']);
end


for i=n:-1:2
    p=A(i,i);
    for j=n:-1:1
        A(i,j)=A(i,j)/p;
    end
    B(i,1)=B(i,1)/p;
    for j=i-1:-1:1
        f=-A(j,i);
        for k=i:-1:1
            A(j,k)=A(j,k)+f*A(i,k);
        end
        B(j,1)=B(j,1)+f*B(i,1);
    end
end


X(1,1)=B(1,1)/A(1,1);
for i=2:n
    S=0;
    for k=1 : 1 : i-1
        S=S+A(i,k)*X(k,1);
    end
    X(i,1)=B(i,1)-S;
end
disp("el conjunto solucion de este sistema de ecuaciones es: ")
X
A
