#read in .oct file
data = load('./ex1_set01.oct');

#data point x-values
x = (data.x)';

#data point y-values
y = data.y;

#plot data points
plot(x, y, '+')

S = zeros(7, 7);
#Exact polynomial: Sc = y
for i=1:7
    for j=1:7
        S(i, j) = x(i)^(j - 1);
    end
end

Sinv = inv(S);
c = Sinv * y;

#generate polynomial fit
pts = 40;
x2 = [1:pts]/pts;
y2 = zeros(pts, 1);

for i=1:40
    for j=1:7
        y2(i) = y2(i) + c(j) * x2(i)^(j - 1);
    end
end

%plot resulting polynomial fit
hold on
plot(x2, y2)
hold off