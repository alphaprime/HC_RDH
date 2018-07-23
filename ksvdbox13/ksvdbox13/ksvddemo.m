function ksvddemo

addpath('ompbox10')

disp(' ');
disp('  **********  K-SVD Demo  **********');
disp(' ');
disp('  This demo generates a random dictionary and random sparse examples over this');
disp('  dictionary. It then adds noise to the examples, and uses K-SVD to recover');
disp('  the dictionary. The demo plots the convergence of the K-SVD target function,');
disp('  and computes the fraction of correctly recovered atoms.');
disp(' ');


% dictionary dimensions
n = 36;
m = 128;

% number of examples
L = 15000;

X = zeros(n,L);
for kk = 1:L
    xxx = zeros(6,6);
    for ii = 1:6
       for jj = 1:6
           xxx(ii,jj) = bin2dec(num2str(unidrnd(2,1,8)-1));
       end
    end   
    X(:,kk) = xxx(:);
end

% sparsity of each example
k = 3;

% % noise power (dB)
% snr = 20;
% %% generate random dictionary and data %%
% D = normcols(randn(n,m));
% Gamma = zeros(m,L);
% for i = 1:L
%   p = randperm(m);
%   Gamma(p(1:k),i) = randn(k,1);
% end
% X = D*Gamma;
% X = normcols(X) + 10^(-snr/20)*normcols(randn(n,L));

%% run k-svd training %%
params.data = X;
params.Tdata = k;
params.dictsize = m;
params.iternum = 30;
params.memusage = 'high';

[Dksvd,Gamma] = ksvd(params,'');

for ii = 1:L
    subplot(2,1,1)
    plot(X(:,ii))
    subplot(2,1,2)
    plot(Dksvd*Gamma(:,ii))
    pause
end

dictimg = showdict(Dksvd,[1 1]*6,round(sqrt(params.dictsize)),round(sqrt(params.dictsize)),'lines','highcontrast');
figure; imshow(imresize(dictimg,2,'nearest'));
title('Trained dictionary');

%% show results %%
% figure; plot(err); title('K-SVD error convergence');
% xlabel('Iteration'); ylabel('RMSE');
% 
% printf('  Dictionary size: %d x %d', n, m);
% printf('  Number of examples: %d', L);
% 
% [~,ratio] = dictdist(Dksvd,D);
% printf('  Ratio of recovered atoms: %.2f%%\n', ratio*100);
