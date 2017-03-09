function K=k(x, y, hyp, i)

logsigma = hyp(1);
logtheta = hyp(2);

n_x = size(x,1);
n_y = size(y,1);

x = x*ones(1,n_y);
y = ones(n_x,1)*y';

if i==0
    
    K = 2.*pi.^(-1).*asin((exp(1).^logsigma+exp(1).^logtheta.*x.*y).*((1+exp(1).^logsigma+exp(1).^logtheta.*x.^2).*(1+exp(1).^logsigma+exp(1).^logtheta.*y.^2)).^(-1/2));
    
elseif i== 1
    
    K = exp(1).^logsigma.*pi.^(-1).*((1+exp(1).^logsigma+exp(1) ...
        .^logtheta.*x.^2).*(1+exp(1).^logsigma+exp(1).^logtheta.*y.^2)).^( ...
        -3/2).*(2+2.*exp(1).^logsigma+exp(1).^(logsigma+logtheta).*(x+(-1) ...
        .*y).^2+(-1).*exp(1).^(2.*logtheta).*x.*(x+(-1).*y).^2.*y+2.*exp( ...
        1).^logtheta.*(x.^2+(-1).*x.*y+y.^2)).*(1+(-1).*(1+exp(1) ...
        .^logsigma+exp(1).^logtheta.*x.^2).^(-1).*(exp(1).^logsigma+exp(1) ...
        .^logtheta.*x.*y).^2.*(1+exp(1).^logsigma+exp(1).^logtheta.*y.^2) ...
        .^(-1)).^(-1/2);
    
elseif i== 2
    
    K = exp(1).^logtheta.*pi.^(-1).*((1+exp(1).^logsigma+exp(1) ...
        .^logtheta.*x.^2).*(1+exp(1).^logsigma+exp(1).^logtheta.*y.^2)).^( ...
        -3/2).*(1+(-1).*(1+exp(1).^logsigma+exp(1).^logtheta.*x.^2).^(-1) ...
        .*(exp(1).^logsigma+exp(1).^logtheta.*x.*y).^2.*(1+exp(1) ...
        .^logsigma+exp(1).^logtheta.*y.^2).^(-1)).^(-1/2).*((-1).*exp(1) ...
        .^(2.*logsigma).*(x+(-1).*y).^2+exp(1).^(logsigma+logtheta).*x.*( ...
        x+(-1).*y).^2.*y+(-1).*exp(1).^logsigma.*(x.^2+(-4).*x.*y+y.^2)+ ...
        x.*y.*(2+exp(1).^logtheta.*(x.^2+y.^2)));
    
end

end