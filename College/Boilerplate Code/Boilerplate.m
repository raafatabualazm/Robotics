sim=remApi('remoteApi');
sim.simxFinish(-1);
clientID=sim.simxStart('127.0.0.1',19999,true,true,5000,5);
if (clientID > -1)
    disp('success!')
    
    % The code goes here
    
    sim.simxGetPingTime(clientID);
    sim.simxFinish(clientID);
else
    disp('failure')
end

sim.delete();