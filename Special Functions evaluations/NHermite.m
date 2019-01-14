function [ H] = NHermite(n,X)

H0=1;
H1=2.*X; 

Hn1=ones(size(X));
H=2.*X; 

if n<0  
    error('The index must be 0 or positive')
elseif n==0
    H=H0;
elseif n==1
    H=H1;
else 
    for nn=2:n
        Hn=2.*X.*H-2.*(nn-1).*Hn1; 
        Hn1=H;
        H=Hn;       
    end
end
end

