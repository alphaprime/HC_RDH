function x=bin2int(a)
% Function to convert binary to integer
if(~isempty(a))
    for ii=1:length(a)
        if a(ii)==1
            b(ii)='1';
        else
            b(ii)='0';
        end
    end
else x=[];return;
end
x=bin2dec(b);