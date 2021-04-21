% Code by Guanchun Li and A. Donev
clear % ALWAYS do this at the beginning (avoid clear all)
format long; format compact % Print more digits without white space
close all; % Close all figures

global use_toolbox; % Should we use the curve fitting toolbox?
use_toolbox = true; % Set to 1 to use csape, otherwise use spline

res = 0.01; % How closely to space points on the curve when rendering
            % In a real rendering system this would depend on the resolution

%% Worksheet 8 1.1 Script letter S
t = 0:6;
x = [1, 2, 3, 2, 1.2, 2, 2.7];
y = [1, 0, 1, 2.5, 3.4, 4, 3.2];
fit_letter(t, x, y, res);

%% Worksheet 8 1.2 Mystery script letter
t = 0:11;
x = [3, 1.75, 0.90, 0, 0.50, 1.50, 3.25, ...
     4.25, 4.25, 3, 3.75, 6.00];
y = [4, 1.60, 0.50, 0, 1.00, 0.50, 0.50, ...
     2.25, 4.00, 4, 3.25, 4.25];
fit_letter(t, x, y, res);

%% Worksheet 8 1.3 Diffucult letters (O and Z)
% Letter O
n_pts = 8;
t = 0:n_pts-1;
% Make the first point here be pi/4 to make the problem more obvious
theta = pi/4 + linspace(0, 2*pi, n_pts);
% Use an ellipse to get a letter
x = 1 + 0.75*cos(theta);
y = 1 + sin(theta);
fit_letter(t, x, y, res, false); % Aperiodic
if(use_toolbox) title('Natural spline'); end
fit_letter(t, x, y, res, true); % Periodic
if(use_toolbox) title('Periodic spline'); end

% Letter Z
t = 0:6;
x = [0, 1.5, 3, 1.5, 0, 1.5, 3];
y = [4, 4, 4, 2, 0, 0, 0];
fit_letter(t, x, y, res);

%% Aux functions
function fit_letter(t, x, y, res, periodic, t_flag)

   global use_toolbox;

   if nargin < 5
       periodic = false; 
   end
   if nargin < 6
       t_flag = false; 
   end
   
   t_fine = t(1):res:t(end);

   if(use_toolbox)
      % Use the curve fitting toolbox
      % Interpolate the x, y v.s. t with natural or periodic cubic spline
      if(periodic)      
         PX = csape(t, x, 'periodic');
         PY = csape(t, y, 'periodic');
      else
         PX = csape(t, x, 'variational');
         PY = csape(t, y, 'variational');
      end   

      % Got the values of x, y on fine grid of t
      x_fine = fnval(PX, t_fine);
      y_fine = fnval(PY, t_fine);
      
   else
      % Use MATLAB built-in (not-a-knot) spline
      % Interpolate the x, y v.s. t with cubic spline
      % One can also do spline(t, x, t_fine) in one line
      PX = spline(t, x);
      PY = spline(t, y);
   
      % Get the values of x, y on fine grid of t
      x_fine = ppval(PX, t_fine);
      y_fine = ppval(PY, t_fine);
   end
   
   % Plot out the letter (y v.s. x)
   figure();
   plot(x_fine, y_fine); % Smooth line
   hold on;
   plot(x, y, 'k*'); % Control points on the letter
   axis equal;

   % Extra: Plot x, y v.s. t
   if t_flag
       figure();
       plot(t_fine, x_fine);
       hold on;
       plot(t_fine, y_fine);
       plot(t, x, 'k*');
       plot(t, y, 'k*');
       legend('x', 'y');
       xlabel('t');
       ylabel('x & y');
   end

end
