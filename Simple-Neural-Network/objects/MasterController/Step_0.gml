Timer = max(0, Timer-1);

//Next Generation
if(Timer == 0) {
	Alive = ToSpawnNumber;
	Timer = TimeTillRestart;
	
	//sort AgetsList1
	for(var i = 0; i < ToSpawnNumber-1; i++) {
		var minIndex = i;
		for(var j = i+1; j < ToSpawnNumber; j++) {
			var _agentj = ds_list_find_value(AgentsList1, j);
			var _agentmin = ds_list_find_value(AgentsList1, minIndex);
			if(_agentj.fitness > _agentmin.fitness) {
				minIndex = j;
			}
		}
		var _agenti = ds_list_find_value(AgentsList1, i);
		var _agentmin = ds_list_find_value(AgentsList1, minIndex);
		var temp = _agentmin;
		
		ds_list_replace(AgentsList1, minIndex, _agenti);
		ds_list_replace(AgentsList1, i, temp);
	}
	
	runString = "Run: " + string(currentRun);
	currentRun += 1;
	
	#region Print to files

		//Check generation's top fitness
		var _agent = ds_list_find_value(AgentsList1, 0);
		if(_agent.fitness > MaxFitness) {
			updateFiles = true;
		} else {
			updateFiles = false;
		}

		//Update Fitness File [run number]
		global.fitnessFile = file_text_open_append(working_directory + "Fitness.txt");
		file_text_write_string(global.fitnessFile, runString);
		file_text_writeln(global.fitnessFile);

		if(updateFiles) {
			global.weightsFile = file_text_open_write(working_directory + "Weights.txt");
			global.biasFile = file_text_open_write(working_directory + "Bias.txt");	
			file_text_write_string(global.weightsFile, runString);
			file_text_writeln(global.weightsFile);
			file_text_write_string(global.biasFile, runString);
			file_text_writeln(global.biasFile);
		}

		for(var i = 0; i < ToSpawnNumber; i++) {
			//Update Fitness File [fitness number]
			var _agent = ds_list_find_value(AgentsList1, i);
			file_text_write_string(global.fitnessFile, "Agent: " + string(i) + " - " + string(_agent.fitness));
			file_text_writeln(global.fitnessFile);
		}

		if(updateFiles) {
			var _agent = ds_list_find_value(AgentsList1, 0);
			
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
				
				file_text_write_string(global.weightsFile, "Agent: " + string(0) + " - " + _weightsString);
				file_text_writeln(global.weightsFile);
		
				file_text_write_string(global.biasFile, "Agent: " + string(0) + " - " + string(_inputLayer.Bias));
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
				
				file_text_write_string(global.weightsFile, "Agent: " + string(0) + " - " + _weightsString);
				file_text_writeln(global.weightsFile);
		
				file_text_write_string(global.biasFile, "Agent: " + string(0) + " - " + string(_hidden1Layer.Bias));
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
				
				file_text_write_string(global.weightsFile, "Agent: " + string(0) + " - " + _weightsString);
				file_text_writeln(global.weightsFile);
		
				file_text_write_string(global.biasFile, "Agent: " + string(0) + " - " + string(_hidden2Layer.Bias));
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
				
				file_text_write_string(global.weightsFile, "Agent: " + string(0) + " - " + _weightsString);
				file_text_writeln(global.weightsFile);
		
				file_text_write_string(global.biasFile, "Agent: " + string(0) + " - " + string(_hidden3Layer.Bias));
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
				
				file_text_write_string(global.weightsFile, "Agent: " + string(0) + " - " + _weightsString);
				file_text_writeln(global.weightsFile);
		
				file_text_write_string(global.biasFile, "Agent: " + string(0) + " - " + string(_outputLayer.Bias));
				file_text_writeln(global.biasFile);
			}
		}

		file_text_close(global.fitnessFile);
		file_text_close(global.weightsFile);
		file_text_close(global.biasFile);

		#endregion
	
	var i = 0;
	repeat(ToSpawnNumber) {
		var _agent = ds_list_find_value(AgentsList1, i);
		_agent.reset = true;
		i++;
	}
	
	//repeat(ToSpawnNumber) {
	//	var _newAgent = instance_create_depth(x, y, 0, Agent);
	//	_newAgent.update = true;
	//	ds_list_add(AgentsList2, _newAgent);
	//}
}