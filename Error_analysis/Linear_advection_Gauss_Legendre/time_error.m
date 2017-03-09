set(0,'defaulttextinterpreter','latex')
addpath ~/export_fig

nn = 6;
error = zeros(1,nn);
Ntr = 50;
T = 2^-1;
for i = 1:nn
    dt = 2^-i;
    error(i) = main(Ntr,dt,T);
end
loglog(2.^-(1:nn),error,'-*b',2.^-(1:nn),2.^(-4*(1:nn)),'--or', 'LineWidth', 2, 'MarkerSize', 10);
axis square
axis tight
h = legend('Error','$\Delta t^4$','Location','SouthEast');
set(h,'Interpreter','latex');
xlabel('$\Delta t$')
ylabel('Error')
set(gca,'FontSize',14);
set(gcf, 'Color', 'w');
tit = sprintf('Time: 0.5');
title(tit);

export_fig ./Figures/Advection_time_error.png -r300
buf = sprintf('time_error_Ntr%d.txt', Ntr);
save(buf,'-ascii','-double', 'error');