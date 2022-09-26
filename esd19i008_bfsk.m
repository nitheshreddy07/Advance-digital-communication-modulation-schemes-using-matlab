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
        bfsk=[0,1];
    else
        bfsk=[1,0];
    end
   
    y = awgn(complex(bfsk),i);
    y1=y(1,1);
    y2=y(1,2);
    sum_y1=((y1-1)^2)+(y2^2);
    sum_y2=(y1^2)+((y2-1)^2);

    if(sum_y1>sum_y2)
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
var=1./(2*snr);
pe(i)=qfunc(sqrt(1/(2*var)));






end

semilogy(x,error); hold on;
semilogy(x,pe,'o');



