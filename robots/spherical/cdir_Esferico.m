% 3. Robot Esférico (RRP)
function [Px, Py, Pz] = cdir_Esferico(q1, q2, d3, l1, beta1, beta2)
    H1_0 = Hrz(q1) * Htz(l1+beta1) * Htx(0) * round(Hrx(-90));
    H2_1 = Hrz(q2) * Htz(beta2) * Htx(0) * round(Hrx(90));
    H3_2 = Hrz(0) * Htz(d3) * Htx(0) * round(Hrx(0));
    
    H3_0 = H1_0 * H2_1 * H3_2;
    
    Px = H3_0(1,4); 
    Py = H3_0(2,4); 
    Pz = H3_0(3,4);
end