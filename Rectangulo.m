% M?todo del rectangulo
clc
clear
n = 500;
funcion = input('Introduce la funcion: ', 's');
fun = ['@(x) ', funcion];
f = str2func(fun);
x(1) = input('Ingresar el limite inferior: ');
x(n + 1) = input('Ingresar el limite superior: ');

h = (x(n + 1) - x(1)) / n;
s = 0;

for i = 1: 1 : n
    x(i) = x(1) + (i - 1) * h;
    s = s + f(x(i));
end

I = h * s;
disp(['El valor aproximado de la integral es: ', num2str(I)]);
