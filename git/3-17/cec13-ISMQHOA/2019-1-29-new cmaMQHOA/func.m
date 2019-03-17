function y = func(x,DIM,funcNO)
global M
% M=orthm_generator(DIM);
switch (funcNO)
    case 1
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Griewank function% The global minima: f(x)=0
% % Position (0)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
n = DIM;
s=0;k=1;
for i=1:n
	s=x(i).^2+s;
	k=cos(x(i)/sqrt(i))*k;
end
	s=s/4000;
	y=s-k+1;


% end

    case 2
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Rosenbrock function
% % The global minima: f(x)=0
% % Position (1)
% % DIM>1
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
n = DIM;
sum = 0;
for j = 1:n-1
    sum = sum+100*(x(j)^2-x(j+1))^2+(x(j)-1)^2;
end
y = sum;

% 

    case 3
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Sphere function 
% % The global minima: f(x)=0
% % Position (0)
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
n = DIM;
s = 0;
for j = 1:n
    s = s+x(j)^2; 
end
y = s;
% 
    case 4
% %%%%%%%%%%%%%%%%%%%
% Rastrigin function
% The global minima: f(x)=0
% Position (0)
% %%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
n = DIM; 
s = 0;
for j = 1:n
    s = s+(x(j)^2-10*cos(2*pi*x(j))); 
end
y = 10*n+s;
% 



% 
    case 5
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Dixon and Price function.
% % The global minima: f(x)=0
% % Position (0)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
n = DIM;
s1 = 0;
for j = 2:n
    s1 = s1+j*(2*x(j)^2-x(j-1))^2;    
end
y = s1+(x(1)-1)^2;
% 
% 
    case 6
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Ackley function.
% % The global minima: f(x)=0
% % Position (0)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
n = DIM;
a = 20; b = 0.2; c = 2*pi;
s1 = 0; s2 = 0;
for i=1:n
   s1 = s1+x(i)^2;
   s2 = s2+cos(c*x(i));
end
y = -a*exp(-b*sqrt(1/n*s1))-exp(1/n*s2)+a+exp(1);

    case 7
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Levy function.
% % The global minima: f(x)=0
% % Position (1)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
n = DIM;
for i = 1:n
    z(i) = 1+(x(i)-1)/4; 
end
s = sin(pi*z(1))^2;
for i = 1:n-1
    s = s+(z(i)-1)^2*(1+10*(sin(pi*z(i)+1))^2);
end 
y = s+(z(n)-1)^2*(1+(sin(2*pi*z(n)))^2);

    case 8
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Zakharov function.
% % The global minima: f(x)=0
% % Position (0)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
n = DIM;
s1 = 0;
s2 = 0;
for j = 1:n
    s1 = s1+x(j)^2;
    s2 = s2+0.5*j*x(j);
end
y = s1+s2^2+s2^4;
% 
    case 9
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Sum Squares Function 
% % The global minima: f(x)=0
% % Position (0)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
n = DIM;
s = 0;
for j = 1:n  
    s=s+j*x(j)^2; 
end
y = s;



    case 10
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Alpine function
% % The global minima: f(x)=0
% % Position (0)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
n = DIM; 
s=0;
 for i = 1:DIM
        s = s + abs(x(i)*sin(x(i)) + 0.1*x(i));        
 end
 y=s;
%  
    case 11
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Schwefel function
% % The global minima: f(x)=0
% % Position (420.9687)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% function y = func(x,DIM)
n = DIM;
s=0;
for i=1:n
	m=sin(sqrt(abs(x(i))));
	s=x(i)*m+s;
end
	y=418.9829*n-s;

    case 12
% 5 Rotated Hyper-ellipsoid  nD xi=[-65.536,65.536] with f(0,...,0)=0 
% runs well when n=50
n = DIM; 
s=0;y=0;
for i=1:n
	for j=1:n
		s=s+x(j)^2;
	end
	y=y+s;
end	

    case 13
% 6 Ellipsoidal --nD---with f(1,2,...,n)=0 
% when D>= 11 the algorithm fails 
n = DIM; 
s=0;
for i=1:n 
	s=(x(i)-i).^2+s;
end
	y=s;
    
    case 14
