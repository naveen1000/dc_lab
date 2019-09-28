clc;
clear all;
close all;
fm=1;
a1=8;
a2=0.5;
ts=1/(1000*fm);
t=0:ts:1;
s1=a1*sin(2*pi*fm*t);
s2=a2*sin(2*pi*fm*t);
signal=[s1 s2];
t1=0:ts:(2+ts);
plot(t1,signal);
title('original signal');
mu=100;
norm_signal=(1/max(signal))*signal;
signal_compress=(log(1+mu*abs(signal))./(log(1+mu)).*sign(signal));
figure;
plot(t1,signal_compress);
title('compressed signal');
signal_expand=((1/mu)*(((1+mu).^abs(signal_compress))-1).*sign(signal_compress));
figure;
plot(t1,signal_expand);
title('expanded signal');
mu=[0 5 50 100];
rand_signal=0:0.01:1;
figure;
for i=1:length(mu)
    if(mu(i)==0)
        rand_signal_compress=rand_signal;
        hold on;
    else
        rand_signal_compress=(log(1+mu(i)*abs(rand_signal)))./(log(1+mu(i)).*sign(rand_signal));
        plot(rand_signal,rand_signal_compress);
        hold on;
    end
end
legend('mu=0','mu=5','mu=50','mu=100');
title('mu law compander characteristics');
a=max(abs(rand_signal_compress));
