clc
clear all 
close all
x=0:1:10;

N = 10e4;






hamming_matrix=[];

G=[1 0 0 1 1; 0 1 0 0 1; 0 0 1 1 0];

decimal_sum=1;
symbols=[0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1];
code_words=[0 0 0 0 0; 0 0 1 1 0; 0 1 0 0 1; 0 1 1 1 1; 1 0 0 1 1; 1 0 1 0 1; 1 1 0 1 0; 1 1 1 0 0];

for i=1:length(x)
    snr=10^(i/10);
    Eb=abs(4-3);
var=Eb./(2*snr);
failure=0;


pe = qfunc(abs(4-3)/(2*sqrt(var)));

count=0;
 while(count<=(N/3)) 
    bit=randi([1,7],1,1);

    sender_code=code_words(bit,(1:end)); 

    reciever_code=bsc(sender_code,pe);
    
    for j=1:8
        y1=code_words(j,(1:end));
        y2=reciever_code;
        D= pdist2(y1,y2,'hamming');
        D1(j)=5*((D*100)/100);
        
    end
    [min_dis,min_po]=min(D1);
    
    
    final_reciever=code_words(min_po,(1:end));

    if(pdist2(sender_code,final_reciever,'hamming')~=0)
        failure=failure+1;
    end




count=count+1;

end
error(i)=failure/(N/3);




end
semilogy(x,error);hold on;
ylabel('probability of error of BSC');
xlabel('SNR');
title('ESD19I008-Linear Block Code')
