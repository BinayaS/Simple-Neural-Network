if(!ds_list_empty(AgentsList1)) {
	var i = 0; 
	repeat(ToSpawnNumber) {
		var _agent = ds_list_find_value(AgentsList1, i);
		instance_destroy(_agent);
	}
}

if(!ds_list_empty(AgentsList2)) {
	var i = 0; 
	repeat(ToSpawnNumber) {
		var _agent = ds_list_find_value(AgentsList2, i);
		instance_destroy(_agent);
	}
}

ds_list_clear(AgentsList1);
ds_list_destroy(AgentsList1);
AgentsList1 = 0;

ds_list_clear(AgentsList2);
ds_list_destroy(AgentsList2);
AgentsList2 = 0;