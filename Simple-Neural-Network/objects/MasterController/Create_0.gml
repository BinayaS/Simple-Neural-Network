//Get random seed
randomize();

ToSpawnNumber = 100;
Alive = ToSpawnNumber;

AgentsList1 = ds_list_create();
AgentsList2 = ds_list_create();

Globals();

repeat(ToSpawnNumber) {
	var _newAgent = instance_create_depth(x, y, 0, Agent);
	_newAgent.update = true;
	ds_list_add(AgentsList1, _newAgent);
}

TimeTillRestart = room_speed * 5;
Timer = TimeTillRestart;

MaxFitness = 0;
updateFiles = false;

currentRun = 1;