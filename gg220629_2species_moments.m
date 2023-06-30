function gg220629_2species_moments
clc;clear;close all;
syms s b un um bet gam tau nu alf theta

assume(alf,'positive')
assume(theta,'positive')
assume(s,'positive')
assume(b,'positive')
assume(bet,'positive')
assume(gam,'positive')
assume(tau,'positive')
assume(nu,'positive')

f = bet/(bet-gam);

%%% use this for the null case
un = un;
um = um;

%%% use this for the Bernoulli case
% syms pn pm
% assume(pn,'positive')
% assume(pm,'positive')
% un = un*pn;
% um = um*pm;

%%% use this for the Poisson case
% syms Ln Lm
% assume(Ln,'positive')
% assume(Lm,'positive')
% un = exp(un*Ln)-1;
% um = exp(um*Lm)-1;


U = um*f*exp(-gam*s) + (un-um*f)*exp(-bet*s);
Uint = int(U,s,0,inf);


%%%%%%%%%%%%%%%%%%%%

fprintf('\nextrinsic\n')

syms nu 
assume(nu,'positive');
G3 = -nu*log(1-theta*Uint);

m1 = subs(subs(diff(G3,un),un,0),um,0);
m2 = subs(subs(diff(G3,um),un,0),um,0);
f1 = simplify(subs(subs(diff(G3,un,2),un,0),um,0)/m1);
f2 = simplify(subs(subs(diff(G3,um,2),un,0),um,0)/m2);
cov = simplify(subs(subs(diff(diff(G3,um),un),un,0),um,0));


fprintf('m1: %s\n',m1)
fprintf('m2: %s\n',m2)
fprintf('f1: %s\n',f1)
fprintf('f2: %s\n',f2)
fprintf('cov: %s\n',cov)

corr = cov/sqrt((f1+1)*(f2+1)*m1*m2);
fprintf('corr^2: %s\n',simplify(corr^2))

%%%%%%%%%%%%%%%%%%%%

fprintf('\nDelayed efflux\n')

Up = um+(un-um)*exp(-bet*tau);
G6 = alf*tau*b*um/(1-b*um) - alf/bet * log(1-b*Up) + alf/bet / (1-b*um) * log((b*Up-1)/(b*un-1));
% G6 = exp(G6);
subs(subs(G6,un,0),um,0);
m1 = subs(subs(diff(G6,un),un,0),um,0);
m2 = subs(subs(diff(G6,um),un,0),um,0);
f1 = simplify(subs(subs(diff(G6,un,2),un,0),um,0)/m1);
f2 = simplify(subs(subs(diff(G6,um,2),un,0),um,0)/m2);
cov = simplify(subs(subs(diff(diff(G6,um),un),un,0),um,0));


fprintf('m1: %s\n',simplify(m1))
fprintf('m2: %s\n',m2)
fprintf('f1: %s\n',simplify(f1))
fprintf('f2: %s\n',simplify(f2))
fprintf('cov: %s\n',cov)
corr = cov/sqrt((f1+1)*(f2+1)*m1*m2);
fprintf('corr^2: %s\n',simplify(corr^2))



%%%%%%%%%%%%%%%%%%%%

fprintf('\nDelayed splicing\n')

G5 = alf*tau*b*un/(1-b*un) - alf/gam * log(1-b*um);

m1 = subs(subs(diff(G5,un),un,0),um,0);
m2 = subs(subs(diff(G5,um),un,0),um,0);
f1 = simplify(subs(subs(diff(G5,un,2),un,0),um,0)/m1);
f2 = simplify(subs(subs(diff(G5,um,2),un,0),um,0)/m2);
cov = simplify(subs(subs(diff(diff(G5,um),un),un,0),um,0));


fprintf('m1: %s\n',m1)
fprintf('m2: %s\n',m2)
fprintf('f1: %s\n',f1)
fprintf('f2: %s\n',f2)
fprintf('cov: %s\n',cov)
corr = cov/sqrt((f1+1)*(f2+1)*m1*m2);
fprintf('corr^2: %s\n',simplify(corr^2))

return