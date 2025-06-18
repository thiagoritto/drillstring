
clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXPERIMENTAL DATA %%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load experimental data
load 175_completo

% Time window used in calibration
t_min   = 37;
t_max   = 41;

% Sampling rate in Hz of the experimental data
Fs = 1000; 

% Cutting frequency to evaluate cost function
f_cut = 10;  % Hz

% Some time indices
i_min = sum(Time_Sample_175_complete <= t_min);
i_max = sum(Time_Sample_175_complete <= t_max);
N_dt  = i_max - i_min;

% Crop and adjust time vector
tt_bit_exp = Time_Sample_175_complete(i_min:i_max) - t_min;

% Crop measured variables
v_bit_exp = Bit_Speed_Sample_175_complete(i_min:i_max)*2*pi/60;
tob_exp = Bit_Torque_Sample_175_complete(i_min:i_max);
wob_exp = WOB_Sample_175_complete(i_min:i_max);



                                                            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PLOTTING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% BIT ROTATIONAL SPEED
% TIME
figure(1)
plot(tt_bit_exp,v_bit_exp*60/2/pi,'k-','linewidth',2)
ylabel('Ang Speed [RPM]')
xlabel('Time [s]')
xlim([0 3])
ylim([-10 210])
grid on


% TOB
% TIME
figure(4)
plot(tt_bit_exp,tob_exp,'k-','linewidth',2)
ylabel('Torque [N.m]')
xlabel('Time [s]')
xlim([0 3])
grid on


% WOB
% TIME
figure(6)
plot(tt_bit_exp,wob_exp,'k-','linewidth',2)
ylabel('WOB [N]')
xlabel('Time [s]')
xlim([0 3])
grid on


% CYCLES ------------------------------------------------------------------
% TOB x V
figure(8)
plot(v_bit_exp*60/2/pi,tob_exp,'k.')
xlabel('Bit Speed [RPM]')
ylabel('T_{bit} [Nm]')
grid on

% WOB x V
figure(10)
plot(v_bit_exp*60/2/pi,wob_exp,'k.')
xlabel('Bit Speed [RPM]')
ylabel('WOB [N]')
grid on



