n=10;
x=linspace(-5,5,n);
y=(1+x.^2).^(-1);
plot(x,y,'ro'); hold on;

x_fine=linspace(-5,5,100);
y_fine=(1+x_fine.^2).^(-1);
plot(x_fine,y_fine,'b-');

c=polyfit(x,y,n);
y_interp=polyval(c,x_fine);
plot(x_fine,y_interp,'k--');

y_interp=interp1(x,y,x_fine,'spline');
plot(x_fine,y_interp,'k--');
% Or equivalently:
pp=spline(x,y);
y_interp=ppval(pp,x_fine)
