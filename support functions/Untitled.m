
clc
clear all;
prev_dir = pwd; file_dir = fileparts(mfilename('fullpath')); cd(file_dir);
addpath(genpath(pwd));
error_code=[0 0 0 0 1 0 0 0 1 1 1 0 0 1 0 1 1 1 1 0 1 1 0 1];
coeff_token_len=7;
NC_value=1;

error=de_CAVLC(error_code,coeff_token_len,NC_value);