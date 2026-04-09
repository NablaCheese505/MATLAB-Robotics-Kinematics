function [q1, q2, d3] = cinv_Esferico(l1, beta1, beta2, Px, Py, Pz)
    % cinv_Esferico: Cinemática Inversa para Robot Esférico (RRP)
    % Basado en el desarrollo analítico por tangentes.
    
    % Forzar valores reales
    Px = real(Px); Py = real(Py); Pz = real(Pz);
    
    % --- 1. Cálculo de q1 (Base) ---
    % Como vimos en tus apuntes: q1 = atan(Y/X) - atan(B2/ca)
    % Donde ca (cateto adyacente) = sqrt(X^2 + Y^2 - B2^2)
    ca = sqrt(Px^2 + Py^2 - beta2^2);
    q1 = atan2d(Py, Px) - atan2d(beta2, ca);
    
    % --- 2. Cálculo de q2 (Elevación) ---
    % q2 = pi/2 - atan((Z - L1 - B1) / sqrt(X^2 + Y^2 - B2^2))
    % Usamos 90 grados en lugar de pi/2 porque usamos atan2d (grados)
    q2 = 90 - atan2d((Pz - l1 - beta1), ca);
    
    % --- 3. Cálculo de d3 (Extensión Prismática) ---
    % d3 = sqrt((Z - L1 - B1)^2 + X^2 + Y^2 - B2^2)
    d3 = sqrt((Pz - l1 - beta1)^2 + Px^2 + Py^2 - beta2^2);
    
    q1 = real(q1);
    q2 = real(q2);
    d3 = real(d3);
end