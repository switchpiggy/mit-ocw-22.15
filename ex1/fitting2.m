#dataset size, params size
dpts = 25
#1: constant fit, 2: linear fit, 3: polynomial fit
param_sz = 3

#read in dataset
data = load('numbers.oct');

#data point x-values
x = (data.x)';

#data point y-values
y = data.y;

#plot data points
plot(x, y, '+')

S = zeros(dpts, param_sz);
#Exact polynomial: Sc = y
for i=1:dpts
    for j=1:param_sz
        S(i, j) = x(i)^(j - 1);
    end
end

Sinv = pinv(S);
c = Sinv * y;

#generate polynomial fit
pts = 100;
x2 = [1:pts]/pts;
y2 = zeros(pts, 1);

for i=1:pts
    for j=1:param_sz
        y2(i) = y2(i) + c(j) * x2(i)^(j - 1);
    end
end

%plot resulting polynomial fit
hold on
plot(x2, y2)
hold off