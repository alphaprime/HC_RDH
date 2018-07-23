function dictionary_generation(D)
param.L = 3;   % number of elements in each linear combination.
param.K = 64; % number of dictionary elements
param.numIteration = 50; % number of iteration to execute the K-SVD algorithm.

param.errorFlag = 0; % decompose signals until a certain error is reached. do not use fix number of coefficients.
%param.errorGoal = sigma;
param.preserveDCAtom = 0;

n = 16;   % dimension of each data
Dictionary = randn(n, param.K);
Dictionary = Dictionary*diag(1./sqrt(sum(Dictionary.*Dictionary)));
param.TrueDictionary=Dictionary;

%%%%%%%% initial dictionary: Dictionary elements %%%%%%%%  
param.InitializationMethod =  'DataElements';
 
param.displayProgress = 1;
disp('Starting to  train the dictionary');

[Dictionary_out,output]  = KSVD(D,param);
dict_path = ['Dictionary/dic_random/D_' num2str(param.K) '_' num2str(param.L) '_' num2str(param.numIteration) '.mat' ];
save(dict_path, 'Dictionary_out');
%%% displayDictionaryElementsAsImage(Dictionary_out,8,8,8,8);