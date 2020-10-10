function A = derivata_x(matrice1)
%#codegen
 f = [-1 0 1;
     -2 0 2;
     -1 0 1];
 f=f.*1/8;
 A=conv2(matrice1,f,'same');
end

%  M=[-1,3,-3,1;2,-5,4,-1;-1,0,1,0;0,2,0,0]*0.5;
% u = [0.125;0.25;0.5;1];
% up = [0.75;1;1;0];
% d=up'*M;
% k=u'*M;
%   A=-conv2(conv(k,k),conv(d,k),matrice1,'same');

