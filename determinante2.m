clear
clc

disp('-----------');
n = input('Ingrese el tamaño de la matriz: ');
for i = 1 : 1 : n
    for j = 1 : 1 : n
        A(i,j) = input(' ');
    end
end

d = 1;
for i = 1 : 1 : n-1
    for j = i+1 : 1 : n
        f = - (A(j,i) / A(i,i));
        for k = i : 1 : n
            A(j,k) = A(j,k) + f*A(i,k);
        end
    end
end
for i = 1 : 1 : n
    d = d * A(i,i);
end
d



