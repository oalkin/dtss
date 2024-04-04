function [out,states] = ss_iir2f(inp,coeffs,states)
  out = zeros(size(inp));     % Placeholder for output frame 
  frameSize = size(inp,1);  % Number of samples in each frame
  % Extract the filter states
  r1 = states(1,:);
  r2 = states(2,:);
  % Extract the coefficients
  b0 = coeffs(1);
  b1 = coeffs(2);
  b2 = coeffs(3);
  a1 = coeffs(5);
  a2 = coeffs(6);
  for i=1:frameSize
    % Compute the output sample
    r0 = inp(i,:)-a1*r1-a2*r2;
    out(i,:) = b0*r0+b1*r1+b2*r2;
    % Update the filter states: r2 <-- r1 then r1 <-- r0
    r2 = r1;
    r1 = r0;
  end
  % Return updated states to preserve them
  states(1,:) = r1;
  states(2,:) = r2;
end