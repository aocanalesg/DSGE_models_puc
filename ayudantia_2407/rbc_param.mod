// Ejemplo RBC ayudantía 1
// Felipe Martínez

// Preamble

// Variables endógenas
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
parameters alph     $\alpha$    (long_name='capital share')
           betta    $\beta$     (long_name='discount factor')
           sigm     $\sigma$    (long_name='risk aversion')
           delta    $\delta$    (long_name='depreciation rate')
           sigm_e   $\sigma_e$  (long_name='standard deviation')
           rho      $\rho$      (long_name='autocorrelation technology shock')
;

// Parameters value
load delta;
set_param_value('delta', delta);
alph=0.36;
betta=0.99;
// delta=0.025;
sigm=2;
sigm_e=0.01;
rho=0.95;

// Model block
model;
c^(-sigm)=betta*c(+1)^(-sigm)*(alph*exp(a(+1))*k(+1)^(alph-1)+1-delta);
k(+1)=(1-delta)*k+i;
y=exp(a)*k^alph;
y=c+i;
a=rho*a(-1)+e;
end;                // close the model block

// Modelo en latex
write_latex_original_model;

// Steady state
steady_state_model;
a=0;
k=(((1-betta*(1-delta))/(alph*exp(a)*betta))^(1/(alph-1)));
y=(exp(a)*k^alph);
i=(delta*k);
c=(y-i);
end;                // close steady state

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

