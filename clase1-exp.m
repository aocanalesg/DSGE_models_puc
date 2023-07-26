// Preamble
// Variables endogenas
var c $c$ (long_name='consumption')
i $i$ (long_name='investment')
k $k$ (long_name='capital')
y $y$ (long_name='output')
a $a$ (long_name='AR(1) technology shock')
;
// List of predetermined variables
predetermined_variables k;
// Exogeneous variables
varexo e;

// Parameters name
parameters alph $\alpha$ (long_name='capital share')
betta $\beta$ (long_name='discount factor')
sigm $\sigma$ (long_name='risk aversion')
delta $\delta$ (long_name='depreciation rate')
sigm_e $\sigma_e$ (long_name='standard deviation')
rho $\rho$ (long_name='autocorr. tech. shock')
;
// Parameters value
alph = 0.36;
betta = 0.99;
sigm = 2;
delta = 0.025;
sigm_e = 0.01;
rho = 0.95;

// Model block
model;
exp(c)ˆ(-sigm)=betta*exp(c(+1))ˆ(-sigm)*..
(alph*exp(a(+1))*exp(k)ˆ(alph-1)+1-delta);
exp(k)=(1-delta)*exp(k(-1))+exp(i);
exp(y)=exp(a)*exp(k(-1))ˆalph;
exp(y)=exp(c)+exp(i);
a=rho*a(-1)+e;
end; // close the model block
// Modelo en latex
write_latex_original_model;

// Steady state
initval;
a=1;
k=(((1-betta*(1-delta))/alph*a)^(1/(alph-1)));
y=(exp(a)*k);
i=(delta*k);
c=(y-i);
end; // close steady state
// Checking Blanchard-Kahn rank condition
resid(1);
steady;
check;

// Shocks
shocks;
var e=sigm_e^2;
end;
// Computation
stoch_simul(order=1,irf=40);