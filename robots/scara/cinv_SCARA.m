function [q1, q2, d3] = cinv_SCARA(l1, l2, l3, beta1, beta2, Px, Py, Pz)
    [q1, q2] = cinv_r2gdl(l2, l3, Px, Py);
    d3 = l1 + beta1 + beta2 - Pz;
    q1 = real(q1);
    q2 = real(q2);
    d3 = real(d3);
end