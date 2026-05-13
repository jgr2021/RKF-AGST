n_Q=1;n_R=4;n_dof=2;
%n_Q=9;n_R=4;n_dof=1;
Qob=1;
n_N=100000;
% wp=0.9;
% U=100;
%Noise_samples=GMrnd(n_Q,0.9,100,n_N);
Noise_samples=GSTrnd(Qob,n_R,n_dof,n_N)';
R_Gaussian=var(Noise_samples);
lb= [0,0];
ub= [inf, inf];
[parmhat2,ML2]=fmincon(@(x) -sum(log(stpdf(Noise_samples,0,x(1),x(2)))),[3,3],[],[],[],[],lb,ub);
R_St=parmhat2(1);
R_dof=parmhat2(2);

m=2;
n=4;
x0=[0;0;0;0];
N=300;
dt=.1;
Qob=n_Q*eye(m);
%R=n_R*eye(m);
%dof=n_dof;
q=1;
Q=q*[dt^3/3,0,dt^2/2,0;
     0,dt^3/3,0,dt^2/2;
     dt^2/2,0,dt,0;
     0,dt^2/2,0,dt];
F=[1,0,dt,0;
   0,1,0,dt;
   0,0,1,0;
   0,0,0,1];
H=[1,0,0,0;
   0,1,0,0];
%H=eye(4);
[z,pos]=Traj_Poly(x0,F,H,Q,Qob,n_R,n_dof,N);

%%%%%%%

Initial_res=zeros(N,3);
%Initial_res=0;
loss_KF=Initial_res;
loss_PF=Initial_res;

loss_RKFGaussian=Initial_res;
loss_RKFST=Initial_res;
loss_RKFAdditive=Initial_res;
sim_num=1000;
outlier=[];




time_KF=0;
time_PF=0;
time_Huber=0;
time_RKFGaussian=0;
time_RKFST=0;
time_RKFAdditive=0;
parfor i=1:sim_num
    [z,pos]=Traj_Poly(x0,F,H,Q,Qob,n_R,n_dof,N);

    [loss_t,time_t]=test_demo(z,pos,R_Gaussian);
    time_KF=time_KF+time_t;
    loss_KF=loss_KF+loss_t;

    %[loss_t,time_t]=test_demoPF3(z,pos,R_Gaussian);
    [loss_t,time_t]=test_demoPF(z,pos,R_St,R_dof);
    time_PF=time_PF+time_t;
    loss_PF=loss_PF+loss_t;

    [loss_t,time_t]=test_demoRKFGaussian(z,pos,R_Gaussian);
    time_RKFGaussian=time_RKFGaussian+time_t;
    loss_RKFGaussian=loss_RKFGaussian+loss_t;

    [loss_t,time_t]=test_demoRKFST(z,pos,R_St,R_dof);
    time_RKFST=time_RKFST+time_t;
    loss_RKFST=loss_RKFST+loss_t;

    [loss_t,time_t]=test_demoRKFAGSMG(z,pos,n_Q,n_R,n_dof);
    time_RKFAdditive=time_RKFAdditive+time_t;
    loss_RKFAdditive=loss_RKFAdditive+loss_t;

end

%time_KF
%time_PF
%time_RKFGaussian
%time_RKFST
%time_RKFAdditive

loss_KF=loss_KF/sim_num;
loss_PF=loss_PF/sim_num;
loss_RKFAdditive=loss_RKFAdditive/sim_num;
loss_RKFGaussian=loss_RKFGaussian/sim_num;
loss_RKFST=loss_RKFST/sim_num;