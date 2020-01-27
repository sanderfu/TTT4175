samples = 50;
x = zeros(1,samples);
f_lst = zeros(1,samples);
N=0.5;

for f  = 0:samples
    f_scaled = f/(2*samples);
    x(f+1)=(cos(2*pi*f_scaled*N))^2;
    f_lst(f+1)=f_scaled;
end

figure(1)
plot(f_lst,x)



%Generate true values
variance = 1;
f=0.25;
x_samples = zeros(1,samples);
x_samples_wo_noise = zeros(1,samples);
sample_counter = zeros(1,samples);
for n = 1:samples
    x_samples(n)=cos(2*pi*f*n)+sqrt(variance)*randn();
    sample_counter(n)=n;
end
figure(2)
plot(sample_counter,x_samples);

figure(3)
plot(sample_counter,x_samples_wo_noise);
