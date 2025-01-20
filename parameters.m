%define parameters
% motor parameters
PP = 4; %number of polepairs
ld = 0.0085; % d axis inductance
lq = 0.0085; % d axis inductance
Rs = 2.875;
J = 0.008; %moment of inertia
PMflux = 0.175; %PM flux
% feedback loop sampling rate
% current sampling, rotor position sampling
Ts = 1e-6;

%control frequency/time
Tc= 1e-4;

% current PI
% current bandwidth Hz
fc = 600;
BW = 2*pi*fc;
KpdS = ld*BW; %d axis kp, PI in series
KidS = Rs/ld; %d axis ki, PI in series
%convert PI in series to PI in parallel
KpdP = KpdS;
KidP = KpdS*KidS;

KpqS = lq*BW;
KiqS = Rs/lq;
%convert PI in series to PI in parallel
KpqP = KpqS;
KiqP = KpqS*KiqS;

%speed PI controller
damp = 3; %range of 3-20
K = 3*PP*PMflux/2/J;

KpsS = BW /K / damp;
KisS = BW/ damp^2;

KpsP = KpsS;
KisP = KpsS*KisS;
Imax = 30;
Umax = 400;