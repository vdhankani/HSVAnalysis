%INPUT: 4 classes of initial conditions. Each initial condition is a vector
%of length 6 for 6 neighboring regions of the virus reactivation site
%OUTPUT: projections of data onto the first eigen vector
function [y0,y3,y7,y10] = myLDA(IC0,IC3,IC7,IC10)
%compute within class mean from data
mu0 = mean(IC0,2);
mu3 = mean(IC3,2);
mu7 = mean(IC7,2);
mu10 = mean(IC10,2);
 
%overall mean
mu = (mu0 + mu3 + mu7 + mu10)/4;
 
%class cov matrices
sigma0 = cov(IC0');
sigma3 = cov(IC3');
sigma7 = cov(IC7');
sigma10 = cov(IC10');
 
%within class scatter matrix
Sw = sigma0 + sigma3 + sigma7 + sigma10;
 
%between class scatter matrix
Sb0 = size(IC0,2) * ((mu0 - mu)*(mu0 - mu)');
Sb3 = size(IC3,2) * ((mu3 - mu)'*(mu3 - mu));
Sb7 = size(IC7,2) * ((mu7 - mu)'*(mu7 - mu));
Sb10 = size(IC10,2) * ((mu10 - mu)'*(mu10 - mu));
 
Sb = Sb0 + Sb3 + Sb7 + Sb10;
 
%LDA
[V2,D] = eig(Sb,Sw); 
 
%max eigen value and corresponding normalized eigen vector
[lambda,I] = sort(abs(diag(D)),'descend');
    
%projection vectors in direction of first and second eigen vectors
w1 = V2(:,I(1));w1 = w1/norm(w1,2);
w2 = V2(:,I(2));w2 = w2/norm(w2,2);
 
%project data samples along first projection vector
y0 = w1'*trainingIC0; 
y3 = w1'*trainingIC3; 
y7 = w1'*trainingIC7; 
y10 = w1'*trainingIC10; 
end

