//Tarea 2. Acelerador Financiero y Politica Monetaria
%Elaborado por Axel Canales y Matilde Cerda
//------------------------------------------
// Preambulo
//------------------------------------------
// Variables
var pi
y 
r 
rb 
rdif 
yn 
ygap 
n;
varexo theta,z,psi, eps;

// Parameters
parameters betta rbar omega xi gamma pibar sigm_f alph nu kappa eta mu rho_psi rho_eps;

// Parameters value
load xi;
set_param_value('xi', xi);
betta = 0.99;
rbar = 1/betta-1;
omega = 0.75; % share de firmas que no puede ajustar sus precio ese periodo
//xi = 0.2; %elasticidad de la oferta de trabajo
gamma = 0.2; % respuesta de la tasa de interes ante desvios de inflacion
pibar = 0 ; % target de inflacion del banco 
sigm_f = 1 ; % acelerador financiero 
alph = 0.05;
nu = 0.5; %sensibilidad del spread ante el nivel del producto
kappa = (1-omega)/(omega*xi); % pendiente de la OA
eta = 9; % elasticidad de sustitucion entre bienes
mu = ln(1+eta); % mark-up
rho_psi = 0.5; % persistencia del shock de PM
rho_eps = 0.9; % persistencia del shock de spread financiero

//------------------------------------------
// Modelo
//------------------------------------------'

model(linear);
// 1. Dynamic IS
y = theta-sigm_f*rb;
// 2. Regla de Politica Monetaria
r = rbar+gamma*(pi-pibar)+psi; 
// 3. Curva de Phillips
pi = pi(-1)+kappa*(y-yn); 
//4 y 5. spread financiero 
rdif = rb-r; 
rb = alph-nu*y+eps+r;
// Producto
yn = z-xi*mu; // 6. Producto Natural
ygap = y-yn;  // 7. Brecha de Producto
n = y-z;      // 8. Empleo
end;

////------------------------------------------
// Steady State
//------------------------------------------
steady;
check;

//------------------------------------------
// Shocks
//------------------------------------------
shocks;
var psi = 0.1;
var eps = 0.1;
end;

//------------------------------------------
// Simulacion
//------------------------------------------
stoch_simul(irf=12) ygap y yn pi n r rb rdif;

