%function [func, Uf] = Incertitude(f, varlist, value)
function func = Incertitude(f, varlist)
size = numel(varlist);
d = vpa(ones(1,size));
U = sym('U',[1 size]);
for i=1:size
    d(i) = diff(f, varlist(i),1);
    U(i) = sym(strcat('U',varlist(i)));
end
func = sqrt((sum((d.^2).*(U.^2))));
func = simplify(func);
%func=symfun(func,mix(varlist,U));
func = matlabFunction(func);

end

% function mixed = mix(A, B)
% N = max(numel(A),numel(B));
% ia = 1+rem(0:N-1, numel(A)) ;
% ib = 1+rem(0:N-1, numel(B));
% C = [A(ia) ; B(ib)];
% mixed = reshape(C,1,[]) ;
% end