function out=zigzag(in,action)
%采用对称法；
%原始矩阵必须是(2^n)*(2^n)的方阵；
%如果action的值为0，表示zigzag正向扫描；如果action的值为1表示zigzag反向扫描。

if nargin<2
	action=0;
end

i=1;                                                    %
j=1;                                                    %原始矩阵的下标

switch action
	case 0                                              %正向扫描
		f1=0;                                           %原始矩阵的下标i如何增长的标志
		f2=0;                                           %原始矩阵的下标j如何增长的标志
		m=size(in,1);                                   %原始矩阵的大小
        if m==1
            error('正向扫描时的输入参数in不能是一维的！！！');
        end
		for k=1:m*m/2
			out(k)=in(i,j);
			out(m*m+1-k)=in(m+1-i,m+1-j);
			if i==1 
				f2=0;
				if f1==0
					j=j+1;
					f1=1;
				else
					i=i+1;
					j=j-1;
				end
    			else
        			if j==1
            			f1=0;
            			if f2==0
                			i=i+1;
                			f2=1;
            			else
                			i=i-1;
                			j=j+1;
            			end
        			else
            			if f1==1
                			i=i+1;
                			j=j-1;
            			else
                			i=i-1;
                			j=j+1;
            			end
        			end
    			end
		end
	case 1                                          %反向扫描
                                                    %s1和s2表示每次对角扫描的区间。
        in=in';
		s1=1;
        if size(in)~=1
            error('反向扫描时的输入参数in必须是一维的');
        end
		m=sqrt(size(in,2));                        	%反扫描后方阵的维数
		for x=1:m
			s2=s1+x-1;
			f=mod(x,2);
			for y=s1:s2
				out(i,j)=in(y);
        		out(m+1-i,m+1-j)=in(m*m+1-y);
				switch f;
					case 1
            			i=i-1;
						j=j+1;
						if y==s2
							i=i+1;
						end
					case 0
						i=i+1;
						j=j-1;
						if y==s2
							j=j+1;
						end
				end
				s1=s2+1;
			end
		end
end