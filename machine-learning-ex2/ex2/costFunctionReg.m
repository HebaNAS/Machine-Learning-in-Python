function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

predictions = sigmoid(X * theta);

err = predictions - y;

thetaMod = theta;
thetaMod(1) = 0;

part_1 = -y' * log(predictions);

part_2 = -(1 - y') * log(1 - predictions);

part_3 = (lambda / (2 * m)) * ((theta(2:length(theta)))' * theta(2:length(theta)));

part_4 = lambda / m * thetaMod';

J = ((1 / m) * (part_1 + part_2)) + part_3;

grad = ((1 / m) * err' * X) + part_4;


% =============================================================

end
