%sampling frequency (or sample rate) is the number of samples per second%

%samples, sampling rate%
[f,Fs] = audioread('cmu.wav');


%number of samples%
N = length(f);

%length of sound file in seconds%
slength = N/Fs;

%length of sound file in milliseconds%
slengthms = slength*1000;

%linearly spaced vector of size N %
t=linspace(0, slength, N);

%plot whole waveform
figure(1), plot(t,f);
title('complete waveform'), xlabel('time(s) ---> '), ylabel('amplitude');
clc;

%plot from 0.55s to 0.6s
f_55s_new = f((0.55/slength)*N:(0.6/slength)*N);
t_55s_new = t((0.55/slength)*N:(0.6/slength)*N);
figure(2), plot(t_55s_new,f_55s_new);
title('waveform from 0.55s to 0.6s'), xlabel('time(s) ---> '), ylabel('amplitude');
clc;

%plot from 2s to 2.1s
f_2s_new = f((2/slength)*N:(2.1/slength)*N);
t_2s_new = t((2/slength)*N:(2.1/slength)*N);
figure(3), plot(t_2s_new,f_2s_new);
title('waveform from 2s to 2.1s'), xlabel('time(s) ---> '), ylabel('amplitude');
clc;

%plot whole spectrogram 
s = spectrogram(f);
figure(4);
spectrogram(f,'yaxis');
title('complete spectrogram');

%spectrogram of the 0.55s to 0.6 interval
figure(5);
spectrogram(f_55s_new,'yaxis');
title('spectrogram  0.55s and ending at 0.6s');

%spectrogram of the 2s to 2.1s interval
figure(6);
spectrogram(f_2s_new,'yaxis');
title('spectrogram  2s to 2.1s');

%plot rect and hamming windows in the interval [-10,110]
x = [-10:110];
<<<<<<< HEAD
resRect = rectWindow(x,100);
resHamm = hammingWindow(x,100);
figure(7), plot(resRect);
figure(8), plot(resHamm);

%apply and plot fourier transform of the signal
N=1024; 	 
X=fft(f,N);	 	 
nVals=(-N/2:N/2-1); %fft sample points	 
figure(9), plot(nVals,abs(X));

%apply fftshift
N=1024; 	 
X=fftshift(fft(f,N));	 	 
nVals=Fs*((-N/2:N/2-1)/N); %x axis will now represent frequency	 
figure(10), plot(nVals,abs(X));




=======
rectres = rectWindow(x,100);
hammres = hammingWindow(x,100);
figure(7), plot(rectres);
figure(8), plot(hammres);

%apply hamming window to the signal
winsize = 25;
frameshift = 5;
f_new = applyHamming(f,winsize,frameshift,slengthms);
figure(9), plot(t,f_new);
title('Hamming applied complete waveform'), xlabel('time(ms) ---> '), ylabel('amplitude');
clc;
>>>>>>> eb60da0857d1e77229675114fdad76014a53d06c
