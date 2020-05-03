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
			show_debug_message("Agent0: " + string(i));
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
			show_debug_message("Agent1: " + string(i));
			break;
		}
	}
		
	//Create a new agent and 
	var _newAgent = instance_create_depth(x, y, 0, Agent);
	_newAgent.update = true;
		
	#region Randomly choose between the two parents to get the weights and bias
		
	//Hidden1 layer
	for(var k = 0; k < global.Hidden1Size; k++) {
		for(var j = 0; j < global.InputSize; j++) {
			//show_message(string(k) + " " + string(ds_list_find_value(_newAgent.network.Hidden1Layer, k)));
			var _newAgentNeuron = ds_list_find_value(_newAgent.network.Hidden1Layer, k);
			
			var _topAgent0Neuron = ds_list_find_value(topAgent0.network.Hidden1Layer, k);
			var _topAgent0Weights = ds_list_find_value(_topAgent0Neuron.Weights, j);
			
			var _topAgent1Neuron = ds_list_find_value(topAgent1.network.Hidden1Layer, k);
			var _topAgent1Weights = ds_list_find_value(_topAgent1Neuron.Weights, j);
			
			var _rand = random_range(0, 100);
			
			if(_rand > 50) {
				ds_list_replace(_newAgentNeuron.Weights, j, _topAgent0Weights);
				var _mutate = random_range(0, 1);
				if(_mutate < 0.1) {
					ds_list_replace(_newAgentNeuron.Weights, j, random_range(-4, 4));
				}
				//_newAgentNeuron.Bias = _topAgent0Neuron.Bias;
			} else {
				ds_list_replace(_newAgentNeuron.Weights, j, _topAgent1Weights);
				var _mutate = random_range(0, 1);
				if(_mutate < 0.1) {
					ds_list_replace(_newAgentNeuron.Weights, j, random_range(-4, 4));
				}
				//_newAgentNeuron.Bias = _topAgent1Neuron.Bias;
			}
			_newAgentNeuron.Bias = (_topAgent0Neuron.Bias + _topAgent1Neuron.Bias)/2;
		}
	}
		
	//Hidden2 layer
	for(var k = 0; k < global.Hidden2Size; k++) {
		for(var j = 0; j < global.Hidden1Size; j++) {
			var _newAgentNeuron = ds_list_find_value(_newAgent.network.Hidden2Layer, k);
			
			var _topAgent0Neuron = ds_list_find_value(topAgent0.network.Hidden2Layer, k);
			var _topAgent0Weights = ds_list_find_value(_topAgent0Neuron.Weights, j);
			
			var _topAgent1Neuron = ds_list_find_value(topAgent1.network.Hidden2Layer, k);
			var _topAgent1Weights = ds_list_find_value(_topAgent1Neuron.Weights, j);
			
			var _rand = random_range(0, 100);
			
			if(_rand > 50) {
				ds_list_replace(_newAgentNeuron.Weights, j, _topAgent0Weights);
				var _mutate = random_range(0, 1);
				if(_mutate < 0.1) {
					ds_list_replace(_newAgentNeuron.Weights, j, random_range(-4, 4));
				}
				//_newAgentNeuron.Bias = _topAgent0Neuron.Bias;
			} else {
				ds_list_replace(_newAgentNeuron.Weights, j, _topAgent1Weights);
				var _mutate = random_range(0, 1);
				if(_mutate < 0.1) {
					ds_list_replace(_newAgentNeuron.Weights, j, random_range(-4, 4));
				}
				//_newAgentNeuron.Bias = _topAgent1Neuron.Bias;
			}
			_newAgentNeuron.Bias = (_topAgent0Neuron.Bias + _topAgent1Neuron.Bias)/2;
		}
	}
		
	//Hidden3 layer
	for(var k = 0; k < global.Hidden3Size; k++) {
		for(var j = 0; j < global.Hidden2Size; j++) {
			var _newAgentNeuron = ds_list_find_value(_newAgent.network.Hidden3Layer, k);
			
			var _topAgent0Neuron = ds_list_find_value(topAgent0.network.Hidden3Layer, k);
			var _topAgent0Weights = ds_list_find_value(_topAgent0Neuron.Weights, j);
			
			var _topAgent1Neuron = ds_list_find_value(topAgent1.network.Hidden3Layer, k);
			var _topAgent1Weights = ds_list_find_value(_topAgent1Neuron.Weights, j);
			
			var _rand = random_range(0, 100);
			
			if(_rand > 50) {
				ds_list_replace(_newAgentNeuron.Weights, j, _topAgent0Weights);
				var _mutate = random_range(0, 1);
				if(_mutate < 0.1) {
					ds_list_replace(_newAgentNeuron.Weights, j, random_range(-4, 4));
				}
				//_newAgentNeuron.Bias = _topAgent0Neuron.Bias;
			} else {
				ds_list_replace(_newAgentNeuron.Weights, j, _topAgent1Weights);
				var _mutate = random_range(0, 1);
				if(_mutate < 0.1) {
					ds_list_replace(_newAgentNeuron.Weights, j, random_range(-4, 4));
				}
				//_newAgentNeuron.Bias = _topAgent1Neuron.Bias;
			}
			_newAgentNeuron.Bias = (_topAgent0Neuron.Bias + _topAgent1Neuron.Bias)/2;
		}
	}
		
	//Output layer
	for(var k = 0; k < global.OutputSize; k++) {
		for(var j = 0; j < global.Hidden3Size; j++) {
			var _newAgentNeuron = ds_list_find_value(_newAgent.network.OutputLayer, k);
			
			var _topAgent0Neuron = ds_list_find_value(topAgent0.network.OutputLayer, k);
			var _topAgent0Weights = ds_list_find_value(_topAgent0Neuron.Weights, j);
			
			var _topAgent1Neuron = ds_list_find_value(topAgent1.network.OutputLayer, k);
			var _topAgent1Weights = ds_list_find_value(_topAgent1Neuron.Weights, j);
			
			var _rand = random_range(0, 100);
			
			if(_rand > 50) {
				ds_list_replace(_newAgentNeuron.Weights, j, _topAgent0Weights);
				var _mutate = random_range(0, 1);
				if(_mutate < 0.1) {
					ds_list_replace(_newAgentNeuron.Weights, j, random_range(-4, 4));
				}
				//_newAgentNeuron.Bias = _topAgent0Neuron.Bias;
			} else {
				ds_list_replace(_newAgentNeuron.Weights, j, _topAgent1Weights);
				var _mutate = random_range(0, 1);
				if(_mutate < 0.1) {
					ds_list_replace(_newAgentNeuron.Weights, j, random_range(-4, 4));
				}
				//_newAgentNeuron.Bias = _topAgent1Neuron.Bias;
			}
			_newAgentNeuron.Bias = (_topAgent0Neuron.Bias + _topAgent1Neuron.Bias)/2;
		}
	} 
		
	#endregion
		
	//Add them to new generation list
	AgentsList2[z] = _newAgent;
	z++;
}