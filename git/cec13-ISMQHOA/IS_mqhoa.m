function [gbest,gbestval,fitcount]= IS_mqhoa(fhd,Dimension,Particle_Number,MaxGen,VRmin,VRmax,varargin)

fopt=[-1400,-1300,-1200,-1100,-1000,-900,-800,-700,-600,-500,-400,-300,-200,-100,100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400];
DIM=Dimension;
sigmaMin=1e-6; 
groupNum=Particle_Number;
minDomain=VRmin; maxDomain=VRmax;
maxFE=MaxGen;
gbest=zeros(1,DIM);  
C=zeros(1,310000);
%-----------------------------------------------------%
   fitcount=0;


    funcV=zeros(1,groupNum);
    samplePos=zeros(DIM,groupNum);
    sigma=maxDomain-minDomain;
    stdPre=zeros(DIM,1);
    stdNow=zeros(DIM,1);
    optimalSolution=unifrnd(minDomain,maxDomain,DIM,groupNum);
    stdPre=std(optimalSolution,1,2) ;
  
    for k=1:groupNum 
        funcV(k)=feval(fhd,optimalSolution(:,k),varargin{:})-fopt(varargin{:});%func(id,optimalSolution(:,k),DIM);
       
    end
%---------------------------------------------------%
    while 1 % 
          w=0;
          while 1  %
            while 1  %
                w=w+1;
                change_flag=0; % op_solution
                for k=1:groupNum
                    fitcount=fitcount+1;
%                     theat=2*pi*rand(DIM,1);
%                     R=sqrt(-2.0*log(rand(DIM,1))); 
%                     gaosiRand=R.*cos(theat);  
%                     samplePos(:,k)=optimalSolution(:,k)+sigma*gaosiRand;
                        samplePos = mvnrnd(zeros(DIM),covv,1);  
						samplePos=(samplePos>VRmax).*VRmax+(samplePos<=VRmax).*samplePos;
						samplePos=(samplePos<VRmin).*VRmin+(samplePos>=VRmin).*samplePos; 
%---------------------------------------------%

                     sampleValue=feval(fhd,samplePos(:,k),varargin{:})-fopt(varargin{:});%func(id,samplePos(:,k),DIM);
                      
                     if sampleValue<funcV(k)     
                        funcV(k)=sampleValue;
                        optimalSolution(:,k)=samplePos(:,k); 
                        change_flag=1;
                     end
                     C(w)=min(funcV);
    csigma = ones(1,DIM)*(sigma);
    covv = diag(csigma.^2);
%-------------------------------------------------------%
                        if(w>(maxFE))
                        break;
                         else w=w+1;
                        end
                        
                end
%--�ܼ��ȶ��о�----------------------
%--------------------------------------------------%        
%                 �Ա�־λchange_flag�����жϣ���ѯ�ܼ��ȶ�������Ƿ��op_solution���й��޸�
                  if(change_flag==0)
                  break; 
                  end
%--------------------------------------------------%
            end %�ܼ��ȶ�������

           meanPos=mean(optimalSolution,2);%ȡ��ƽ�����?
           [v_max,index_max]=max(funcV);%ȡ�����ֵ�����index_max
           optimalSolution(:,index_max)=meanPos;%��ƽ������滻���ֵ��Ӧ���?         
           funcV(index_max)=feval(fhd,meanPos,varargin{:})-fopt(varargin{:});;%func(id,meanPos,DIM);%
           if(w>(maxFE))
             break;
              else w=w+1;
          end
           stdPre=std(optimalSolution,1,2);  %�½��׼��?
%------------------------------------------------------%
           if max(stdPre)<sigma%�߶��½��о�
               break;
           end
        end %г���ӵ�����  
        csigma = ones(1,DIM)*(sigma);
        covv = diag(csigma.^2);
        sigma=sigma/2.0;%�߶��½�����
       if sigma<=sigmaMin %�����о� 
           break;
       end
%         if(fitcount>(maxFE))
%              break;
%          end
    end % 

    [gbestval,index]=min(funcV);
     gbest=optimalSolution(:,index);
end
% badspot=0;
% for count= 1:repeat
%     if (gbestV(count)>1e-5)
%         badspot=badspot+1.0;
%     end
% end
%     VALUEmean=mean(gbestV);
%     FEmean=mean(gfe);
%     TIMEmean=mean(tot_time);
%     VALUEbest=min(gbestV);
%     GDprocent=(1.0-badspot/repeat);
%     fp=fopen('result.txt','a');
%     fprintf(fp,'%d,%d,%d,%d,%d,%d,%1.2e\r\n',iii,DIM,mean(gbestV),min(gbestV),std(gbestV),mean(tot_time), GDprocent);%注意：\r\n为换行（在系统为windows的情况下）�?
% % fprintf(fp,'%d,%d,%d,%d\r\n',y);
% %     fprintf('GDProcent %d BadSpot is %d\n',GDprocent,badspot);
% %     fprintf('DIM %d  groupNum %d  maxFE %d\n',DIM,groupNum,maxFE);
% %     fprintf('searchrange is %d to %d\n',minDomain,maxDomain);
% end
%  fclose(fp);