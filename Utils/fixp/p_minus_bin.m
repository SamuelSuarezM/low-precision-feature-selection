function [p,cnext]=p_minus_bin(a,b,type);
%P_MINUS_BIN subtraction of two binary strings (positive integers)

% p = a - b

% a and b are unsigned binary numbers

% stored as arrays of 0's and 1's of sizes (1,na) and (1,nb)

% cnext = 1 tells that there was a last borrow added to the left

% straightforward algorithm with propagation of the borrows to the left

% 
% Author G. Meurant
% April 2020
%

if sum(b) == 0
 p = a;
 return
end % if

if nargin == 2
 type = 1; % we remove the leading zeros
end % if

if p_isge_bin(a,b) == 0
 % a is < b
 fprintf('\n p_minus_bin(a,b): a is strictly smaller than b, we return b - a \n')
 [p,cnext] = p_minus_bin(b,a);
 return
end % if

% now we assume that a > b

c = zeros(2,2);
c(1,2) = 1;
c(2,1) = 1;
cbor = zeros(2,2); % borrows
cbor(1,2) = 1;

% results with borrows
cb = zeros(2,2);
cb(1,1) = 1;
cb(2,2) = 1;
cbbor = ones(2,2); % borrows
cbbor(2,1) = 0;

na = length(a);
nb = length(b);
n = max(na,nb);
% padd with zeros
if nb < na
 b = [zeros(1,na-nb),b];
elseif nb > na
 a = [zeros(1,nb-na),a];
end % if

ca = 0; % carry
for k = n:-1:1
 i = a(k) + 1;
 j = b(k) + 1;
 if ca == 0
  ad = c(i,j);
  cnext = cbor(i,j);
 else
  ad = cb(i,j);
  cnext = cbbor(i,j);
 end % if
 ca = cnext;
 p(k) = ad;
end % for k

if type == 1
 % remove the leading zeros
 I = find(p);
 if ~isempty(I)
  p = p(I(1):end);
 end % if
end % if







