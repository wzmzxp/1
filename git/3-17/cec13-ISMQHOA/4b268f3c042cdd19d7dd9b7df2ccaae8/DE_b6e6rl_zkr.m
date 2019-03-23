function [er01,er1,er2,er3,er4,er5,er6,er7,er8,er9,erfin] = DE_b6e6rl_zkr(fhd,xstfmin,Dim,POP_SIZE,Max_Gen,xmin,xmax,varargin)
%[gbest,gbestval,fitcount]= PSO_func('f8',3500,200000,30,30,-5.12,5.12)
rand('state',sum(100*clock));

 maxiter=Max_Gen*Dim;
 ps=POP_SIZE;
 evals=ps;
 D=Dim;
 
 d=D;
 h=12;
 n0=2;
 delta=1/(5*h);
 
 ni=zeros(1,h)+n0;
 er01=0;er1=0;er2=0;er3=0;er4=0;er5=0;
 er6=0;er7=0;er8=0;er9=0;erfin=0;
 pesek01=0;pesek1=0;pesek2=0;pesek3=0;pesek4=0;pesek5=0;
 pesek6=0;pesek7=0;pesek8=0;pesek9=0;
 
 p2=0.5*(1+1/d);
 p1=0.5*(p2+1/d);
 p3=0.5*(p2+1);
 CR1=CRexp_set(p1,d);
 CR2=CRexp_set(p2,d);
 CR3=CRexp_set(p3,d);
 
 Xmin=repmat(xmin,1,D);
 Xmax=repmat(xmax,1,D);
 Xmin=repmat(Xmin,ps,1);
 Xmax=repmat(Xmax,ps,1);
 
 pos=Xmin+(Xmax-Xmin).*rand(ps,D);
 e=feval(fhd,pos',varargin{:});
 fmin=min(e);
% sou_min=(find(e==fmin));

% fmax=max(e);
 
 while (fmin-xstfmin>=1e-8) && (evals<maxiter)
%    nagenerovani novych bodu do poskonkur
    poskon=zeros(ps,D);
    strat=zeros(ps);
    for k=1:ps
        [hh p_min]=roulete(ni);
        if p_min<delta
            ni=zeros(1,h)+n0;
        end  %reset
        strat(k)=hh;
        switch hh % number of selected heuristic
            case 1
                F=0.5; CR=0; y=derand_RLe(pos,e,F,CR,k);
            case 2
                F=0.5; CR=0.5; y=derand_RLe(pos,e,F,CR,k);
            case 3
                F=0.5; CR=1; y=derand_RLe(pos,e,F,CR,k);
            case 4
                F=0.8; CR=0; y=derand_RLe(pos,e,F,CR,k);
            case 5
                F=0.8; CR=0.5; y=derand_RLe(pos,e,F,CR,k);
            case 6
                F=0.8; CR=1; y=derand_RLe(pos,e,F,CR,k);
            case 7
                F=0.5; CR=CR1;    y=derandexp_RLe(pos,e,F,CR,k);
            case 8
                F=0.5; CR=CR2;    y=derandexp_RLe(pos,e,F,CR,k);
            case 9
                F=0.5; CR=CR3;   y=derandexp_RLe(pos,e,F,CR,k);
            case 10
                F=0.8; CR=CR1;   y=derandexp_RLe(pos,e,F,CR,k);
            case 11
                F=0.8; CR=CR2;   y=derandexp_RLe(pos,e,F,CR,k);
            case 12
                F=0.8; CR=CR3;   y=derandexp_RLe(pos,e,F,CR,k);
        end
        y=zrcad(y,xmin,xmax);
        poskon(k,:)=y;
    end
%    vypocet ekonkurenti
    ekon=feval(fhd,poskon',varargin{:});
%    kdyz je lepsi ekonkurenti nez e, tak nahrad bod v pos bodem z poskonkur, a e tohoto bodu z e konkur
    for k=1:ps
        if ekon(k)<=e(k)
            pos(k,:)=poskon(k,:);
            e(k)=ekon(k);
            ni(strat(k))=ni(strat(k))+1;         % zmena prsti qi
        end
    end
    evals=evals+ps;
    fmin=min(e);
    

if (evals>=0.01*maxiter)&&(pesek01==0)
    er01=fmin-xstfmin;
    pesek01=1;
end
if (evals>=0.1*maxiter)&&(pesek1==0)
    er1=fmin-xstfmin;
    pesek1=1;
end
if (evals>=0.2*maxiter)&&(pesek2==0)
    er2=fmin-xstfmin;
    pesek2=1;
end
if (evals>=0.3*maxiter)&&(pesek3==0)
    er3=fmin-xstfmin;
    pesek3=1;
end
if (evals>=0.4*maxiter)&&(pesek4==0)
    er4=fmin-xstfmin;
    pesek4=1;
end
if (evals>=0.5*maxiter)&&(pesek5==0)
    er5=fmin-xstfmin;
    pesek5=1;
end
if (evals>=0.6*maxiter)&&(pesek6==0)
    er6=fmin-xstfmin;
    pesek6=1;
end
if (evals>=0.7*maxiter)&&(pesek7==0)
    er7=fmin-xstfmin;
    pesek7=1;
end
if (evals>=0.8*maxiter)&&(pesek8==0)
    er8=fmin-xstfmin;
    pesek8=1;
end
if (evals>=0.9*maxiter)&&(pesek9==0)
    er9=fmin-xstfmin;
    pesek9=1;
end
fmin
 end
% kolikrat
erfin=fmin-xstfmin;

er=[er01,er1,er2,er3,er4,er5,er6,er7,er8,er9,erfin];
oprav=find(er<1e-8);
er(oprav)=0;
er01=er(1);
er1=er(2);
er2=er(3);
er3=er(4);
er4=er(5);
er5=er(6);
er6=er(7);
er7=er(8);
er8=er(9);
er9=er(10);
erfin=er(11);


