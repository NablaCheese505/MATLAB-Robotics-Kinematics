% 1. Robot Antropomórfico (3 GDL)
function [Px, Py, Pz] = cdir_Antropomorfico(q1, q2, q3, l1, l2, l3, beta1, beta2, beta3)
    H1_0 = Hrz(q1) * Htz(l1+beta1) * Htx(0) * round(Hrx(90));
    H2_1 = Hrz(q2) * Htz(beta2) * Htx(l2) * round(Hrx(0));
    H3_2 = Hrz(q3) * Htz(beta3) * Htx(l3) * round(Hrx(0));
    
    H3_0 = H1_0 * H2_1 * H3_2;
    
    Px = H3_0(1,4); 
    Py = H3_0(2,4); 
    Pz = H3_0(3,4);
end