clc
clear all
close all
x=1:1:30;




for i=1:length(x) 

count=0;
failure=0;
snr=10^(i/10);
symbols=[0000,0001,0010,0100,1000,0011,0110,1100,1001,1110,1101,1011,0111,1111,1010,0101];





while(count<250000)
    z=randi(length(symbols));
    bitset=[1 1;1 -1;-1 -1;-1 1;1 3;3 1;3 -1;1 -3;-1 -3;-3 -1;-3 1;-1 3;3 3;3 -3;-3 -3;-3 3];
    bitsent=symbols(z);
    symbolsent=bitset(z,:);
    y=awgn(complex(symbolsent),i);
    y1=y(1,1);
    y2=y(1,2);

    if(0<y1 && y1<2 && 0<y2&&y2<2)
       recieved_bit=[1,1];
    
    
    elseif(0<y1 && y1<2 && -2<y2 && y2<0)
        recieved_bit=[1,-1];
    
        
    elseif(-2<y1 && y1<0 && -2<y2 && y2<0)
        recieved_bit=[-1,-1];
    elseif(-2<y1 && y2<0 && 0<y2 && y2<2)
        recieved_bit=[-1,1];
    elseif(0<y1 && y1<2 && y2>2)
        recieved_bit=[1,3];
    elseif(y1>2 && 0<y2 && y2<2)
        recieved_bit=[3,1];
    elseif(y1>2 && -2<y2 && y2<0)
        recieved_bit=[3,-1];
    elseif(0<y1 && y2<2 && y2<-2)
        recieved_bit=[1,-3];
    elseif(-2<y1 && y1<0 && y2<-2)
        recieved_bit=[-1,-3];
    elseif(y1<-2 && -2<y2 && y2<0)
        recieved_bit=[-3,-1];
    elseif(y1<-2 && 0<y2 && y2<2)
        recieved_bit=[-3,1];
    elseif(-2<y1 && y2<0 && y2>2)
        recieved_bit=[-1,3];
    elseif(y1>2 && y2>2)
        recieved_bit=[3,3];
    elseif(y1>2 && y2<-2)
        recieved_bit=[3,-3];
    elseif(y1<-2 && y2<-2)
        recieved_bit=[-3,-3];
    elseif(y1<-2 && y2>2)
        recieved_bit=[-3,3];
    end
    

    if(recieved_bit~=symbolsent)
        failure=failure+1;
    end


    
    count=count+1;



    
   






end
error(i)=failure/250000;

end
