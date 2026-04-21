function [q1, d2, d3] = cinv_Cilindrico(l1, beta1, Px, Py, Pz)
    Px = real(Px); Py = real(Py); Pz = real(Pz);
    
    q1 = atan2d(Py, Px);
    d3 = sqrt(Px^2 + Py^2);
    d2 = Pz - l1 - beta1;
    
    q1 = real(q1); d2 = real(d2); d3 = real(d3);
end