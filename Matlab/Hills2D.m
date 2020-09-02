[x,y] = meshgrid(-2:.5:2, -2:.5:2);
z = x.*exp(-x.^2-y.^2);

ti = -2:.1:2;
[qx,qy] = meshgrid(ti,ti);

qz= interp2(x,y,z,qx,qy,'cubic');

mesh(qx,qy,qz); hold on;
plot3(x,y,z,'o'); hold off;
