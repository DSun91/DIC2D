function [ U, V ] = Lucas_kanade( foto1, foto2,dim_fin,trasf,x_off_set,y_off_set) 
%#codegen
ordy=size(foto1,1);
ordx=size(foto2,2);


x_fin=dim_fin;

dx=round(x_fin/2);
if (x_off_set<dx)
    x_off_set=dx+1;
end
if (y_off_set<dx)
    y_off_set=dx+1;
end


fx=derivata_x(foto1);
fy=derivata_y(foto1);
[ft, aa]=derivata_tt(foto1,foto2,ordx,ordy);
%ft=derivata_t(foto1,foto2,ordx,ordy);
U=zeros(ordy,ordx);

V=zeros(ordy,ordx);
n=dim_fin*dim_fin;
A=zeros(n,6);
b=zeros(1,n);

m=1;


for i=y_off_set:ordy-y_off_set
for j=x_off_set:ordx-x_off_set                       

    %% carico matrice A
    for k=-(dx-1):(dx-1)
   for l=-(dx-1):(dx-1)
             
   if(trasf==1)         
    A(m,1)=aa*fx(i+k,j+l)*k;
    A(m,2)=aa*fx(i+k,j+l)*l;
    A(m,3)=aa*fx(i+k,j+l);
    A(m,4)=aa*fy(i+k,j+l)*k;
    A(m,5)=aa*fy(i+k,j+l)*l;
    A(m,6)=aa*fy(i+k,j+l);
   
    b(m)=ft(i+k,j+l);   
      m=m+1;
   end
   
    if(trasf==2)
        %aa(i+k,j+l)*
    A(m,1)=aa*fx(i+k,j+l);
    A(m,2)=aa*fy(i+k,j+l);
     b(m)=ft(i+k,j+l);
%     b(m)=aa*foto2(i+k,j+l)+bb-foto1(i+k,j+l);
      m=m+1;
    end
       
   end
    end
    
     m=1;    
  
   

E=(transpose(A))*transpose(b);
D= pinv(transpose(A)*A);
C= D * E;
if(trasf==1)
% U(i,j)=(C(1)*j+C(2)*i+C(3));
%U(i+dx,j+dx)=C(3);
U(i,j)=C(3);
% V(i,j)=(C(4)*j+C(5)*i+C(6));
%V(i+dx,j+dx)==C(6);
V(i,j)=C(6);
else if(trasf==2)
U(i,j)=C(1);
V(i,j)=C(2);
    end
end
end 
end
%quiver(U,V)

end
