clear
clc
%

global M
D=30; %���Ժ���ά��
% Xmin=-10; %����x��ռ�
% Xmax=10;
% 1	   2	3	        4	     5	   6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24
% 1Griewank	2Rosenbrock	3Sphere	4Rastrigin	5Dixon and price
% 6Ackley	7Levy	8Zakharvo	9Sumsqure	10Alpine
% 11Schwefel	12Rotated Hyper-ellipsoid	13?Ellipsoidal	14Sum of different power
%Rotated 15Griewank	 16Rastrigin	17Dixon and price	18Ackley	19Levy	20Schwefel
% 21Weierstress	22SchwefelP.22  23Weierstress	24quadric

Xmin=[-100 -5 -5.12 -5.12 -10 -32 -10 -5 -5.12 0 -500 -65.536 -100 -1 -100 -5.12 -10 -32 -10 -500 -0.5 -10 -0.5 -100]; %����ض���������ͬ�����±߽�
Xmax=[100  10  5.12  5.12  10  32   10 10 5.12 10 500 65.536   100 1 100 5.12 10 32 10 500 0.5 10 0.5 100];
M=orthm_generator(D);
iter_max=10000*D; %����������
runs=2; %�ظ�����
funcnum=length(Xmin); %���Ե��ڼ�������

Algstr={'mqhao_GI'};

for Algnum=[1];  %ѡȡʹ�õĲ����㷨(�ϱ�)
    namea=Algstr{Algnum};
    group=1;
    gr=40;
    popCishu=0;
    % for
    pop_size=group*gr;%��Ⱥ��
    namestr=['.\data\',Algstr{Algnum},['_result_D',num2str(D),'_P',num2str(pop_size),'_',datestr(now, 'yyyymmddHHMMSS')]];
    txtstr=[namestr,'.txt'];
    fp=fopen(txtstr,'w+');
    popCishu=popCishu+1;
    for i=1:funcnum   %ѡ����Ժ�����func.m����14����ά�������������ԣ�д��funcnum:funcnum
        func_num=i;  %iΪ���ú���ID
        %             fprintf('%s \n',datestr(now, 'yyyy/mm/dd|HH:MM:SS'));
        %             fprintf(fp,'%s \r\n',datestr(now, 'yyyy/mm/dd|HH:MM:SS'));
        for j=1:runs %jΪ���õ�ѭ������
            if Algnum==1
%                                                                          mqhao_with_subgroup1(Dimension,Particle_Number,g,gr,Max_Gen,VRmin,VRmax,varargin)

                [gbest,gbestval,Convergence,FES]= mqhao_GI(D,pop_size,group,gr,iter_max,Xmin(i),Xmax(i),func_num);
                
            end
            ConvergenceDate(i,:)=Convergence;
            tot_time(j) = toc;
            %                 xbest(i,:)=gbest;
            fbest(i,j)=gbestval;
            FESM(i,j)=FES;
            
            fprintf('Algorithm=%s,Fuc= f%d,  No. %d run, DIM=%d, Global minimum=%e. FE=%d, time=%d\n',namea,i,j,D,fbest(i,j),FES,toc);
            %                 fprintf('Xmin=%d,  Xmax= %d \n',Xmin(i),Xmax(i)); %��ʾ��ǰ�߽�
            %                 fprintf(fp,'Fuc= %d,  No. %d run, DIM=%d, Global minimum=%e. FE=%d, time=%d\r\n',i,j,D,fbest(i,j),FES,toc);
        end %�����㷨��������
        %�������Ļ��ʾ
        fprintf('---------------------------------------------------------------\n');
        %            fprintf('Repeat=%d, Mean FE=%1.2e,Meantime=%1.2e\n',runs,mean(FES),mean(tot_time));
        gbestV=fbest(i,:);
        
        badspot=0;
        for count= 1:runs
            if (gbestV(count)>1e-5)
                badspot=badspot+1.0;
            end
        end
        GDprocent=(1.0-badspot/runs);
        
        
        %     fprintf(fp,'Fuc= %d,%d,%d,%d-%d,%d,%d,%d,%d,%d,%1.2e\r\n',i,D,i,group,gr,mean(gbestV),min(gbestV),std(gbestV),mean(tot_time),mean(gfe), GDprocent);%?????????\r\n????????????????????????windows??????????????????
        %
        fprintf('MeanValue=%1.2e, BestValue=%1.2e, Std=%1.2e,sr=%e \r\n',mean(fbest(i,:)),min(fbest(i,:)),std(fbest(i,:)),GDprocent);
        %            fprintf('%s \n',datestr(now, 'yyyy/mm/dd|HH:MM:SS'));
        fp=fopen('subgroup.txt','a');
        
        fprintf(fp,'Alg=%d,MeanValue=%1.2e, BestValue=%1.2e, Std=%1.2e,sr=%e \r\n',Algnum,mean(fbest(i,:)),min(fbest(i,:)),std(fbest(i,:)),GDprocent);
        
        
        
        
        %            fprintf(fp,'---------------------------------------------------------------\r\n');
        %            fprintf(fp,'Repeat=%d, Mean FE=%1.2e,Meantime=%1.2e\r\n',runs,mean(FES),mean(tot_time));
        %            fprintf(fp,'MeanValue=%1.2e, BestValue=%1.2e, Std=%1.2e, \r\n',mean(fbest(i,:)),min(fbest(i,:)),std(fbest(i,:)));
        
    end %���Ժ�����������
    %����ֵ����
    
    for i=1:funcnum
        fbestall(popCishu,i)=min(fbest(i,:));
    end
    %��ֵ����
    for i=1:funcnum
        fmeanall(popCishu,i)=mean(fbest(i,:));
    end
    %������������
    for i=1:funcnum
        fitcountall(popCishu,i)=mean(FESM(i,:));
    end
    %�����
    for i=1:funcnum
        fstdall(popCishu,i)=std(fbest(i,:));
    end
    %�ɹ��ʴ���
    for i=1:funcnum
        SRcount=0;
        for j=1:runs
            if(fbest(i,j)<(1E-5))
                SRcount=SRcount+1;
            end
        end
        SRrate(popCishu,i)=SRcount/runs*100;
    end
    %
    
    xlsxstr=[namestr,'.xlsx'];
    % xlswrite(xlsxstr,xbest,'xbest');
    % xlswrite(xlsxstr,fbest,'fbest');
    
    xlswrite(xlsxstr,fitcountall,'FESM');
    
    xlswrite(xlsxstr,fbestall,'fbestall');
    xlswrite(xlsxstr,fmeanall,'fmeanall');
    xlswrite(xlsxstr,fstdall,'fstdall');
    xlswrite(xlsxstr,SRrate,'SRrate');
    xlswrite(xlsxstr,fbest,'fbest');
    
    
end
