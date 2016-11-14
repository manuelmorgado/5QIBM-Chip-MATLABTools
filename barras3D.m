%3D Bars Tomography plot
%Manuel Morgado
%November 2016

% The date comes here.
% data=[ 1 2.5 0 0;1.12 3 0 0 ; 0 0 7 3.4; 0 0 7 0.867030321936364];

function graph=barras3D(data)
    % Plot the data.
    graf = bar3(data);

    % Define and set up the colormap.
    CM = get(gcf,'colormap');  

    cnt = 0;

    % Loop which set the the color for each bar.
    for jj = 1:length(graf)
        xd = get(graf(jj),'xdata');
        yd = get(graf(jj),'ydata');
        zd = get(graf(jj),'zdata');
        delete(graf(jj))    
        idx = [0;find(all(isnan(xd),2))];
        if jj == 1
            S = zeros(length(graf)*(length(idx)-1),1);
            dv = floor(size(CM,1)/length(S));
        end
        for ii = 1:length(idx)-1
            cnt = cnt + 1;
            S(cnt) = surface(xd(idx(ii)+1:idx(ii+1)-1,:),...
                             yd(idx(ii)+1:idx(ii+1)-1,:),...
                             zd(idx(ii)+1:idx(ii+1)-1,:),...
                             'facecolor',CM((cnt-1)*dv+1,:));
        end
    end
end