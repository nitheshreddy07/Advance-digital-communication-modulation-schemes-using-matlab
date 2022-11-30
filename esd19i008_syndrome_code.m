clc
clear all 
close all
x=0:1:5;

N = 10e4;






hamming_matrix=[];

H=[1 0; 1 1; 0 1; 1 0; 0 1];

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

    error_check=mod(reciever_code*H,2);
    error_sum=bi2de(error_check);
    if(error_sum~=0)
        if(error_sum==2)
            final_reciever_code=reciever_code+[0 0 0 0 1];
        end
        if(error_sum==1)
            final_reciever_code=reciever_code+[0 0 0 1 0];
        end
         if(error_sum==3)
            final_reciever_code=reciever_code+[0 0 1 0 0];
         end
         if(final_reciever_code~=sender_code)
             failure=failure+1;
         end

    end
    
    

    




count=count+1;

end
error(i)=failure/(N/3);




end
semilogy(x,error);hold on;
