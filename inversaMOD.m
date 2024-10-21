% Inversa de una matriz nxn mediante eliminación de Gauss

n = input('Ingrese la dimensión de la matriz: ');
A = zeros(n, n);
disp('Ingrese los elementos de la matriz A:');
for i = 1:n
    for j = 1:n
        A(i,j) = input(' ');
    end
end

B = A;

% Determinante
d = 1;
cambio = 0;
for i = 1:n-1
    % Cambio de filas
    if (A(i,i) == 0)
        AUX = A(i,:);
        cen = 0;
        for j = i+1:n
            if (A(j,i) ~= 0 && cen == 0)
                A(i,:) = A(j,:);
                A(j,:) = AUX;
                cen = 1;
                cambio = cambio + 1;
            end
        end
        if cen == 0
            d = 0;
        end
    end

    d = d * A(i,i);
    p = A(i,i);
    for j = 1:n
        A(i,j) = A(i,j) / p;
    end
    for j = i+1:n
        f = -A(j,i);
        for k = i:n
            A(j,k) = A(j,k) + f * A(i,k);
        end
    end
end

if d ~= 0
    d = d * A(n,n);
    if (mod(cambio,2) ~= 0)
        d = -d;
    end
    disp(['El determinante es: ', num2str(d)]);
else
    disp('El determinante es 0, la matriz no es invertible.');
end

% Reiniciar A
A = B;

% Inversa

% Creación de identidad
if (d ~= 0)
    C = eye(n);

    for i = 1:n
        guardar = 0;
        cen1 = 0;

        % Cambio de filas
        if (A(i,i) == 0)
            AUX1 = A(i,:);
            for j = i+1:n
                if (A(j,i) ~= 0 && cen1 == 0)
                    A(i,:) = A(j,:);
                    A(j,:) = AUX1;
                    Aux2 = C(i,:);
                    C(i,:) = C(j,:);
                    C(j,:) = Aux2;
                    cen1 = 1;
                end
            end
            if cen1 == 0
                disp('La matriz no tiene inversa.');
            end
        end

        p = A(i,i);
        % Fila de la matriz A
        for j = 1:n
            A(i,j) = A(i,j) / p;
            C(i,j) = C(i,j) / p;
        end

        j = 1;
        while (j <= n)
          if ((j ~= n) || (i ~= j))
            if (j ~= i)
                f = -A(j,i);
                for k = i:n
                    A(j,k) = A(j,k) + f * A(i,k);
                end
                for k = 1:n
                    C(j,k) = C(j,k) + f * C(i,k);
                end
            end
          end
          j = j+1;
        end
    end
    disp(C);
else
    disp('La matriz no tiene inversa.');
end

