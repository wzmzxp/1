function C=hilbt(varargin)
%varargin���Խ��ܱ������Ĳ���

if nargin == 0
    C=[];
    warning('����Ϊ��');
end
n=varargin{1};
if nargin == 1
    for i = 1:n
        for j = 1:n
            C(i,j) = 1 / (i + j - 1);
        end
    end
end

if nargin >= 2
     for i = 1:varargin{1}
        for j = 1:varargin{2}
            C(i,j) = 1 / (i + j - 1);
        end
    end
    warning('����Ĳ����������ڵ���2��ȡǰ����Ϊ�к�����');
end