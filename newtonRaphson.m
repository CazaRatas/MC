%Newton Raphson

clear
clc

funcion = input('Introduce la funcion: ', 's');
fun = ['@(x) ', funcion];
f = str2func(fun);

h = 1e-5;
d = @(x) (f(x + h) - f(x)) / h;

e = 10^-10;
num = 100;

raices = [];


for l = -100 : 1 : 100
  k = 0;
  x(1) =l;
  i = 2;

while (k == 0)
  x(i) = x(i - 1) - (f(x(i - 1))/d(x(i - 1)));
  if (abs(x(i) - x(i - 1)) < e)
    r = x(i);

    if isempty(raices) || all(abs(raices - r) > e)
     raices = [raices, r];
    end

    k = 1;
  else
    if (i < num)
      i = i + 1;
    else
      print('El metodo no converge...');
      x(i)
      x(i-1)
      k = 1;
    end
  end
end
end


if ~isempty(raices)
    raices_unicas = unique(round(raices * 10^10) / 10^10);
    disp(raices_unicas);
else
    disp('No se encontraron raíces.');
end
