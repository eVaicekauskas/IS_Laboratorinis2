clc
clear all 
close all

%% Daugiasluoksnis perceptronas

% 1. Duomenys
x = 0.1:1/22:1;
d = (1+ 0.6*sin(2*pi*x/0.7) + 0.3*sin(2*pi*x))/2;
plot(x,d,'r.'); hold on

% 2. Struktūra: 5 neuronai paslėptajame sluoksnyje, 1 - išėjimo sluoksnyje
% pirmojo (paslėptojo) sluoksnio svoriai
w11_1= randn(1);
w21_1= randn(1);
w31_1= randn(1);
w41_1= randn(1);
w51_1= randn(1);
b1_1= randn(1);
b2_1= randn(1);
b3_1= randn(1);
b4_1= randn(1);
b5_1= randn(1);

%antrojo (išėjimo) sluoksnio svoriai
w11_2= randn(1);
w12_2= randn(1);
w13_2= randn(1);
w14_2= randn(1);
w15_2= randn(1);
b1_2= randn(1);

% 3. Tinklo atsakas
n = 0.1;

for j = 1:10000
    for i = 1:length(x)

        % pirmojo sluoksnio neuronai
        v1_1 = x(i)*w11_1 + b1_1;
        v2_1 = x(i)*w21_1 + b2_1;
        v3_1 = x(i)*w31_1 + b3_1;
        v4_1 = x(i)*w41_1 + b4_1;
        v5_1 = x(i)*w51_1 + b5_1;

        %aktyvavimo funkcija
        y1_1 = tanh(v1_1);
        y2_1 = tanh(v2_1);
        y3_1 = tanh(v3_1);
        y4_1 = tanh(v4_1);
        y5_1 = tanh(v5_1);

        %antrojo sluoksnio neuronas
        v1_2 = y1_1*w11_2 + y2_1*w12_2 + y3_1*w13_2 + y4_1*w14_2 + y5_1*w15_2 + b1_2; 

        %aktyvavimo funkcija
        y1_2 = v1_2; 

        y = y1_2;

        %klaida
        e = d(i) - y;

        %%%%%%%%%

        %klaidos gradientas išėjimo sluoksnio neuronui
        delta1_2 = e*(1 - tanh(v1_2)^2);

        %klaidos gradientas paslėptojo sluoksnio neuronams
        delta1_1 = (1-tanh(v1_1)^2)*delta1_2*w11_2;
        delta2_1 = (1-tanh(v2_1)^2)*delta1_2*w12_2;
        delta3_1 = (1-tanh(v3_1)^2)*delta1_2*w13_2;
        delta4_1 = (1-tanh(v4_1)^2)*delta1_2*w14_2;
        delta5_1 = (1-tanh(v5_1)^2)*delta1_2*w15_2;

        %atnaujinami išėjimo sluoksnio svoriai
        w11_2 = w11_2 + n*delta1_2*y1_1;
        w12_2 = w12_2 + n*delta1_2*y2_1;
        w13_2 = w13_2 + n*delta1_2*y3_1;
        w14_2 = w14_2 + n*delta1_2*y4_1;
        w15_2 = w15_2 + n*delta1_2*y5_1;
        b1_2 = b1_2 + n*delta1_2;

        %atnaujinami paslėptojo sluoksnio svoriai
        w11_1 = w11_1 + n*delta1_1*x(i);
        w21_1 = w21_1 + n*delta2_1*x(i);
        w31_1 = w31_1 + n*delta3_1*x(i);
        w41_1 = w41_1 + n*delta4_1*x(i);
        w51_1 = w51_1 + n*delta5_1*x(i);
        b1_1 = b1_1 + n*delta1_1;
        b2_1 = b2_1 + n*delta2_1;
        b3_1 = b3_1 + n*delta3_1;
        b4_1 = b4_1 + n*delta4_1;
        b5_1 = b5_1 + n*delta5_1;
    end
end
    
x = [0.1:1/220:1];
Y = zeros(1,length(d));


for i = 1:length(x)
    %pirmojo sluoksnio neuronai
    v1_1 = x(i)*w11_1 + b1_1;
    v2_1 = x(i)*w21_1 + b2_1;
    v3_1 = x(i)*w31_1 + b3_1;
    v4_1 = x(i)*w41_1 + b4_1;
    v5_1 = x(i)*w51_1 + b5_1;

    %aktyvavimo funkcija
    y1_1 = tanh(v1_1);
    y2_1 = tanh(v2_1);
    y3_1 = tanh(v3_1);
    y4_1 = tanh(v4_1);
    y5_1 = tanh(v5_1);
    
    %antrojo sluoksnio neuronas
    v1_2 = y1_1*w11_2 + y2_1*w12_2 + y3_1*w13_2 + y4_1*w14_2 + y5_1*w15_2 + b1_2; 
    y1_2 = v1_2;
    y = y1_2;

    Y(i) = y;
end

plot(x,Y,'co')