% --- Cinemática Inversa (Robot Cartesiano PPP) ---
function [d1, d2, d3] = cinv_Cartesiano(l1, Px, Py, Pz)
    d1 = Px;
    d2 = Py;
    d3 = l1 - Pz; 
end