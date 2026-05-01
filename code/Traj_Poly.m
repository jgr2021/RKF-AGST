function [z,pos]=Traj_Poly(x,F,H,Q,Qob,R,dof,N)

mu=zeros(4,1);

z=zeros(N,2);
pos=zeros(N,4);
for i=1:N
    % move
    x=F*x+mvnrnd(mu,Q)';
    % observe
    z(i,:)=H*x+GSTrnd(Qob,R,dof,1)';
    % result
    pos(i,:)=x;
end
% plot(z(:,1),z(:,2));
% hold on
% plot(pos(:,1),pos(:,2));
end