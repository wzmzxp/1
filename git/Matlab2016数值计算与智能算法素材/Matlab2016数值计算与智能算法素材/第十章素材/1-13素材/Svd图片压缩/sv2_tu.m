clear
clc
%% 一段废代码
you=input('你是美女还是帅哥：(有惊喜哦)','s');
switch you
    case '美女'
        a=imread('ting.jpg');
    case '帅哥'
        a=imread('timg.jpg');
end

h=imshow(a);
pause(3);
text(100,300,'看够了，我要关了，接着算了','fontsize',20);
pause(2);
close
%% 
A1=double(a(:,:,1));
A2=double(a(:,:,2));
A3=double(a(:,:,3));
[u1,s1,v1]=svd(A1);
[u2,s2,v2]=svd(A2);
[u3,s3,v3]=svd(A3);
bz1=0;
bz2=0;
bz3=0;
for i=1:min(size(s1))
    S1=sum(diag(s1));
    S2=sum(diag(s2));
    S3=sum(diag(s3));
    bz1=bz1+s1(i,i);
    bz2=bz2+s2(i,i);
    bz3=bz3+s3(i,i);
    if bz1/S1>0.9 & bz2/S2>0.9 & bz3/S3>0.9
        break;
    end
end
A11=0;
A22=0;
A33=0;
for j=1:i
    A11=A11+s1(j,j)*u1(:,j)*(v1(:,j)');
    A22=A22+s2(j,j)*u2(:,j)*v2(:,j)';
    A33=A33+s3(j,j)*u3(:,j)*v3(:,j)';
end
%整型
A(:,:,1)=uint8(A11);
A(:,:,2)=uint8(A22);
A(:,:,3)=uint8(A33);
imshow(A)
text(100,300,'我压缩了，你还看得清吗','fontsize',20);  