m=exmotion('ctcv2d');
sm = exsensor('toa', 4, 1, 4);
sm.th=[2,2,2,-2,-2,-2,-2,2]';
sm.x0 = [0,0];
mms = addsensor(m,sm); %Several sensors can be added sequentially
mms.th = [1,1,1,-1,-1,-1,-1,1]';
mms.x0 = [0.5,0.5,0.5,0.5, 0.5];
mms.pv = diag([1 1 1 1 1]);
mms.pv = 0.1*mms.pv; 	%reduce the velocity
mms.px0 = 10*mms.pv;

y=simulate(mms,10);

mnl1=nl(mms); 

% crlb
xcrlb=crlb(mnl1,y);
% Plot only crlb
plot(sm)
hold on
% xplot2(xcrlb,'conf',90);
hold on

% KF
xhat1=kalman(mms,y);
% Plot crlb and KF
figure
xplot2(xcrlb,xhat1,'conf',90);