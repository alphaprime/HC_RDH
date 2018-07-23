function [output,sum]=trailingSign_level_compute(error_code,trailingOnes,totalCoeffss,level_prefix,coeff_token_len)


%% ������βϵ��
trailingSign=error_code(coeff_token_len+1:coeff_token_len+trailingOnes);
k=1;
for i=length(trailingSign):-1:1
    if trailingSign(i)==0
        trailingSign_value(k)=1;
        k=k+1;
    else
        trailingSign_value(k)=-1;
        k=k+1;
    end
end

%% ��������βϵ����ķ���ϵ���ķ�ֵ��level��

len=totalCoeffss-trailingOnes; %% len Ϊ����βϵ����ķ���ϵ���ķ�ֵ��level���ĸ���
if totalCoeffss>10 && trailingOnes<3 % ��ͨ�����suffixLength ��ʼ��Ϊ0�����ǵ������ж���10 ������ϵ������������βϵ������Ŀ����3 ����suffixLength ��ʼ��Ϊ1
    suffixLength=1;
else
    suffixLength=0;
end
j=coeff_token_len+trailingOnes+1;
[p1,p2]=size(level_prefix);
level=zeros(1,len);
sum=0;
for i=1:len    
    k=0;   
    while (1)
        curr=error_code(j);
        if curr==0
            j=j+1;
            k=k+1;
            continue;
        end
        if  curr==1
            temp=zeros(1,k);
            bitstring=cat(2,temp,cat(2,curr,error_code(j+1:j+1+suffixLength-1)));
            sum=sum+length(bitstring);
            if suffixLength>0
                suffix=bitstring(length(bitstring)-suffixLength+1:length(bitstring));%% ��׺
                suffix_value=bin2dec(char((suffix)+48));
            else
                suffix_value=0;
            end
            
            % ����bitstring����level
            for s=1:p1
                if length(level_prefix{s,2})==length(cat(2,temp,curr))
                    if level_prefix{s,2}==cat(2,temp,curr)
                        prefix_value=s-1;
                        level_code=prefix_value*(2^suffixLength)+suffix_value;
                        if mod(level_code,2)==0 % Ϊż��
                            level(i)=(level_code+2)/2;
                        end
                        if mod(level_code,2)==1 % Ϊ����
                            level(i)=(-level_code-1)/2;
                        end
                        
                        break;
                    end
                end
            end
            
            j=j+length(bitstring)-length(temp);
            
        end
        break;
    end
    % suffixLength update
    if ( suffixLength == 0 )
        suffixLength=suffixLength+1;
    else
        if abs(level(i))>3*(2^(suffixLength-1)) && suffixLength <6
          suffixLength=suffixLength+1;
        end
    end
end

level=fliplr(level);

if trailingOnes>0
    output=cat(2,level,trailingSign_value);
else
    output=level;  % û����βϵ�������
end
sum=sum+trailingOnes;
