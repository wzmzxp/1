A=rand(100,1);

fid=fopen('shuju_n.txt','w');
for i=1:max(size(A))
    fprintf(fid,'%f\n',A(i,1));%全部在一行，换行失败
end
fclose(fid);

fid=fopen('shuju_r.txt','w');
for i=1:max(size(A))
    fprintf(fid,'%f\r',A(i,1));%全部在一行，换行失败
end
fclose(fid);

fid=fopen('shuju_rn.txt','w');
for i=1:max(size(A))
    fprintf(fid,'%f\r\n',A(i,1));%换行成功
end
fclose(fid);

fid=fopen('shuju_rt.txt','wt');
for i=1:max(size(A))
    fprintf(fid,'%f\r',A(i,1));%换行失败
end
fclose(fid);
fid=fopen('shuju_tn.txt','wt');
for i=1:max(size(A))
    fprintf(fid,'%f\n',A(i,1));%换行成功
end
fclose(fid);

fid=fopen('shuju_trn.txt','wt');
for i=1:max(size(A))
    fprintf(fid,'%f\r\n',A(i,1));%换行成功
end
fclose(fid);

