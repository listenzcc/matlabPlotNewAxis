close all
clear
clc

load test2

%% 改这里
curveY = squeeze(meand); % y 值
curveX = [-200:1000-1];  % x 值

xLimit = [-200 800];     % x 范围
yLimit = [-3 3];         % y 范围

curveName = {'lineA', 'lineB'}; % 曲线名称
tickHight = 0.01; % Tick 高度


%% 尽量别动下面

figure,
plot(curveX, curveY, 'w');
xlim(xLimit)
ylim(yLimit)
set(gca, 'ydir', 'reverse')
set(gca, 'box', 'off')

myXLim = get(gca, 'xlim');
myYLim = get(gca, 'ylim');
myXTick = get(gca, 'xtick');
myYTick = get(gca, 'ytick');

xT = line(myXLim, [0 0]);
set(xT, 'color', 'k')
yT = line([0 0], myYLim);
set(yT, 'color', 'k')

set(gcf, 'color', 'w')
axis('off')

zccpx = @(p) p*(myXLim(2)-myXLim(1));
zccpy = @(p) p*(myYLim(2)-myYLim(1));
text(0-zccpx(0.01), 0+zccpy(0.03), num2str(0), 'HorizontalAlignment', 'right')
for y = myYTick
    if y==0
        continue
    end
    text(0-zccpx(0.01), y+zccpy(0.01), num2str(y), 'HorizontalAlignment', 'right')
    line([0 zccpx(tickHight)], [y y], 'color', 'k')
end
for x = myXTick
    if x==0
        continue
    end
    text(x+zccpx(0.01), 0+zccpy(0.025), num2str(x), 'HorizontalAlignment', 'right');
    line([x, x], [0 -zccpy(tickHight)], 'color', 'k')
end

hold on
lines = plot(curveX, curveY);
xlim(myXLim)
ylim(myYLim)
for l = lines'
    set(l, 'lineWidth', 2)
end
hold off
legend(lines, curveName)

