% Función de Cinemática Inversa robot 2GDL
function [q1, q2] = cinv_r2gdl(l1, l2, x, y)
    cos_q2 = (x.^2 + y.^2 - l1.^2 - l2.^2) / (2 * l1 * l2);
    q2 = acosd(cos_q2); 
    q1 = atan2d(y, x) - atan2d(l2 * sind(q2), l1 + l2 * cosd(q2));
end