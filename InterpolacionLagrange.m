%Interpolacion
clear
clc

n = input('Ingrese el grado del polinimio: ');
xr = input('Ingrese el valor de la abcisa: ');

for i = 1 : 1 : n+1
    x(i) = input('Valor de x: ');
    y(i) = input('Valor de y: ');
end

yr = 0;

for j=1 : 1 : n+1
    NL = 1;
    DL = 1;
    i = 1;
    while(i <= n)
        if((i ~= j) || (j ~= n))
            if(i == j)
                i = i + 1;
            end
            NL = NL * (xr - x(i));
            DL = DL * (x(j) - x(i));
        end
        i = i + 1;
    end
    yr = yr + (NL/DL)*y(j);
end
disp(yr);
