function [Samples]=GMrnd(Q,wp,U,N)
% Sample the Gaussian-Student's T additive distribution.
% Supposing the distribution is sysmetric.(mean=0)
% Input: 
%       Parameters of the distribution
%       Number of Samples
% Output: 
%       Sample Points
%%
dimension=size(Q,1);
Samples=zeros(N,dimension);

for i=1:N
    s_d = rand(1);
    if s_d<wp
        Samples(i,:) = mvnrnd(zeros(dimension,1),Q);
    else
        Samples(i,:) = mvnrnd(zeros(dimension,1),U*Q); 
    end 
end 



end