% 7 Sum of different power nD -xi=[-1,1]  with f(0,...,0)=0 ========================OK
% slow down when n>=4 
n = DIM; 
s=0;
for i=1:n
	s=abs(x(i))^(i+1)+s;
end	
	y=s;
    
    
    
    
      case 15
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Griewank function% The global minima: f(x)=0
% % Position (0)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
x=x*M;
% x=x';
n = DIM;
s=0;k=1;
for i=1:n
	s=x(i).^2+s;
	k=cos(x(i)/sqrt(i))*k;
end
	s=s/4000;
	y=s-k+1;
      case 16
% %%%%%%%%%%%%%%%%%%%
% Rastrigin function
% The global minima: f(x)=0
% Position (0)
% %%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
x=x*M;
n = DIM; 
s = 0;
for j = 1:n
    s = s+(x(j)^2-10*cos(2*pi*x(j))); 
end
y = 10*n+s;
% 
      case 17
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Dixon and Price function.
% % The global minima: f(x)=0
% % Position (0)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
x=x*M;
n = DIM;
s1 = 0;
for j = 2:n
    s1 = s1+j*(2*x(j)^2-x(j-1))^2;    
end
y = s1+(x(1)-1)^2;
%   
 case 18
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Ackley function.
% % The global minima: f(x)=0
% % Position (0)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
x=x*M;
n = DIM;
a = 20; b = 0.2; c = 2*pi;
s1 = 0; s2 = 0;
for i=1:n
   s1 = s1+x(i)^2;
   s2 = s2+cos(c*x(i));
end
y = -a*exp(-b*sqrt(1/n*s1))-exp(1/n*s2)+a+exp(1);

    case 19
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Levy function.
% % The global minima: f(x)=0
% % Position (1)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
x=x*M;
n = DIM;
for i = 1:n
    z(i) = 1+(x(i)-1)/4; 
end
s = sin(pi*z(1))^2;
for i = 1:n-1
    s = s+(z(i)-1)^2*(1+10*(sin(pi*z(i)+1))^2);
end 
y = s+(z(n)-1)^2*(1+(sin(2*pi*z(n)))^2);
 case 20
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Schwefel function
% % The global minima: f(x)=0
% % Position (420.9687)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% function y = func(x,DIM)
x=x*M;
n = DIM;
s=0;
for i=1:n
	m=sin(sqrt(abs(x(i))));
	s=x(i)*m+s;
end
	y=418.9829*n-s;
case {21},
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Weierstrass's  function.
% % The global minima: f(x)=0
% % Position (0)
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x=x*M;
val=0;
n=size(x,2);
for i=1:n
    for k=0:20
        val=val+0.5^k*cos(2*pi*3^k*(x(i)+0.5));
    end
end
temp=0;
for k=0:20
    temp=temp+0.5^k*cos(2*pi*3^k*0.5);
end
 val=val-n*temp;
 y=val;

  case {22},
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % % Schwefel's p2.22 function.
% % % % The global minima: f(x)=0    100Î³¶È  100%  8.634534e-07
% % % % Position (0)
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=x*M;
n = DIM; 
s = 0;
s1=0;
s2=0;
s3=0;

for i = 1:n
     
        s1=s1+x(i).^2;
        s2=s2+(0.5*i*x(i)).^2;
        s3 =s3+(0.5*i*x(i)).^4; 
     
end
y = s1+s2+s3;
% 

case {23},
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Weierstrass's  function.
% % The global minima: f(x)=0
% % Position (0)
% % % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

val=0;
n=size(x,2);
for i=1:n
    for k=0:20
        val=val+0.5^k*cos(2*pi*3^k*(x(i)+0.5));
    end
end
temp=0;
for k=0:20
    temp=temp+0.5^k*cos(2*pi*3^k*0.5);
end
 val=val-n*temp;
 y=val;
 
 
 
 
case {24},
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Quadric function
% The global minima: f(x)=0
% Position (0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function y = func(x,DIM)
n = DIM; 
s=0;
s1 = 0;
 for i = 1:DIM
        for j=1:i
             s1 = s1+x(j); 
        end
        s=s+s1^2;
        s1=0;
 end
 y=s;
%  
end



