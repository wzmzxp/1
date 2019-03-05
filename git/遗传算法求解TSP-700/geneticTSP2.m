%SY0707348宗满意 遗传算法求解TSP问题(为选择操作从新设计后程序)
%D是距离矩阵，n为种群个数
%参数a是中国31个城市的坐标(初始给定)
%C为停止代数，遗传到第 C代时程序停止,C的具体取值视问题的规模和耗费的时间而定
%m为适值淘汰加速指数,最好取为1,2,3,4,不宜太大
%交叉概率Pc,变异概率Pm
%R为最短路径,Rlength为路径长度
      
function [R,Rlength]=geneticTSP2(D,a,n,C,m,Pc,Pm)
         [N,NN]=size(D);%(31*31)
         farm=zeros(n,N);%用于存储种群
         for i=1:n
             farm(i,:)=randperm(N);%随机生成初始种群
         end
         R=farm(1,:);%一个随机解(个体)
%在二维图上画出所有点
         scatter(a(:,1),a(:,2),'x');
         hold on        
        pause(1)
%画出随机解得路径图      
       figure;
       plotaiwa(a,R);
       hold on         
       pause(1)
%输出随机的解得路径和总距离
       disp('初始种群中的一个随机值:')
       R
       Rlength=myLength(D,R)
       disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
%计算各个个体总距离和适配置      
                           %farm(1,:)=R;
        len=zeros(n,1);%存储路径长度
        fitness=zeros(n,1);%存储适配值
        counter=0;
        
       while counter<C
            for i=1:n
                len(i,1)=myLength(D,farm(i,:));%计算路径长度
            end
            %maxlen=max(len);
            minlen=min(len);
           
            %fitness=fit(len,m,maxlen,minlen);%计算适应度
            rr=find(len==minlen);%返回的是在len中路径最短的路径坐标(i,1)
            
            R=farm(rr(1,1),:);%更新最短路径
                                                   %disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
            FARM=farm;%优胜劣汰，nn记录了复制的个数
%选择,  
          K=30;
          [aa,bb]=size(FARM);
          FARM2=FARM;
          len2=len;
          [len]=sort(len);
          for i=1:aa
              tt= find(len2==len(i,1));
              FARM(i,:)=FARM2(tt(1,1),:);
          end   
          for i=1:K
              j=aa+1-i;
              FARM(j,:)=FARM(i,:);
              
          end
  
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
 %                交叉操作
              [aa,bb]=size(FARM);
               FARM2=FARM;
             
               for i=1:2:aa
                    
                       if Pc>rand&&i<aa %交叉概率Pc
                            A=FARM(i,:);
                            B=FARM(i+1,:);
                            [A,B]=intercross(A,B);
                            FARM(i,:)=A;
                            FARM(i+1,:)=B;
                       end  
                      
               end
              %交叉检验  (可省去)             
               for i=1:aa
                   if myLength(D,FARM(i,:))>myLength(D,FARM2(i,:))
                       FARM(i,:)=FARM2(i,:);
                   end
               end
               clear FARM2
               
               
               
               
               
               
      
          
             [aa,bb]=size(FARM); %aa=nn2
   
%       变异   
            FARM2=FARM;
            for i=1:aa
                if Pm>=rand                    
                  FARM(i,:)=mutate(FARM(i,:));
                end
            end
             %变异检验(可省略)  
               for i=1:aa
                   if myLength(D,FARM(i,:))>myLength(D,FARM2(i,:))
                       FARM(i,:)=FARM2(i,:);
                   end
               end
               clear FARM2
%群体的更新
           %FARM2=zeros(n-aa+1,N);
           %if n-aa>=1             
           %    for i=1:n-aa
           %       FARM2(i,:)=randperm(N);%随机生成n-aa种群
           %     end
           % end
           FARM=[R;FARM];%将随机产生的n-aa个体加入从后面种群,将上次迭代的最优解从前面加入种群
           [aa,bb]=size(FARM);
                                                   %disp('~~~~~~~~~~~~~~~~4~~~~~~~验证zong~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
             %保持种群规模为n                                         
            if aa>n
                FARM=FARM(1:n,:);
            end   
     
    
                                                    %disp('~~~~~~~~~~~~~~~~~~~5~~~~验证zong~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
            %更新farm
            farm=FARM;
            clear FARM
            %更新迭代次数
            counter=counter+1 ; 
            
       end
 %结果输出
        
        Rlength=myLength(D,R)    
        figure
        plotaiwa(a,R)%画图
        disp('迭代次数c');        
        disp(C);
        disp('迭代后结果'); 
        R
        Rlength=myLength(D,R)%结果输出