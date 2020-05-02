//Get random seed
randomize();

ToSpawnNumber = 100;
AgentsList1 = ds_list_create();
AgentsList2 = ds_list_create();

repeat(ToSpawnNumber) {
	var _newAgent = instance_create_depth(x, y, 0, Agent);
	_newAgent.update = true;
	ds_list_add(AgentsList1, _newAgent);
}