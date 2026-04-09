function [q1, q2, q3] = cinv_R3gdl(B1, B2, B3, l1, l2, l3, x0, y0, z0, codo)
    % codo = 1  -> Codo Abajo (Solución con raíz positiva)
    % codo = -1 -> Codo Arriba (Solución con raíz negativa)
    
    % Si el usuario no manda el parámetro de codo, asumimos codo abajo por defecto
    if nargin < 10
        codo = 1;
    end

    x0 = real(x0); y0 = real(y0); z0 = real(z0);
    
    % --- Cálculo de q3 (Codo) ---
    cos_q3 = (x0.^2 + y0.^2 + (z0-l1-B1).^2 - l2^2 - l3^2 - (B2+B3)^2) / (2*l2*l3);
    
    % AQUÍ ESTÁ LA MAGIA: Multiplicamos por la variable 'codo' (+1 o -1)
    sen_q3 = codo * sqrt(1 - cos_q3.^2); 
    
    q3 = atan2d(sen_q3, cos_q3);
    
    % --- Cálculo de q2 (Hombro) ---
    ang_aux2 = atan2d(l3*sind(q3), l2 + l3*cosd(q3));
    q2 = atan2d(z0-l1-B1, sqrt(x0.^2 + y0.^2 - (B2+B3)^2)) - ang_aux2;
    
    % --- Cálculo de q1 (Base) ---
    ang_aux1 = atan2d(B2+B3, sqrt(x0.^2 + y0.^2 - (B2+B3)^2));
    q1 = atan2d(y0, x0) + ang_aux1;
    
    q1 = real(q1); q2 = real(q2); q3 = real(q3);
end