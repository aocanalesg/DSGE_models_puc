function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = tarea1_rbc2.static_g1_tt(T, y, x, params);
end
g1 = zeros(9, 9);
g1(1,1)=(-T(1));
g1(1,6)=exp(y(6));
g1(1,8)=(-((-((1-params(6))/params(6)*exp(y(1))*(-exp(y(8)))))/((1-exp(y(8)))*(1-exp(y(8))))));
g1(2,7)=1-params(2)*(1-params(3));
g1(2,9)=(-(params(2)*exp(y(9))));
g1(3,7)=(-1);
g1(4,3)=(-(T(2)*exp(y(5))*exp(y(3))*getPowerDeriv(exp(y(3)),params(1),1)));
g1(4,4)=exp(y(4));
g1(4,5)=(-T(4));
g1(4,8)=(-(T(3)*exp(y(8))*getPowerDeriv(exp(y(8)),1-params(1),1)));
g1(5,2)=(-exp(y(2)));
g1(5,3)=exp(y(3))-(1-params(3))*exp(y(3));
g1(6,1)=(-exp(y(1)));
g1(6,2)=(-exp(y(2)));
g1(6,4)=exp(y(4));
g1(7,5)=1-params(5);
g1(8,3)=(-((-(exp(y(3))*exp(y(4))*params(1)))/(exp(y(3))*exp(y(3)))));
g1(8,4)=(-(exp(y(4))*params(1)/exp(y(3))));
g1(8,9)=exp(y(9));
g1(9,4)=(-(exp(y(4))*(1-params(1))/exp(y(8))));
g1(9,6)=exp(y(6));
g1(9,8)=(-((-(exp(y(8))*exp(y(4))*(1-params(1))))/(exp(y(8))*exp(y(8)))));
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
