function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = tarea1_rbc2.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(9, 17);
g1(1,4)=(-T(1));
g1(1,9)=exp(y(9));
g1(1,11)=(-((-((1-params(6))/params(6)*exp(y(4))*(-exp(y(11)))))/((1-exp(y(11)))*(1-exp(y(11))))));
g1(2,4)=(-T(3));
g1(2,13)=(-((exp(y(16))+y(15)*(1-params(3)))*(-(exp(y(4))*params(2)*exp(y(13))))/(exp(y(13))*exp(y(13)))));
g1(2,10)=1;
g1(2,15)=(-(T(2)*(1-params(3))));
g1(2,16)=(-(T(2)*exp(y(16))));
g1(3,4)=(-T(11));
g1(3,13)=(-(T(10)*T(6)*params(7)*y(15)*params(2)*(-(exp(y(4))*exp(y(13))))/(exp(y(13))*exp(y(13)))));
g1(3,1)=(-(y(10)*(-(params(7)*T(6)*T(16)+T(5)*params(7)*T(16)))+T(10)*T(8)*T(16)));
g1(3,5)=(-(y(10)*((-(T(4)*exp(y(5))/exp(y(14))*2*(exp(y(5))/exp(y(14))-1)))-(T(5)*params(7)*T(6)+T(5)*params(7)*T(5)))+T(10)*T(5)*T(8)+T(6)*T(8)*(-(exp(y(5))*exp(y(14))))/(exp(y(5))*exp(y(5)))*2*T(9)));
g1(3,14)=(-(y(10)*(-(T(4)*2*(exp(y(5))/exp(y(14))-1)*(-(exp(y(5))*exp(y(14))))/(exp(y(14))*exp(y(14)))))+T(6)*T(8)*T(9)*2*T(9)));
g1(3,10)=(-T(7));
g1(3,15)=(-(T(10)*T(6)*params(7)*params(2)*exp(y(4))/exp(y(13))));
g1(4,2)=(-(T(12)*exp(y(8))*exp(y(2))*getPowerDeriv(exp(y(2)),params(1),1)));
g1(4,7)=exp(y(7));
g1(4,8)=(-T(15));
g1(4,11)=(-(T(14)*exp(y(11))*getPowerDeriv(exp(y(11)),1-params(1),1)));
g1(5,1)=(-(exp(y(5))*(-(T(4)*T(16)*2*T(6)))));
g1(5,5)=(-(T(13)+exp(y(5))*(-(T(4)*T(5)*2*T(6)))));
g1(5,2)=(-((1-params(3))*exp(y(2))));
g1(5,6)=exp(y(6));
g1(6,4)=(-exp(y(4)));
g1(6,5)=(-exp(y(5)));
g1(6,7)=exp(y(7));
g1(7,3)=(-params(5));
g1(7,8)=1;
g1(7,17)=(-params(4));
g1(8,2)=(-((-(exp(y(7))*params(1)*exp(y(2))))/(exp(y(2))*exp(y(2)))));
g1(8,7)=(-(exp(y(7))*params(1)/exp(y(2))));
g1(8,12)=exp(y(12));
g1(9,7)=(-(exp(y(7))*(1-params(1))/exp(y(11))));
g1(9,9)=exp(y(9));
g1(9,11)=(-((-(exp(y(11))*exp(y(7))*(1-params(1))))/(exp(y(11))*exp(y(11)))));

end
