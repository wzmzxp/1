

function PlotCosts(pop)

    Costs=[pop(:).Cost];
    Costs=reshape(Costs,2,[])
    plot(Costs(1,:),Costs(2,:),'r*','MarkerSize',8);
    xlabel('1^{st} Objective');
    ylabel('2^{nd} Objective');
    title('Non-dominated Solutions (F_{1})');
    grid on;

end