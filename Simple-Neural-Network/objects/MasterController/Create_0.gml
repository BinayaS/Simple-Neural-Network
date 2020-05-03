//Get random seed
randomize();

move = true;
showLines = false;
showText = false;

startX = x;
startY = y;

ToSpawnNumber = 100;
Alive = ToSpawnNumber;

AgentsList1 = [];
AgentsList2 = [];

Globals();

for(var i = 0; i < ToSpawnNumber; i++) {
	var _newAgent = instance_create_depth(x, y, 0, Agent);
	_newAgent.update = true;
	_newAgent.showLines = showLines;
	_newAgent.showText = showText;
	AgentsList1[i] = _newAgent;
}

TimeTillRestart = room_speed * 6;
Timer = TimeTillRestart;

MaxFitness = 0;
TotalFitness = 0;
updateFiles = false;

currentRun = 1;
hitGoal = 0;
deadByWall = 0;