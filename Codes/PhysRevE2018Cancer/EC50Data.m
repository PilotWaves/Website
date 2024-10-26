tic
Data = zeros(18,3);
A = Data;

MaxResp = zeros(18,1);

Data(1,:) = [0.2404 0.3802 0.4735];     MaxResp(1) = 0.5417; %1
Data(2,:) = [0.2452 0.4653 0.6192];     MaxResp(2) = 0.8134; %2
Data(3,:) = [0.3378 0.8467 0.8863];     MaxResp(3) = 0.9414; %3
Data(4,:) = [0.2365 0.5982 0.7591];     MaxResp(4) = 0.8621; %4
Data(5,:) = [0.17 0.4072 0.6577];       MaxResp(5) = 0.9276; %5
Data(6,:) = [0.1227 0.2373 0.2676];     MaxResp(6) = 0.4242; %6
Data(7,:) = [0.1081 0.1839 0.183];      MaxResp(7) = 0.3742; %7
Data(8,:) = [0.1363 0.2956 0.3814];     MaxResp(8) = 0.5342; %8
Data(9,:) = [0.1371 0.2319 0.2586];     MaxResp(9) = 0.3831; %9
Data(10,:) = [0.0518 0.0779 0.105];     MaxResp(10) = 0.1648; %13
Data(11,:) = [0.0523 0.0671 0.0599];    MaxResp(11) = 0.0977; %14
Data(12,:) = [0.0874 0.1007 0.1444];    MaxResp(12) = 0.1576; %16
Data(13,:) = [0.1346 0.3114 0.6442];    MaxResp(13) = 0.8202; %18
Data(14,:) = [0.0236 0.0408 0.0967];    MaxResp(14) = 0.1433; %31
Data(15,:) = [0.0127 0.0277 0.1052];    MaxResp(15) = 0.1506; %32
Data(16,:) = [0.032 0.0561 0.2647];     MaxResp(16) = 0.293;%33
Data(17,:) = [0.03 0.0514 0.2389];      MaxResp(17) = 0.3136;%34
Data(18,:) = [0.0206 0.0385 0.1033];    MaxResp(18) = 0.193;%35
A(1:18,1) = [1:18]';

parfor i = 1:18
   [ED50,~] = EC50(Data(i,:),MaxResp(i)/2);
   A(i,2) = ED50/(4*pi/3);
end

parfor i = 1:18
   [~,R50] = EC50(Data(i,:),MaxResp(i)/2);
   A(i,3) = abs(R50-MaxResp(i)/2);
end

toc