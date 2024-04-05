% Script to graph right and left traveling waves on a string 
% with both ends fixed.
% See MATLAB Exercise 8.16: Case Study - Plucked string filter
%
lambda = 1;
c = 0.2;
t = 0.1;
x = [0:0.01:1]*lambda;
modes = [1:4];
p1 = initPlots(x,t,c,lambda,modes,2); grid
for t=0.1:0.01:50
  updatePlots(p1,x,t,c,lambda,modes,2);
end

function p1 = initPlots(x,t,c,lambda,modes,type)
  [y1,y2,y] = computeSignals(x,t,c,lambda,modes);
  if type==1
    p1 = plot(x,y);
    set(p1,'LineWidth',1.5)
    title('$y\left(x,t\right)$','Interpreter','latex');
  else
    p1 = plot(x,y1,x,y2);
    set(p1(1),'LineWidth',1.5);
    set(p1(2),'LineWidth',1.5);
    title('$f\left(t-x/c\right)$ and $f\left(x+t/c\right)$','Interpreter','latex');
    %legend('$f\left(t-x/c\right)$','$f\left(t+x/c\right)$','Interpreter','latex')
  end
  axis([0,lambda,-3,3]);
  xlabel('$x\longrightarrow$','Interpreter','latex');
  ylabel('Amplitude','Interpreter','latex');
end

function updatePlots(p1,x,t,c,lambda,modes,type)
  [y1,y2,y] = computeSignals(x,t,c,lambda,modes);
  if (type==1)
    set(p1,'YData',y);
  else
    set(p1(1),'YData',y1);
    set(p1(2),'YData',y2);
  end
  drawnow;
end

function [y1,y2,y] = computeSignals(x,t,c,lambda,modes)
  coeff = [0.34213,0.64784,0.88583,1.03424,1.08352,1.03729];
  y1 = zeros(size(x));
  y2 = zeros(size(x));
  for k=modes
    y1 = y1+coeff(k)*f1(x,t,c,lambda,k);
    y2 = y2+coeff(k)*f2(x,t,c,lambda,k);
  end
  y = y1+y2;
end

function y = f1(x,t,c,lambda,k)
  omg0 = k*pi*c/lambda;
  y = -0.5*sin(omg0*(t-x/c));
end

function y = f2(x,t,c,lambda,k)
  omg0 = k*pi*c/lambda;
  y = 0.5*sin(omg0*(t+x/c));
end