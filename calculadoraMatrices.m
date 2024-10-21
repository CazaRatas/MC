%Calculadora de matrices

clear;
clc;

while true
    disp('1. Suma de matrices');
    disp('2. Multiplicación de matrices');
    disp('3. Determinante de una matriz');
    disp('4. Inversa de una matriz');
    disp('5. Salir');
    opcion = input('Seleccione una opción (1-5): ');

    switch opcion
        case 1
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

        case 2
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

        case 3
          %Determinante de una matriz superior
          clear
          clc

          disp('------------------------------------');
          n = input('Ingrese el orden de la matriz: ');

          for i = 1 : 1 : n
              for j = 1 : 1 : n
                  A(i,j) = input(' ');
              end
          end

          d = 1;
          cambio = 0;
          for i = 1 : 1 : n-1
            %Cambio de filas
            if (A(i,i) == 0)
              AUX = A(i,:);
              cen = 0;
              for j = i+1 : 1 : n
                if(A(j,i) ~= 0 & cen == 0)
                  A(i,:) = A(j,:);
                  A(j,:) = AUX;
                  cen = 1;
                  cambio =cambio + 1;
                else
                  cen = 0;
                end
              end
            end

              d = d * A(i,i);
              p = A(i,i);
              for j = 1 : 1 : n
                  A(i,j) = A(i,j) / p;
              end
              for j = i + 1 : 1 : n
                  f = -A(j,i);
                  for k = i : 1 : n
                      A(j,k) = A(j,k) + f * A(i,k);
                  end
              end
          end
          d = d * A(n,n);

          if(mod(cambio,2)~=0)
            d = -d
          else
            d
          end

        case 4
          %Inversa de una matriz

          n = input('Ingrese la dimension de la matriz: ');
          for i = 1 : 1 : n
            for j = 1 : 1 : n
              A(i,j) = input (' ');
            end
          end

          B = A;

          %Determinante
          d = 1;
          cambio = 0;
          for i = 1 : 1 : n-1
              %Cambio de filas
              if (A(i,i) == 0)
                AUX = A(i,:);
                cen = 0;
                for j = i+1 : 1 : n
                  if(A(j,j) ~= 0 & cen == 0)
                    A(i,:) = A(j,:);
                    A(j,:) = AUX;
                    cen = 1;
                    cambio =cambio + 1;
                  else
                    cen = 0;
                  end
                end
              end

              d = d * A(i,i);
              p = A(i,i);
              for j = 1 : 1 : n
                  A(i,j) = A(i,j) / p;
              end
              for j = i + 1 : 1 : n
                  f = -A(j,i);
                  for k = i : 1 : n
                      A(j,k) = A(j,k) + f * A(i,k);
                  end
              end
          end
          d = d * A(n,n);
          if(mod(cambio,2)~=0)
            d = -d
          else
            d
          end

          A = B;

          %Inversa

          %Creacion de identidad
          if (d ~= 0)
            for i = 1 : 1 : n
              for j = i : 1 : n
                if (i == j)
                  C(i,j) = 1;
                else
                  C(i,j) = 0;
                end
              end
            end



            for i = 1 : 1 : n
              p = A(i,i);
              %fila de la matriz A
              for j = 1 : 1 : n
                A(i,j) = A(i,j) / p;
              end


              %Fila de la matriz C
              for j = 1 : 1 : n
                C(i,j) = C(i,j) / p;
              end
              j = 1;

              while (j <=  n)
                if ((j ~= n) || (i ~= j))
                  if (i ~= j)
                    f = -A(j,i);
                    for k = i : 1 : n
                      A(j,k) = A(j,k) + f * A(i,k);
                    end
                    for k = 1 : 1 : n
                      C(j,k) = C(j,k) + f*C(i,k);
                    end
                  end
                end
                j = j+1;
              end
            end
            A
            C
          else
            disp('La matriz no tiene inversa');
          end

        case 5
            % Salir del programa
            disp('---------');
            break;

        otherwise
            disp('Opción no válida....');
    end
    pause;
    clc;
end


