% clear all
%  mex cec14_func.cpp -DWINDOWS
func_num=1;
D=30;
Xmin=-100;
Xmax=100;
pop_size=20;
group=1;
gr=40;
iter_max=20000;
runs=1;
fhd=str2func('cec13_func'); 
% fhd=@d;
  gbestv=zeros(28,runs);
  tic
for i=1:28
    fp=fopen('ISmqhoa_result.txt','a');
    func_num=i;
  
    for j=1:runs
        i,j,
%         a=feval(fhd,zeros(30,1),1);
%         ga()
%           [gbest,gbestval,Convergence,FES]= mqhao_GI1(fhd,D,pop_size,group,gr,iter_max,Xmin,Xmax,func_num);
%                   [gbest,gbestval,Convergence,FES]= test(fhd,D,pop_size,group,gr,iter_max,Xmin,Xmax,func_num);

                  [gbest,gbestval,Convergence,FES]= test(fhd,D,pop_size,group,gr,iter_max,Xmin,Xmax);
%             feval(fhd,optimalSolution(k,:)',varargin{:})
%         [gbest,gbestval,FES]= IS_mqhoa(fhd,D,pop_size,iter_max,Xmin,Xmax,func_num);
%         xbest(i,:)=gbest;
        fbest(i,j)=gbestval;
        fbest(i,j)
         gbestv(i,j)=gbestval;
    end
%     fprintf(fp,'%d,%d,%d,%d,%d\r\n',i,D,min( gbestv),mean( gbestv),std( gbestv));
      
 

 
   t2=toc;
end

fclose(fp);

% for i=1:30
% eval(['load input_data/shift_data_' num2str(i) '.txt']);
% eval(['O=shift_data_' num2str(i) '(1:10);']);
% f(i)=cec14_func(O',i);i,f(i)
% end