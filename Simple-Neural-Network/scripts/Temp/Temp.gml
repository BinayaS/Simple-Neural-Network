#region Evolution Function
	
//Replace bottom 50 with top 50
for(var i = 50; i < ToSpawnNumber; i++) {
	instance_destroy(AgentsList1[i]);
	AgentsList1[i] = AgentsList1[i-50];
}
	
//Find the sum of fitness
for(var i = 0; i < ToSpawnNumber; i++) {
	var _agent = AgentsList1[i];
	TotalFitness += _agent.fitness;
}
	
//Get 99 new agents that are crossbred from old generation
var z = 1;
repeat(ToSpawnNumber-1) {
	//Get parent 1
	//var topAgent0 = AgentsList1[0];
	var rand = random_range(0, TotalFitness);
	var runningSum = 0;
	var topAgent0 = noone;
	for(i = 0; i < ToSpawnNumber; i++) {
		var _agent = AgentsList1[i];
		runningSum += _agent.fitness;
		if(runningSum > rand) {
			topAgent0 = _agent;
			//show_debug_message("Agent0: " + string(i));
			break;
		}
	}
	
	//Get parent 2
	//var topAgent1 = AgentsList1[z];
	var rand = random_range(0, TotalFitness);
	var runningSum = 0;
	var topAgent1 = noone;
	for(i = 0; i < ToSpawnNumber; i++) {
		var _agent = AgentsList1[i];
		runningSum += _agent.fitness;
		if(runningSum > rand) {
			topAgent1 = _agent;
			//show_debug_message("Agent1: " + string(i));
			break;
		}
	}
		
	//Create a new agent and 
	var _newAgent = instance_create_depth(x, y, 0, Agent);
	_newAgent.update = true;
	
	CopyToNetwork(topAgent0.network, _newAgent.network);
	CrossBreedNetworks(topAgent1.network, _newAgent.network);
	RandomMutations(_newAgent.network);
		
	//Add them to new generation list
	AgentsList2[z] = _newAgent;
	z++;
}
	
#region Add in last generation's top agent
	
//New agent
var _newAgent = instance_create_depth(x, y, 0, Agent);
_newAgent.update = true;
	
//Last generation's top agent
var _lastGenAgent = AgentsList1[0];
//show_message(AgentsList1[0].fitness);

CopyToNetwork(_lastGenAgent.network, _newAgent.network);

////Hidden1 layer
//for(var k = 0; k < global.Hidden1Size; k++) {
//	var _lastGenNeuron = _lastGenAgent.network.Hidden1Layer[k];
//	var _newAgentNeuron = _newAgent.network.Hidden1Layer[k];
//	array_copy(_newAgentNeuron.Weights, 0, _lastGenNeuron.Weights, 0, array_length_1d(_lastGenNeuron.Weights));
//	_newAgentNeuron.Bias = _lastGenNeuron.Bias;
//}
		
////Hidden2 layer
//for(var k = 0; k < global.Hidden2Size; k++) {
//	var _lastGenNeuron = _lastGenAgent.network.Hidden2Layer[k];
//	var _newAgentNeuron = _newAgent.network.Hidden2Layer[k];
//	array_copy(_newAgentNeuron.Weights, 0, _lastGenNeuron.Weights, 0, array_length_1d(_lastGenNeuron.Weights));
//	_newAgentNeuron.Bias = _lastGenNeuron.Bias;
//}
		
////Hidden3 layer
//for(var k = 0; k < global.Hidden3Size; k++) {
//	var _lastGenNeuron = _lastGenAgent.network.Hidden3Layer[k];
//	var _newAgentNeuron = _newAgent.network.Hidden3Layer[k];
//	array_copy(_newAgentNeuron.Weights, 0, _lastGenNeuron.Weights, 0, array_length_1d(_lastGenNeuron.Weights));
//	_newAgentNeuron.Bias = _lastGenNeuron.Bias;
//}
		
////Output layer
//for(var k = 0; k < global.OutputSize; k++) {
//	var _lastGenNeuron = _lastGenAgent.network.OutputLayer[k];
//	var _newAgentNeuron = _newAgent.network.OutputLayer[k];
//	array_copy(_newAgentNeuron.Weights, 0, _lastGenNeuron.Weights, 0, array_length_1d(_lastGenNeuron.Weights));
//	_newAgentNeuron.Bias = _lastGenNeuron.Bias;
//}
	
_newAgent.topAgent = true;
//Camera.follow = _newAgent;
AgentsList2[0] = _newAgent;
	
#endregion

//Replace bottom 10 with random new agents
//for(var i = 90; i < ToSpawnNumber; i++) {
//	instance_destroy(AgentsList1[i]);
//	var _newAgent2 = instance_create_depth(x, y, 0, Agent);
//	_newAgent2.update = true;
//	AgentsList1[i] = _newAgent2;
//}

//Remove old generation
for(var i = 0; i < ToSpawnNumber; i++) {
	var _agent = AgentsList1[i];
	instance_destroy(_agent);
	AgentsList1[i] = 0;
}
	
array_copy(AgentsList1, 0, AgentsList2, 0, ToSpawnNumber);

#endregion