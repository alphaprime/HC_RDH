function out=zigzag(in,action)
%���öԳƷ���
%ԭʼ���������(2^n)*(2^n)�ķ���
%���action��ֵΪ0����ʾzigzag����ɨ�裻���action��ֵΪ1��ʾzigzag����ɨ�衣

if nargin<2
	action=0;
end

i=1;                                                    %
j=1;                                                    %ԭʼ������±�

switch action
	case 0                                              %����ɨ��
		f1=0;                                           %ԭʼ������±�i��������ı�־
		f2=0;                                           %ԭʼ������±�j��������ı�־
		m=size(in,1);                                   %ԭʼ����Ĵ�С
        if m==1
            error('����ɨ��ʱ���������in������һά�ģ�����');
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
	case 1                                          %����ɨ��
                                                    %s1��s2��ʾÿ�ζԽ�ɨ������䡣
        in=in';
		s1=1;
        if size(in)~=1
            error('����ɨ��ʱ���������in������һά��');
        end
		m=sqrt(size(in,2));                        	%��ɨ������ά��
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