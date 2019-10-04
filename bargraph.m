a = [923.4451, 1946.023]
b = [1266.921,2628.591]
c = [1629.367,3328.631]
d = [2011.453, 4046.454]
x = [6,8,10,12]
y = [a;b;c;d]
bar(x,y)
legend('10kN/m', '50kN/m','Location','northwest')
title('Area of Steel v/s Span for varying Live Load')
xlabel('Span')
ylabel('Area of Steel')