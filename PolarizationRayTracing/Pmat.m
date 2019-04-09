function P = Pmat(ki,ko, eta, J )
% Polarization ray tracing matrix creation
% kin  - Incident propagation vector
% kout - Out propagation vector
% eta  - Normal surface vector
% J    - 2x2 Jones Matrix 

Sin=cross(ki,eta)/norm(cross(ki,eta)); 
Pin=cross(ki,Sin);

Sout=cross(ko,eta)/norm(cross(ko,eta)); 
Pout=cross(ko,Sin);

Jex=[[J,[0;0]];[0,0,1]];


Oi=[Sin; Pin; ki];
Oo=[transpose(Sout), transpose(Pout), transpose(ko)];


P=Oo*Jex*Oi; 












end

