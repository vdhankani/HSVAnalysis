%only for classes B, C, and D
%load data
IC3 = load('.\LDAData\FinalIC3SecondGen.dat');
IC7 = load('.\LDAData\FinalIC7SecondGen.dat');
IC10 = load('.\LDAData\FinalIC10SecondGen.dat');

nIC3 = size(IC3,1);
nIC7 = size(IC7,1);
nIC10 = size(IC10,1);


%initialize variables
resubError = 0.0;
testError = 0.0;
class3TrainingError = 0.0;
class7TrainingError = 0.0;
class10TrainingError = 0.0;
class3TestError = 0.0;
class7TestError = 0.0;
class10TestError = 0.0;


%1000 runs of randomly selected training and test sets

for run=1:1000

    trainingIC3 = [];trainingIC7 = [];trainingIC10 = [];
    testIC3 = [];testIC7 = [];testIC10 = [];
    zeroSizeFlag = 1;
    while zeroSizeFlag
        for j=1:nIC3
            p = rand(1); 
            if p > 0.8
                testIC3 = [testIC3;IC3(j,:)];
            else
                trainingIC3 = [trainingIC3;IC3(j,:)];
            end
        end
        if size(testIC3,1) && size(trainingIC3,1)
            zeroSizeFlag = 0;
        end
    end

    zeroSizeFlag = 1;
    while zeroSizeFlag
        for j=1:nIC7
            p = rand(1); 
            if p > 0.8
                testIC7 = [testIC7;IC7(j,:)];
            else
                trainingIC7 = [trainingIC7;IC7(j,:)];
            end
        end
        if size(testIC7,1) && size(trainingIC7,1)
            zeroSizeFlag = 0;
        end
    end

    zeroSizeFlag = 1;
    while zeroSizeFlag
        for j=1:nIC10
            p = rand(1); 
            if p > 0.8
                testIC10 = [testIC10;IC10(j,:)];
            else
                trainingIC10 = [trainingIC10;IC10(j,:)];
            end
        end
        if size(testIC10,1) && size(trainingIC10,1)
            zeroSizeFlag = 0;
        end
    end

