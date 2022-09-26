clc
clear all
close all
x=1:1:10;


for i=1:length(x)

count=0;
failure=0;

while(count<1000000)
    bit=randi([0,1],1,1);
    if(bit==0)
        bpsk=1;
    else
        bpsk=-1;
    end
   
    y = awgn(complex(bpsk),i);
    if(((y-1)^2)<((y+1)^2))
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

pe(i) = qfunc(sqrt(2*(10^(i/10))));





end

semilogy(x,error); hold on;
semilogy(x,pe,'o');


