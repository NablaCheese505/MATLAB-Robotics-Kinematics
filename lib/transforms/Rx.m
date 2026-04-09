% Robotica
% Funcion matriz de rotación Rx(theta)

function R=Rx(ang)
    dato=whos('ang');
    if strcmp(dato.class,'sym') %para variables simbolicas
        R =  simplify([1, 0, 0; ...
            0, cos(ang), -sin(ang); ...
            0, sin(ang), cos(ang)]);
    else
        theta=deg2rad(ang);
        R = [1, 0, 0; ...
            0, cos(theta), -sin(theta); ...
            0, sin(theta), cos(theta)];
    end
end