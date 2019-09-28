clc;
clear all;
close all;
Fc1=100;
Fc2=50;
F=5;
amp=5;
amp1=amp/2;
t=0:0.001:1;
c1=amp.*sin(2*pi*Fc1*t);
c2=amp.*sin(2*pi*Fc2*t);
subplot(4,1,1);
plot(t,c1);
xlabel('time');
ylabel('amplitide');
title('carrier wave');
subplot(4,1,2);
plot(t,c2);
m=amp.*square(2*pi*F*t)+amp;
subplot(4,1,3);
plot(t,m);
title('binary message pulses');
for i=0:1000
    if m(i+1)==0
        mm(i+1)=c2(i+1);
    else
        mm(i+1)=c1(i+1);
    end
end
subplot(4,1,4);
plot(t,mm);
title('Frequency Shift Keyed Signal')
