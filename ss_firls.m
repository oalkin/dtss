function h = ss_firls(N,F,A,K,weights)
  M = (N-1)/2;              % Axis of symmetry
  F = [F,1-F(end-1:-1:1)];  % Mirror the set of frequencies
  A = [A,A(end-1:-1:1)];    % Mirror the amplitudes
  weights = [weights,weights(end-1:-1:1)];  % Mirror the weight factors
  k = [0:K-1]';             % Vector of frequency indices
  Fk = 0.5*k/K;             % Frequencies used in setting up equations
  Pk = interp1(F,A,Fk);     % Interpolate to get samples of ideal mag. response
  Wk = interp1(F,weights,Fk);  % Interpolate to get samples of weight factors 
  Omg = 2*pi*Fk;
  A = Type1CoeffMatrix(M,Omg);  % Get the coefficient matrix
  W = diag(Wk);             % Create a diagonal matrix with weight factors
  A = W*A;                  % Modify matrix A
  Pk = W*Pk;                % Modify vector Pk
  h = A\Pk;                 % Least-squares solution
  h = [h;h(end-1:-1:1)];    % Eqn. (/*\matexfileeqn{\ref{eq:leastsq1}}*/)
end

function A = Type1CoeffMatrix(M,Omg)
% Local function to construct the coefficient matrix A
  A = [];                              % Start with empty matrix
  for k=1:length(Omg)
    Ak = Type1CoeffVector(M,Omg(k));   % Get the row vector for Omg(k)
    A = [A;Ak];                        % Add new row to matrix A
  end;
end

function Ak = Type1CoeffVector(M,Omgk)
% Local function to build one row of the coefficient matrix
  n = [0:M-1];
  Ak = [2*cos(Omgk*(n-M)),1];          % Eqn. (/*\matexfileeqn{\ref{eq:leastsq3}}*/)
end