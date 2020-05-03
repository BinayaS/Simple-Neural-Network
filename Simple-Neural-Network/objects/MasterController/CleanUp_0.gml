var i = 0; 
repeat(ToSpawnNumber) {
	var _agent = AgentsList1[i];
	instance_destroy(_agent);
}

//var i = 0; 
//repeat(ToSpawnNumber) {
//	var _agent = AgentsList2[i];
//	instance_destroy(_agent);
//}

AgentsList1 = 0;
AgentsList2 = 0;