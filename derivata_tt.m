function [A,aa] = derivata_tt(matrice1,matrice2,ordx,ordy)
%#codegen
n=ordx*ordy;
   
num=0;
den=0;    

temp_med_1=sum(matrice1(:));
temp_med_2=sum(matrice2(:));
           Fm=temp_med_1/n;
           Gm=temp_med_2/n;
           
for i=1:ordy
    for j=1:ordx 
            den=den+(matrice2(i,j)-Gm)^2;
            num=num+((matrice1(i,j)-Fm)*(matrice2(i,j)-Gm));
          
    end
end          
           aa=num/den;
           bb=Fm-(aa*Gm); 
   
    A=matrice2.*aa+bb-matrice1;
   
end
   