% 

    trainingIC3 = trainingIC3';
    trainingIC7 = trainingIC7';
    trainingIC10 = trainingIC10';

    testIC3 = testIC3';
    testIC7 = testIC7';
    testIC10 = testIC10';

    % % %delete I0 values
    trainingIC3(1,:) = [];
    trainingIC7(1,:) = [];
    trainingIC10(1,:) = [];

    testIC3(1,:) = [];
    testIC7(1,:) = [];
    testIC10(1,:) = [];

    trainingX = [trainingIC7 , trainingIC10];
    testX = [testIC7 , testIC10];
    totalX = [trainingX , testX];

    trainingY = [ones(size(trainingIC7,2),1);2*ones(size(trainingIC10,2),1)];
    testY = [ones(size(testIC7,2),1);2*ones(size(testIC10,2),1)];
    totalY = [trainingY;testY];


    %NAIVE BAYES CLASSIFIER
    %resubstitution error
    %Distribution = normal/kernel, prior = empirical
    nbKD = NaiveBayes.fit(trainingX',trainingY,'dist','normal','prior','uniform');
    nbKDClass = nbKD.predict(trainingX');
    bad = (nbKDClass ~= trainingY);
    resubError = resubError + sum(bad)/size(trainingX',1);
    %per class error
    I = find(trainingY == 1);
    class3TrainingError = class3TrainingError + sum(nbKDClass(I) ~= 1)/length(I);
    
    I = find(trainingY == 2);
    class7TrainingError = class7TrainingError + sum(nbKDClass(I) ~= 2)/length(I);
    
    I = find(trainingY == 3);
    class10TrainingError = class10TrainingError + sum(nbKDClass(I) ~= 3)/length(I);

    %test set prediction
    nbTestClass = nbKD.predict(testX');
    bad = (nbTestClass ~= testY);
     
    %per class test error
    I = find(testY == 1);
    class3TestError = class3TestError + sum(nbTestClass(I) ~= 1)/length(I);
 
    I = find(testY == 2);
    class7TestError = class7TestError + sum(nbTestClass(I) ~= 2)/length(I);

    I = find(testY == 3);
    class10TestError = class10TestError + sum(nbTestClass(I) ~= 3)/length(I);
     
    %partition into training and cross validation set
    %cp = cvpartition(totalY,'k',10);
    %define predict func
    %nbKDClassFun = @(xtrain,ytrain,xtest)(predict(NaiveBayes.fit(xtrain,ytrain,'dist','kernel'),xtest));
    %nbKDCVErr = crossval('mcr',totalX',totalY,'predfun',nbKDClassFun,'partition',cp);


%    DECISION TREE
        t = classregtree(trainingX',trainingY,'method','classification','minleaf',minParent,'names',{'T0','T1','T2','T3','T4','T5','T6','T7','T8','T9','T10','T11'});
        % view(t);
        dtClass = t.eval(trainingX');
        dtClass = cellfun(@(x)str2double(x),dtClass); %convert cell to double array if method = 'classification'
        bad = (dtClass ~= trainingY);
        resubError = resubError + sum(bad)/size(trainingX',1);  %add over all runs
        %per class training error
        I = find(trainingY == 1);
        class3TrainingError = class3TrainingError + sum(dtClass(I) ~= 1)/length(I);

        I = find(trainingY == 2);
        class7TrainingError = class7TrainingError + sum(dtClass(I) ~= 2)/length(I);

        I = find(trainingY == 3);
        class10TrainingError = class10TrainingError + sum(dtClass(I) ~= 3)/length(I);

        %test set prediction
        dtClass = t.eval(testX');
        dtClass = cellfun(@(x)str2double(x),dtClass); %if method='classification'
        bad = (dtClass ~= testY);
        testError = testError + sum(bad)/size(testX',1);
        
        %per class test error
        I = find(testY == 1);
        class3TestError = class3TestError + sum(dtClass(I) ~= 1)/length(I);

        I = find(testY == 2);
        class7TestError = class7TestError + sum(dtClass(I) ~= 2)/length(I);

        I = find(testY == 3);
        class10TestError = class10TestError + sum(dtClass(I) ~= 3)/length(I);


    %   CROSS VALIDATION   
       dtClassFun = @(xtrain,ytrain,xtest)(eval(classregtree(xtrain,ytrain),xtest));
       dtCVError = crossval('mcr',totalX',totalY,'predfun',dtClassFun,'partition',cp);

%     %SVM
    %class performance object
    cp = classperf(trainingY);
    % Use a linear support vector machine classifier
    options = optimset('maxiter',1000);
    svmStruct = svmtrain(trainingX',trainingY,'kernel_function','mlp','method','QP');
    %QUADRATIC kernel function OVERFITS, giving 9.88% training error, 39% test
    %error
    % Classify the training set using svmclassify
    classes = svmclassify(svmStruct,trainingX');
    bad = (classes~=trainingY);
    resubError = resubError + sum(bad)/length(trainingY);
    % Classify the test set using svmclassify
    classes = svmclassify(svmStruct,testX');
    bad = (classes~=testY);
    testError = testError + sum(bad)/length(testY);

end
    
resubError = resubError/1000
class3TrainingError = class3TrainingError/1000
class7TrainingError = class7TrainingError/1000
class10TrainingError = class10TrainingError/1000
testError = testError/1000
class3TestError = class3TestError/1000
class7TestError = class7TestError/1000
class10TestError = class10TestError/1000

resubErrorPerParam = [resubErrorPerParam;resubError];
testErrorPerParam = [testErrorPerParam;testError];    
end

resubError = resubError/1000
class3TrainingError = class3TrainingError/1000
class7TrainingError = class7TrainingError/1000
class10TrainingError = class10TrainingError/1000
 
class3TestError = class3TestError/1000
class7TestError = class7TestError/1000
class10TestError = class10TestError/1000

testError = testError/1000
