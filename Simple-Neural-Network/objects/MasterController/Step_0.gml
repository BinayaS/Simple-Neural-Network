Timer = max(0, Timer-1);

//Next Generation
if(Timer == 0) {
	Alive = ToSpawnNumber;
	Timer = TimeTillRestart;
	TotalFitness = 0;
	
	//sort player's array
	for(var i = 0; i < ToSpawnNumber-1; i++) {
		var minIndex = i;
		for(var j = i+1; j < ToSpawnNumber; j++) {
			if(AgentsList1[j].fitness > AgentsList1[minIndex].fitness) {
				minIndex = j;	
			}
		}
		var temp = AgentsList1[minIndex];
		AgentsList1[minIndex] = AgentsList1[i];
		AgentsList1[i] = temp;
	}
	
	runString = "Run: " + string(currentRun);
	currentRun += 1;
	
	#region Print to files

		//global.weightsCheckFile = file_text_open_append(working_directory + "WeightsCheck.txt");
		//file_text_write_string(global.weightsCheckFile, runString);
		//file_text_writeln(global.weightsCheckFile);

		//var _HID1LAY = AgentsList1[0].network.Hidden1Layer;
		//var _string = ds_list_find_value(_HID1LAY, 0);

		//file_text_write_string(global.weightsCheckFile, _string);
		//file_text_writeln(global.weightsCheckFile);
		
		//file_text_close(global.weightsCheckFile);


		//Check generation's top fitness
		if(AgentsList1[0].fitness > MaxFitness) {
			updateFiles = true;
		} else {
			updateFiles = false;
		}

		//Update Fitness File [run number]
		global.fitnessFile = file_text_open_append(working_directory + "Fitness.txt");
		file_text_write_string(global.fitnessFile, runString);
		file_text_writeln(global.fitnessFile);

		if(updateFiles) {
			global.weightsFile = file_text_open_append(working_directory + "Weights.txt");
			global.biasFile = file_text_open_append(working_directory + "Bias.txt");	
			file_text_write_string(global.weightsFile, runString);
			file_text_writeln(global.weightsFile);
			file_text_write_string(global.biasFile, runString);
			file_text_writeln(global.biasFile);
		}

		for(var i = 0; i < ToSpawnNumber; i++) {
			//Update Fitness File [fitness number]
			file_text_write_string(global.fitnessFile, "Agent: " + string(i) + " : " + string(AgentsList1[i].fitness));
			file_text_writeln(global.fitnessFile);
		}

		if(updateFiles) {
			
			for(var i = 0; i < 1; i++) {
					
				var _agent = AgentsList1[i];
			
				//InputLayer
				file_text_write_string(global.weightsFile, "---InputLayer---");
				file_text_writeln(global.weightsFile);
				file_text_write_string(global.biasFile, "---InputLayer---");
				file_text_writeln(global.biasFile);
			
				for(var j = 0; j < global.InputSize; j++) {
					var _inputLayer = ds_list_find_value(_agent.network.InputLayer, j);
				
					var _weightsString = "";
					for(var k = 0; k < ds_list_size(_inputLayer.Weights); k++) {
						_weightsString += string(ds_list_find_value(_inputLayer.Weights, k)) + ", ";
					}
				
					file_text_write_string(global.weightsFile, "Agent: " + string(i) + " : " + _weightsString);
					file_text_writeln(global.weightsFile);
		
					file_text_write_string(global.biasFile, "Agent: " + string(i) + " : " + string(_inputLayer.Bias));
					file_text_writeln(global.biasFile);
				}
	
				//Hidden 1 layer
				file_text_write_string(global.weightsFile, "---Hidden1Layer---");
				file_text_writeln(global.weightsFile);
				file_text_write_string(global.biasFile, "---Hidden1Layer---");
				file_text_writeln(global.biasFile);
				for(var j = 0; j < global.Hidden1Size; j++) {
					var _hidden1Layer = ds_list_find_value(_agent.network.Hidden1Layer, j);
				
					var _weightsString = "";
					for(var k = 0; k < ds_list_size(_hidden1Layer.Weights); k++) {
						_weightsString += string(ds_list_find_value(_hidden1Layer.Weights, k)) + ", ";
					}
				
					file_text_write_string(global.weightsFile, "Agent: " + string(i) + " : " + _weightsString);
					file_text_writeln(global.weightsFile);
		
					file_text_write_string(global.biasFile, "Agent: " + string(i) + " : " + string(_hidden1Layer.Bias));
					file_text_writeln(global.biasFile);
				}
	
				//Hidden 2 layer
				file_text_write_string(global.weightsFile, "---Hidden2Layer---");
				file_text_writeln(global.weightsFile);
				file_text_write_string(global.biasFile, "---Hidden2Layer---");
				file_text_writeln(global.biasFile);
				for(var j = 0; j < global.Hidden2Size; j++) {
					var _hidden2Layer = ds_list_find_value(_agent.network.Hidden2Layer, j);
				
					var _weightsString = "";
					for(var k = 0; k < ds_list_size(_hidden2Layer.Weights); k++) {
						_weightsString += string(ds_list_find_value(_hidden2Layer.Weights, k)) + ", ";
					}
				
					file_text_write_string(global.weightsFile, "Agent: " + string(i) + " : " + _weightsString);
					file_text_writeln(global.weightsFile);
		
					file_text_write_string(global.biasFile, "Agent: " + string(i) + " : " + string(_hidden2Layer.Bias));
					file_text_writeln(global.biasFile);
				}
			
				//Hidden 3 ayer
				file_text_write_string(global.weightsFile, "---Hidden3Layer---");
				file_text_writeln(global.weightsFile);
				file_text_write_string(global.biasFile, "---Hidden3Layer---");
				file_text_writeln(global.biasFile);
				for(var j = 0; j < global.Hidden3Size; j++) {
					var _hidden3Layer = ds_list_find_value(_agent.network.Hidden3Layer, j);
				
					var _weightsString = "";
					for(var k = 0; k < ds_list_size(_hidden3Layer.Weights); k++) {
						_weightsString += string(ds_list_find_value(_hidden3Layer.Weights, k)) + ", ";
					}
				
					file_text_write_string(global.weightsFile, "Agent: " + string(i) + " : " + _weightsString);
					file_text_writeln(global.weightsFile);
		
					file_text_write_string(global.biasFile, "Agent: " + string(i) + " : " + string(_hidden3Layer.Bias));
					file_text_writeln(global.biasFile);
				}
	
				//Output layer
				file_text_write_string(global.weightsFile, "---OutputLayer---");
				file_text_writeln(global.weightsFile);
				file_text_write_string(global.biasFile, "---OutputLayer---");
				file_text_writeln(global.biasFile);
				for(var j = 0; j < global.OutputSize; j++) {
					var _outputLayer = ds_list_find_value(_agent.network.OutputLayer, j);
				
					var _weightsString = "";
					for(var k = 0; k < ds_list_size(_outputLayer.Weights); k++) {
						_weightsString += string(ds_list_find_value(_outputLayer.Weights, k)) + ", ";
					}
				
					file_text_write_string(global.weightsFile, "Agent: " + string(i) + " : " + _weightsString);
					file_text_writeln(global.weightsFile);
		
					file_text_write_string(global.biasFile, "Agent: " + string(i) + " : " + string(_outputLayer.Bias));
					file_text_writeln(global.biasFile);
				}
			}
		}

		file_text_close(global.fitnessFile);
		file_text_close(global.weightsFile);
		file_text_close(global.biasFile);

		#endregion
	
	#region Replicate to only have the top 50	
	
	////Delete the last 50
	//for(var i = 50; i < ToSpawnNumber; i++) {
	//	var _agent = AgentsList1[i];
	//	instance_destroy(_agent);
	//}
	////Copy the top 50 to the last 50
	//for(var i = 50; i < ToSpawnNumber; i++) {
	//	var _agent = AgentsList1[i-50];
	//	AgentsList1[i] = _agent;
	//}
	
	#endregion
	
	#region Evolution Function
	
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
	
	#region Add in last generation's top agent
	
	//New agent
	var _newAgent = instance_create_depth(x, y, 0, Agent);
	_newAgent.update = true;
	
	//Last generation's top agent
	var _lastGenAgent = AgentsList1[0];
	
	//Hidden1 layer
	for(var k = 0; k < global.Hidden1Size; k++) {
		var _lastGenNeuron = ds_list_find_value(_lastGenAgent.network.Hidden1Layer, k);
		var _newAgentNeuron = ds_list_find_value(_newAgent.network.Hidden1Layer, k);
		ds_list_copy(_newAgentNeuron.Weights, _lastGenNeuron.Weights);
		_newAgentNeuron.Bias = _lastGenNeuron.Bias;
	}
		
	//Hidden2 layer
	for(var k = 0; k < global.Hidden2Size; k++) {
		var _lastGenNeuron = ds_list_find_value(_lastGenAgent.network.Hidden2Layer, k);
		var _newAgentNeuron = ds_list_find_value(_newAgent.network.Hidden2Layer, k);
		ds_list_copy(_newAgentNeuron.Weights, _lastGenNeuron.Weights);
		_newAgentNeuron.Bias = _lastGenNeuron.Bias;
	}
		
	//Hidden3 layer
	for(var k = 0; k < global.Hidden3Size; k++) {
		var _lastGenNeuron = ds_list_find_value(_lastGenAgent.network.Hidden3Layer, k);
		var _newAgentNeuron = ds_list_find_value(_newAgent.network.Hidden3Layer, k);
		ds_list_copy(_newAgentNeuron.Weights, _lastGenNeuron.Weights);
		_newAgentNeuron.Bias = _lastGenNeuron.Bias;
	}
		
	//Output layer
	for(var k = 0; k < global.OutputSize; k++) {
		var _lastGenNeuron = ds_list_find_value(_lastGenAgent.network.OutputLayer, k);
		var _newAgentNeuron = ds_list_find_value(_newAgent.network.OutputLayer, k);
		ds_list_copy(_newAgentNeuron.Weights, _lastGenNeuron.Weights);
		_newAgentNeuron.Bias = _lastGenNeuron.Bias;
	}
	
	_newAgent.topAgent = true;
	Camera.follow = _newAgent;
	AgentsList2[0] = _newAgent;
	
	#endregion

	//Remove old generation
	for(var i = 0; i < ToSpawnNumber; i++) {
		var _agent = AgentsList1[i];
		instance_destroy(_agent);
		AgentsList1[i] = 0;
	}
	
	array_copy(AgentsList1, 0, AgentsList2, 0, ToSpawnNumber);

	#endregion
}