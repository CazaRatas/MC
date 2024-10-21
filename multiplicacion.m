%multiplicacion de matrices

clear
clc

m = input ('Cantidad de filas de la matriz A: ');
n = input ('Cantidad de columnas de la matriz A: ');
p = input ('Cantidad de filas de la matriz B: ');
q = input ('Cantidad de columnas de la matriz B: ');

if (n == p)
    disp('Matriz A ');
    A = zeros(m,n);
    for i = 1 : 1 : m
        for j = 1 : 1 : n
            A(i,j) = input(' ');
        end
    end

    B = zeros(p,q);
    disp('Matriz B ');
    for i = 1 : 1 : p
        for j = 1 : 1 : q
            B(i,j) = input (' ');
        end
    end
    C = zeros(m,q);
    for i = 1 : 1 : m
        for j = 1 : 1 : q
            for k = 1 : 1 : n
                C(i,j) = C(i,j) + A(i,k)*B(k,j);
            end
        end
    end
    disp(C);
else
    disp('No se puede multiplicar...');
end
