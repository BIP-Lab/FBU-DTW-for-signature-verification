function [EER TH]=ROC(FAR,FRR)

%   ��������ʺͶ�Ӧ��ֵϵ��,����ROC����
%   ������
%       FAR/FRR:�����/��ʶ��,ʹ��ʱ�������֣�1 x n��
%   ����ֵ��
%       EER:������
%       TH����ֵϵ��

len=1:length(FAR);
plot(len,FAR,len,FRR);
if FAR(1)>FRR(1)
    D=FAR-FRR;
else 
    D=FRR-FAR;
end

[NUM LOC]=find(D<0);
if isempty(NUM)
    error('error:FAR��FRRû�н��㡣');
end 

LOC=min(LOC-1);
NUMU=D(LOC);
NUMD=D(LOC+1);
TH=((LOC+1)*NUMU-LOC*NUMD)/(NUMU-NUMD);
EERA=-((TH-LOC-1)*(FAR(LOC))-(TH-LOC)*(FAR(LOC+1)));
EERR=-((TH-LOC-1)*(FRR(LOC))-(TH-LOC)*(FRR(LOC+1)));
EER=(EERA+EERR)/2;

if find(D==0)
    TH=find(D==0);
    EER=FAR(TH);
end

end