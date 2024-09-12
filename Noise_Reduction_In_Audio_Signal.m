clc;
close all;
clear all;

% Load sample audio signal
[audio_signal, fs] = audioread('speech_dft.wav'); % Load a sample audio file
t = (0:length(audio_signal)-1)/fs;

% Add white noise to the audio signal
noisy_signal = audio_signal + 0.02*randn(size(audio_signal));

% Design a low-pass filter to remove noise
fc = 1000; % Cutoff frequency in Hz
[b, a] = butter(6, fc/(fs/2), 'low'); % 6th order Butterworth filter

% Apply the filter to the noisy signal
filtered_signal = filtfilt(b, a, noisy_signal);

% Plot original, noisy, and filtered signals
figure;
subplot(3, 1, 1);
plot(t, audio_signal);
title('Original Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(t, noisy_signal);
title('Noisy Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(t, filtered_signal);
title('Filtered Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Play original, noisy, and filtered signals
disp('Playing original signal');
sound(audio_signal, fs);
pause(length(audio_signal)/fs + 1);

disp('Playing noisy signal');
sound(noisy_signal, fs);
pause(length(noisy_signal)/fs + 1);

disp('Playing filtered signal');
sound(filtered_signal, fs);
