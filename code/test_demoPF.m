function [loss,time]=test_demoPF(z,pos,R_St,R_dof)
m=2;n=4;
x0=[0;0;0;0];
N=length(z);
dt=.1;

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
%R=2.06*eye(2);dof=2.78;
%R=2.08*eye(2);dof=2.80;%112
%R=2.0561*eye(2);dof=4.6078;%1 4 3
%R=5*eye(2);dof=4.13;%442
R=R_St*eye(m);dof=R_dof;

Xs=zeros(N,4);Ps=zeros(n,n,N);
num_pf=1000;tic;
particles =[x0(1)*ones(num_pf,1),x0(2)*ones(num_pf,1),x0(3)*ones(num_pf,1),x0(4)*ones(num_pf,1)];
weights=ones([num_pf,1])/num_pf;

for i=1:N
    %predict
    particles=predict_pf(particles,F,Q);
    %update
    weights=update_pf(particles*H',weights,z(i,:),R,dof);
    %resample
    if(neff(weights)<N/2)
        [particles,weights]=resample_systematic(particles,weights);
    end
    %estimate
    [mu,Sigma]=estimate(particles,weights);
    Xs(i,:)=mu;
    Ps(:,:,i)=diag(Sigma);
end
time=toc;
% hold on
% plot(Xs(:,1),Xs(:,2))
% plot(pos(:,1),pos(:,2))
loss=calculate_loss(pos,Xs,Ps);
% plot(Xs(:,1),Xs(:,2))
end

function [mu,var]=estimate(particles,weights)
    %input:
    %particles: N*k
    %weight: N*1
    %output:
    %mu:1*k
    %var:1*k
    mu=sum(particles.*weights)/sum(weights);
    var=(particles-mu).^2;
    var=sum(var.*weights)/sum(weights);
end
function [particles]=predict_pf(particles,F,Q) 
    %predict
    particles=particles*F'+mvnrnd(zeros(4,1),Q,length(particles));
end
function [weights]=update_pf(particles,weights,z,R,dof)
    %get distances from particles
    weights =weights.*(mvtpdf(particles-z,R,dof));%Student's T distribution
    weights =weights/ sum(weights);
end
function [particles,weights]=resample_systematic(particles,weights)
    N = length(weights);
    %make N subdivisions, choose positions with a random offset
    positions = (unifrnd(-1,0,[N,1])+(1:N)')/N;
    cumulative_sum = cumsum(weights);
    j=1;
    for i=1:N
        while(positions(i)>cumulative_sum(j))
            j=j+1;
        end
        particles(i,:)=particles(j,:);
    end
    %weights are equal after resampling
    weights=ones([N,1])/N;
end
function val=neff(weights)
    %when val<N/2, particles need resample
    val=1. /sum(weights.^2);
end