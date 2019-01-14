function [LL] = NlaguerreL(n,a,X)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%          Laguerre Polynomials evaluated at a certain X for any N(radial)
%               and A(azimuthal)
%          Manuel Ferrer, 2018
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


LL=0;
for m=0:n

LL=LL+((-1)^m).*(factorial(n+a))/(factorial(n-m)*factorial(a+m)*factorial(m)).*(X.^m);

end

end