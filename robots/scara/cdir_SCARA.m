% 2. Robot SCARA (RRP)
function [Px, Py, Pz] = cdir_SCARA(q1, q2, d3, l1, l2, l3, beta1, beta2)
    % q1 y q2 ingresan en GRADOS, d3 en unidades de longitud (m, cm)
    H1_0 = Hrz(q1) * Htz(l1+beta1) * Htx(l2) * round(Hrx(0));
    H2_1 = Hrz(q2) * Htz(beta2) * Htx(l3) * round(Hrx(180));
    H3_2 = Hrz(0) * Htz(d3) * Htx(0) * round(Hrx(0));
    
    H3_0 = H1_0 * H2_1 * H3_2;
    
    Px = H3_0(1,4); 
    Py = H3_0(2,4); 
    Pz = H3_0(3,4);
end