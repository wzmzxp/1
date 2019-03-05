%ÊÊÅäÖµº¯Êı

                                                                  
function fitness=fit(len,m,maxlen,minlen)
fitness=len;
for i=1:length(len)
    fitness(i,1)=(1-((len(i,1)-minlen)/(maxlen-minlen+0.0001))).^m;%
end
