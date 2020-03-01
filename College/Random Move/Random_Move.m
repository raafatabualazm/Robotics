sim=remApi('remoteApi');
sim.simxFinish(-1);
clientID=sim.simxStart('127.0.0.1',19999,true,true,5000,5);
if (clientID > -1)
    disp('success!')
    
    pos = [0 0 0 0 0 0 0];
    pos1 = [0 10 30 45 75 60 25];
    pos2 = [30 48 45 75 39 25 0];
    pos3 = -pos2;
    pos4 = -pos1;
   [r, j1] = sim.simxGetObjectHandle(clientID, 'redundantRob_joint1', sim.simx_opmode_blocking);
   [r, j2] = sim.simxGetObjectHandle(clientID, 'redundantRob_joint2', sim.simx_opmode_blocking);
   [r, j3] = sim.simxGetObjectHandle(clientID, 'redundantRob_joint3', sim.simx_opmode_blocking);
   [r, j4] = sim.simxGetObjectHandle(clientID, 'redundantRob_joint4', sim.simx_opmode_blocking);
   [r, j5] = sim.simxGetObjectHandle(clientID, 'redundantRob_joint5', sim.simx_opmode_blocking);
   [r, j6] = sim.simxGetObjectHandle(clientID, 'redundantRob_joint6', sim.simx_opmode_blocking);
   [r, j7] = sim.simxGetObjectHandle(clientID, 'redundantRob_joint7', sim.simx_opmode_blocking);
    j = [j1 j2 j3 j4 j5 j6 j7];
    
    for i = 1:7
        pause(1)
        sim.simxSetJointTargetPosition(clientID, j(i), pos1(i), sim.simx_opmode_oneshot_wait);   
    end
    
    for i = 1:7
        pause(1)
        sim.simxSetJointTargetPosition(clientID, j(i), pos2(i), sim.simx_opmode_oneshot_wait);   
    end
    
    for i = 7:1
        pause(1)
        sim.simxSetJointTargetPosition(clientID, j(i), pos3(i), sim.simx_opmode_oneshot_wait);   
    end
    
    for i = 7:1
        pause(1)
        sim.simxSetJointTargetPosition(clientID, j(i), pos4(i), sim.simx_opmode_oneshot_wait);   
    end
    disp('Finish')
    sim.simxGetPingTime(clientID);
    sim.simxFinish(clientID);
else
    disp('failure')
end

sim.delete();