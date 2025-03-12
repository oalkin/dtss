% Script: mexdt_1_9.m
clear all;
[x,fs] = audioread('Ballad_22050_Hz.flac');
audiowrite('Ballad_22050_Hz_Flipped.flac',[x(:,2),x(:,1)],fs);