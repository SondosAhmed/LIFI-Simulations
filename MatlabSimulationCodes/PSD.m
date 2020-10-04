%%%%%%%%%%%%%%%%%%%
% Created in 2017/4
%% B.Sc. Senior Project
%% By Sondos A. Alshami
%% Telecommunication Engineering 
%% Lebanese International University
%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rb=1;
Tb=1/Rb;
% bit duration
SigLen=1000;
% number of bits or symbols
fsamp=Rb*10;
% sampling frequency
nsamp=fsamp/Rb;
% number of samples per symbols
Tx_filter=ones(1,nsamp);
% transmitter filter for NRZ
%Tx_filter=[ones(1,nsamp/2) zeros(1,nsamp/2)];
% transmitter filter for RZ
bin_data=randint(1,SigLen);
%generating prbs of length SigLen
bin_signal=conv(Tx_filter,upsample(bin_data,nsamp));
% pulse shaping function
bin_signal=bin_signal(1:SigLen*nsamp);
% *************** psd of the signals ***********
Pxx=periodogram(bin_signal);
Hpsd=dspdata.psd(Pxx,'Fs',fsamp);
% Create PSD data object
figure; plot(Hpsd); title('PSD of TX signal')