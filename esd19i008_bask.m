clc
clear all
close all
x=1:1:10;




for i=1:length(x)

count=0;
failure=0;
snr=10^(i/10);



while(count<1000000)
    bit=randi([0,1],1,1);
    if(bit==0)
        bask=3;
    else
        bask=4;
    end
   
    y = awgn(complex(bask),i);
    if(abs(y)<3.5)
        X_bit=0;
    else
        X_bit=1;
    end
    
    
    if(X_bit~=bit)
       
        
        
        failure=failure+1;
    end
    count=count+1;
end

error(i)=failure/1000000;
Eb=abs(4-3);
var=Eb./(2*snr);


pe(i) = qfunc(abs(4-3)/(2*sqrt(var)));





end

semilogy(x,error); hold on;
semilogy(x,pe,'o');


