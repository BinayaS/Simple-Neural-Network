#region Evolution Function
	
//Replace the rest with the top 25%
var i = 0;
repeat(25) {
	instance_destroy(AgentsList1[i+25]);
	instance_destroy(AgentsList1[i+50]);
	instance_destroy(AgentsList1[i+75]);
	AgentsList1[i+25] = AgentsList1[i];
	AgentsList1[i+50] = AgentsList1[i];
	AgentsList1[i+75] = AgentsList1[i];
	i++;	
}

//sort player's array
//for(var i = 0; i < ToSpawnNumber-1; i++) {
//	var minIndex = i;
//	for(var j = i+1; j < ToSpawnNumber; j++) {
//		if(AgentsList1[j].fitness > AgentsList1[minIndex].fitness) {
//			minIndex = j;	
//		}
//	}
//	var temp = AgentsList1[minIndex];
//	AgentsList1[minIndex] = AgentsList1[i];
//	AgentsList1[i] = temp;
//}

//Find the sum of fitness
for(var i = 0; i < ToSpawnNumber; i++) {
	var _agent = AgentsList1[i];
	TotalFitness += _agent.fitness;
}

//Get 99 new agents that are crossbred from old generation
var z = 1;
repeat(ToSpawnNumber-1) {
	
	//if(!haveHit) {
	//	var _rand = irandom_range(0, 10);
	//	var topAgent0 = AgentsList1[_rand];
	//} else {
	//	var topAgent0 = AgentsList1[0];
	//}
	
	var topAgent0 = AgentsList1[0];
		
	//Create a new agent and 
	var _newAgent = instance_create_depth(x, y, 0, Agent);
	_newAgent.update = true;
	_newAgent.showLines = showLines;
	_newAgent.showText = showText;
	
	CopyToNetwork(topAgent0.network, _newAgent.network);
	if(hitGoal == 0) {
		RandomMutationsExtreme(_newAgent.network);
		//show_debug_message("EXT");
	} else {
		RandomMutations(_newAgent.network);
		//show_debug_message("NORM");
	}
		
	//Add them to new generation list
	AgentsList2[z] = _newAgent;
	z++;
}
	
#region Add in last generation's top agent
	
//New agent
var _newAgent = instance_create_depth(x, y, 0, Agent);
_newAgent.update = true;
_newAgent.showLines = showLines;
_newAgent.showText = showText;
	
//Last generation's top agent
var _lastGenAgent = AgentsList1[0];
//show_message(AgentsList1[0].fitness);

CopyToNetwork(_lastGenAgent.network, _newAgent.network);
_newAgent.topAgent = true;
AgentsList2[0] = _newAgent;

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

	
#endregion

//Replace bottom 10 with random new agents
//for(var i = 90; i < ToSpawnNumber; i++) {
//	instance_destroy(AgentsList1[i]);
//	var _newAgent2 = instance_create_depth(x, y, 0, Agent);
//	_newAgent2.update = true;
//	AgentsList1[i] = _newAgent2;
//}
if(hitGoal == 0) {
	for(var i = 75; i < ToSpawnNumber; i++) {
		var _newAgent = instance_create_depth(x, y, 0, Agent);
		_newAgent.update = true;
		_newAgent.showLines = showLines;
		_newAgent.showText = showText;
		instance_destroy(AgentsList2[i]);
		AgentsList2[i] = _newAgent;
	}
}

//Remove old generation
for(var i = 0; i < ToSpawnNumber; i++) {
	var _agent = AgentsList1[i];
	instance_destroy(_agent);
	AgentsList1[i] = 0;
}
	
array_copy(AgentsList1, 0, AgentsList2, 0, ToSpawnNumber);

#endregion