function suffix_code=suffixDecToBin(suffix,suffixLength)  % ����suffixLength�ĳ���ȷ����׺suffix�ı��볤��

suffix_bin=dec2bin(suffix);
suffix_bin=suffix_bin-48;

if length(suffix_bin)==suffixLength
    suffix_code=suffix_bin;
end

if length(suffix_bin)<suffixLength
    des=suffixLength-length(suffix_bin);
    des_code=zeros(1,des);
    suffix_code=cat(2,des_code,suffix_bin);
end

if length(suffix_bin)>suffixLength
    suffix_code=suffix_bin(1:suffixLength);
end
