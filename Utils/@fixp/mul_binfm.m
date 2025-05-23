function binc = mul_binfm(bina,binb);
%MUL_BINFM componentwise multiplication of two matrices of binary fixed point numbers

% Both inputs must have the same parameters (nbits and es). The result will also have
% the same parameters

% dependancies: mul_binf

%
% Author G. Meurant
% April 2020
%

[rowa,cola] = size(bina); % number of rows and columns
[rowb,colb] = size(binb);
if rowa ~= rowb || cola ~= colb
 error(' mul_binfm: incompatible dimensions of inputs')
end % if

% Create a binary element and set its parameters
binc = bina;

% for i = 1:rowa
%  for j = 1:cola
%   ba = bina(i,j);
%   bb = binb(i,j);
%   bc = mul_binf(ba,bb);
%   binc(i,j).sign = bc.sign;
%   binc(i,j).I = bc.I;
%   binc(i,j).F = bc.F;
%   binc(i,j).float = bc.float;
%   binc(i,j).nbits = bc.nbits;
%  end % for j
% end % for i

for i = 1:rowa
 for j = 1:cola
  binc(i,j) = mul_binf(bina(i,j),binb(i,j));
 end % for j
end % for i