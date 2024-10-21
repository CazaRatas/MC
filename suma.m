%Suma de matrices

clear
clc


m = input('Cantidad de filas: ');
n = input('Cantidad de columnas: ');

disp('Matriz A');
for i = 1 : 1 : m
    for j = 1 : 1 : n
          A(i,j) = input(' ');
    end
end

disp('Matriz B');
for i = 1 : 1 : m
    for j = 1 : 1 : n
        B(i,j) = input (' ');
    end
end

%Sumar
for i = 1 : 1 : m
    for j = 1 : 1 : n
        C(i,j) = A(i,j) + B(i,j);
    end
end

C

