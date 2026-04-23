% 4. Robot Cilíndrico (RPP)
function [Px, Py, Pz] = cdir_Cilindrico(q1, d2, d3, l1, beta1)
    % q1 ingresa en GRADOS, d2 y d3 en unidades de longitud (m, cm)
    H1_0 = Hrz(q1) * Htz(l1+beta1) * Htx(0) * round(Hrx(0));
    H2_1 = Hrz(0) * Htz(d2) * Htx(0) * round(Hry(90));
    H3_2 = Hrz(0) * Htz(d3) * Htx(0) * round(Hrx(0));
    
    H3_0 = H1_0 * H2_1 * H3_2;
    
    Px = H3_0(1,4); 
    Py = H3_0(2,4); 
    Pz = H3_0(3,4);
end