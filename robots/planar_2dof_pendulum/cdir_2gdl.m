function [Px, Py, Pz] = cdir_2gdl(theta1, theta2, l1, l2, beta1, beta2)
    % theta1 y theta2 ingresan en GRADOS.
    H1_0 = Hrz(theta1) * Htz(beta1) * Htx(l1) * round(Hrx(0));
    H2_1 = Hrz(theta2) * Htz(beta2) * Htx(l2) * round(Hrx(0));
    
    H2_0 = H1_0 * H2_1;
    
    Px = H2_0(1,4); 
    Py = H2_0(2,4); 
    Pz = H2_0(3,4);
end