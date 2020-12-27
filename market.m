%% MATLAB replica of a Vernon Smith Market Experiment
% Creation of an artificial token market
%% Author: Diego Ciccia


%% An artificial market
% The following code recreates the formulation of a Vernon Smith experiment
% about market formation. In a population of N sellers and N buyers of a single 
% good, each seller is handed a card containing the indication of his cost of
% production, so that he will be awarded the difference between the price
% at which he sells the good and its cost of production; at the same time,
% each buyer is handed a card that indicates the resale value of the good,
% such that he will be awarded the difference between the resale value and
% the purchase price for the good. 
% The transactions between the two groups occur according to the
% bid-asked-price reduction rule, so that sellers call out publicly asking 
% prices and buyers make their counterbid at a lower price. Competitive bidding
% occurs until an equilibrium is found at E.  

N=30;%n° of sellers and buyers

D=zeros(N,2);
S=zeros(N,2);
for i=1:N
    D(i,:)=[i,N-i];%resale value tickets (blue points)
    S(i,:)=[i,i];%production costs tickets (red points)
end
scatter(D(:,1),D(:,2), 'b', 'filled')
hold on
grid on
scatter(S(:,1),S(:,2), 'r', 'filled')

d=0;%starting prices
s=N;
while d<=(N/2) && s>=(N/2)
    for i=1:N
        if S(i,2)<=s
            plot([i,i-1], [s,s], 'r')
            hold on
            drawnow
        end
        if D(i,2)>=d
            plot([i-1, i], [d, d], 'b')
            hold on
            drawnow
        end
    end
    d=d+1;
    s=s-1;   
end

plot([N/2, N/2], [0, N/2], 'k')
plot([0, N/2], [N/2, N/2], 'k')       
scatter(N/2,N/2,10, 'k', 'filled')%equilibrium point     
text(N/2 + 0.3, N/2 + 0.3, 'E')
