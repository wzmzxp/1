% clear all
D=10;
Xmin=-100;
Xmax=100;
NP=30;
Iter_max=10000;
Runs=51;
Fhd=str2func('cec13_func');
vysl=zeros(28,6);

fxstar = zeros(1, 28);
fxstar(1,1:14)= -1400:100:-100;
fxstar(1,15:28)= 100:100:1400;

od=1;
do=28;

for func_num=od:do
    func_num
    ff=fxstar(func_num);
    tabulka=zeros(11,Runs);
    for j=1:Runs
            [e01,e1,e2,e3,e4,e5,e6,e7,e8,e9,efin]= DE_b6e6rl_zkr(Fhd,ff,D,NP,Iter_max,Xmin,Xmax,func_num);
            e=[e01,e1,e2,e3,e4,e5,e6,e7,e8,e9,efin];
            e=e';   
            tabulka(:,j)=e;
    end
%     fxst=ones(11,Runs);
%     fxst=ff*fxst;
%     tabulka=tabulka-fxst;
    soubor=strcat('b6e6rl_fce',num2str(func_num),'_D',num2str(D),'_NP',num2str(NP),'_Runs',num2str(Runs),'.txt');
    fid = fopen (soubor, 'wt');
%     fprintf(fid,'%14.6g \n', tabulka');
    fprintf(fid,'%14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g %14.6g \n', tabulka');
    
    
    fclose(fid);

    vyslpom=zeros(1,6);
    pomocny=tabulka(11,:);
    vyslpom(1,1)=func_num;
    vyslpom(1,2)=min(pomocny);
    vyslpom(1,3)=max(pomocny);
    vyslpom(1,4)=median(pomocny);
    vyslpom(1,5)=mean(pomocny);
    vyslpom(1,6)=std(pomocny);
 
%     jm_vyslcast=strcat('b6e6rl_NP',num2str(NP),'_D',num2str(D),'_Runs',num2str(Runs),'_fce',num2str(func_num));
%     save(jm_vyslcast, 'vyslpom');
    vysl(func_num,:)=vyslpom;
end
jm_vysl=strcat('b6e6rl_NP',num2str(NP),'_D',num2str(D),'_Runs',num2str(Runs),'_fce',num2str(od),'_az',num2str(do));
save(jm_vysl, 'vysl');
