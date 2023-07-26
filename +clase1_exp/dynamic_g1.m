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
    T = clase1_exp.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(6, 11);
g1(1,4)=exp(y(4))*getPowerDeriv(exp(y(4)),(-params(3)),1);
g1(1,9)=(-(T(3)*params(2)*exp(y(9))*getPowerDeriv(exp(y(9)),(-params(3)),1)));
g1(1,1)=(-(T(1)*params(1)*exp(y(10))*exp(y(1))*getPowerDeriv(exp(y(1)),params(1)-1,1)));
g1(1,10)=(-(T(1)*T(2)));
g1(2,5)=(-exp(y(5)));
g1(2,1)=exp(y(1));
g1(2,3)=(-((1-params(4))*exp(y(3))));
g1(3,6)=exp(y(6));
g1(3,7)=(-T(4));
g1(3,3)=(-(exp(y(7))*exp(y(3))*getPowerDeriv(exp(y(3)),params(1),1)));
g1(4,4)=(-exp(y(4)));
g1(4,5)=(-exp(y(5)));
g1(4,6)=exp(y(6));
g1(5,2)=(-params(6));
g1(5,7)=1;
g1(5,11)=(-1);
g1(6,1)=(-1);
g1(6,8)=1;

end
