%xlabel ylabel zlabel
x=0:0.1:2*pi;
y1=sin(x);
y2=cos(x);
plot(x,y1,'--r',x,y2,'-b');
%x��򵥱�ע
xlabel('�������� sin')
%���б�ע
xlabel({'�������� sin','�������� cos'})
%���±�
xlabel('�������� sin^{cos}')
xlabel('�������� sin_{cos}')
%��ʽ�����
t=4;
xlabel(['��',num2str(t),'�������'])
%�����С
xlabel('�������� sin','fontsize',18)
%����ļӴ�
xlabel('�������� sin','fontweight','bold')%normal
%�������ɫ
xlabel('�������� sin','color','r')
%��������
xlabel('�������� sin','color','r','fontname','����')

%������ַ�
xlabel('�������� sin 0\leq x \leq 2\pi','color','r')

xlabel(['\fontname{����} ��������', '\fontname{Times New Roman} \it sin',...
    '\fontsize{19}\rm 0\leq \fontname{Times New Roman}\it \color{black}x \color{red}\rm \leq 2\pi'])

