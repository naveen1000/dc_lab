clc;
clear all;
close all;
b=input('enter the bit stream');
n=length(b);
t=0:0.01:n;
x=1:1:(n+1)*100;
for i=1:n
    if(b(i)==0)
        p(i)=-1;
    else
        p(i)=1;
    end
    for j=i:0.01:i+1
        bw(x(i*100:(i+1)*100))=p(i);
    end
end
bw=bw(100:end);
sint=sin(2*pi*t);
st=bw.*sint;
subplot(3,1,1);
plot(t,bw);
title('data input');
grid on;
axis([0 n -2 +2]);
subplot(3,1,2);
plot(t,sint);
title('carrier signal');
grid on;
axis([0 n -2 +2]);
subplot(3,1,3);
plot(t,st);
title('psk output');
grid on;
axis([0 n -2 +2])            ;
