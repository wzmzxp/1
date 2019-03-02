function C=hilbt(varargin)
%varargin可以接受变数量的参数

if nargin == 0
    C=[];
    warning('输入为空');
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
    warning('输入的参数数量大于等于2，取前两个为行和列数');
end