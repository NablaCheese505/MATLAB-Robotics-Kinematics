function q = drawFrame(H, scale)
    % drawFrame Dibuja un sistema de referencia X, Y, Z a partir de una matriz H
    % Uso: drawFrame(H, escala)
    
    % Si no se proporciona una escala, usar 0.15 por defecto
    if nargin < 2
        scale = 0.15;
    end

    % 1. Extraer el Origen
    O = H(1:3, 4); 
    
    % 2. Extraer los Vectores Directores
    X_axis = H(1:3, 1) * scale;
    Y_axis = H(1:3, 2) * scale;
    Z_axis = H(1:3, 3) * scale;
    
    % 3. Dibujar las 3 flechas simultáneamente
    q = quiver3(...
        [O(1), O(1), O(1)], [O(2), O(2), O(2)], [O(3), O(3), O(3)], ... 
        [X_axis(1), Y_axis(1), Z_axis(1)], ... 
        [X_axis(2), Y_axis(2), Z_axis(2)], ... 
        [X_axis(3), Y_axis(3), Z_axis(3)], ... 
        0, 'LineWidth', 2, 'MaxHeadSize', 0.5);
        
    % 4. --- MEJORA DE ETIQUETAS X, Y, Z ---
    t_scale = 1.15; % Lo acercamos un poquito más a la flecha
    
    % Paquete de estilo más refinado y minimalista
    txt_props = {'FontWeight', 'bold', ...
                 'FontSize', 7, ...             % Letra más pequeña
                 'HorizontalAlignment', 'center', ...
                 'VerticalAlignment', 'middle', ...
                 'BackgroundColor', 'w', ...
                 'Margin', 0.1};                % Margen microscópico para no tapar líneas
    
    % Dibujar las etiquetas
    text(O(1) + X_axis(1)*t_scale, O(2) + X_axis(2)*t_scale, O(3) + X_axis(3)*t_scale, 'X', txt_props{:});
    text(O(1) + Y_axis(1)*t_scale, O(2) + Y_axis(2)*t_scale, O(3) + Y_axis(3)*t_scale, 'Y', txt_props{:});
    text(O(1) + Z_axis(1)*t_scale, O(2) + Z_axis(2)*t_scale, O(3) + Z_axis(3)*t_scale, 'Z', txt_props{:});
end