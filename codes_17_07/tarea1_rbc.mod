// Ejemplo RBC ayudantía 1
// Felipe Martínez

// Preamble

// Variables endógenas
var c $c$ (long_name='consumption')
    i $i$ (long_name='investment')
    k $k$ (long_name='capital')
    y $y$ (long_name='output')
    a $a$ (long_name='AR(1) technology shock')
    w $w$ (long_name='wage')
    q $q$ (long_name='ratio of multipliers')
    l $l$ (long_name='labor')
    r $r$ (long_name='capital rate return')
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
           gamma    $\gamma$  (long_name='elasticity substitution')
           psi      $\psi$     (long_name='cost of adjustment')
;


// Parameters value
alph    =0.3;
betta   =0.96;
gamma   =0.4;
delta   =0.025;
sigm    =2;
psi     =6;
rho     =0.90;
sigm_e  =0.01;



// Model block
model;
exp(w)=(1-gamma)/(gamma)*(exp(c))/(1-exp(l));
q=betta*(exp(c))/(exp(c(+1)))*(exp(r(+1))+q(+1)*(1-delta));
1=q*(1-psi/2*(exp(i)/exp(i(+1))-1)^2-psi*(exp(i)/exp(i(+1))-1)*exp(i)/exp(i(-1)))+betta*(exp(c))/(exp(c(+1)))*q(+1)*((exp(i))/(exp(i(-1))-1)*((exp(i(+1)))/(exp(i)))^2;
exp(y)=exp(a)*exp(k)^alph*exp(l)^(1-alph);
exp(k(+1))=(1-delta)*exp(k)+[1-psi*(exp(i)/exp(i(-1)))*exp(i);
exp(y)=exp(c)+exp(i);
a=rho*a(-1)+sigm_e*+varexo;
end;                // close the model block

// Modelo en latex
write_latex_original_model;

// Steady state
initval;
a=1;
k=(((1-betta*(1-delta))/alph*a)^(1/(alph-1)));
y=(exp(a)*k);
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

