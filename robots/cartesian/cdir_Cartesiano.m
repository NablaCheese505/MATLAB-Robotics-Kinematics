function [Px, Py, Pz] = cdir_Cartesiano(d1, d2, d3, l1)
    % Las variables d1, d2, d3 y l1 ingresan en unidades de longitud
    H1_0 = round(Hrz(90)) * Htz(l1) * Htx(0) * round(Hrx(90));
    H2_1 = round(Hrz(90)) * Htz(d1) * Htx(0) * round(Hrx(90));
    H3_2 = round(Hrz(90)) * Htz(d2) * Htx(0) * round(Hrx(-90));
    H4_3 = round(Hrz(0)) * Htz(d3) * Htx(0) * round(Hrx(0));
    
    H4_0 = H1_0 * H2_1 * H3_2 * H4_3;
    
    Px = H4_0(1,4); 
    Py = H4_0(2,4); 
    Pz = H4_0(3,4);
end