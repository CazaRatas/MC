%BISECCION

clear
clc

funcion = input('Introduce la funcion: ', 's');
fun = ['@(x) ', funcion];
f = str2func(fun);
e = 10^-10;
max = 100;
raices = [];

for h = -100 : 0.1 : 100
  a = h;
  b = h + 0.1;
  if(f(a)*f(b) <= 0)
    iteracion = 0;
    k = 0;
    while ((k == 0)&&(iteracion <max))
      c = (a + b) / 2;
      if (f(a) * f(c) <= 0)
        if (f(a) * f(c) == 0)
          if (f(a) == 0)
            r = a;
          else
            r = c;
          end

          if isempty(raices) || all(abs(raices - r) > e)
             raices = [raices, r];
          end

          k = 1;
        else
          b = c;
        end
      else
          a = c;
      end


      if (k == 0)
        if(f(a)*f(b) < 0)
          if (abs(b - a) < e)
            %if(f(a)*f(b)< 10^-10)
            r = (a + b) / 2;
            if isempty(raices) || all(abs(raices - r) > e)
               raices = [raices, r];
            end
            k = 1;
            %end
          end
        end
      end
    iteracion = iteracion +1 ;
    end
  end
end

if ~isempty(raices)
    raices_unicas = unique(round(raices * 1e10) / 1e10);
    disp(raices_unicas);
else
    disp('No se encontraron raíces.');
end


