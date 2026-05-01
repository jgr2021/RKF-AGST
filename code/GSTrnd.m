function [Samples]=GSTrnd(Q,R,dof,N)
% Sample the Gaussian-Student's T additive distribution.
% Supposing the distribution is sysmetric.(mean=0)
% Input: 
%       Parameters of the distribution
%       Number of Samples
% Output: 
%       Sample Points
%%
dimension=size(Q,1);
Samples_Gaussian=mvnrnd(zeros(1,dimension),Q,N);
Samples_ST=mvtrnd(R,dof,N);
Samples=Samples_Gaussian+Samples_ST;
end