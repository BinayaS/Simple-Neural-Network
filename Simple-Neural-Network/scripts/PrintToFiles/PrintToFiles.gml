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
	
	global.hitGoalFile = file_text_open_append(working_directory + "HitGoal.txt");
	file_text_write_string(global.hitGoalFile, runString);
	file_text_writeln(global.hitGoalFile);
	file_text_write_string(global.hitGoalFile, string(hitGoal));
	file_text_writeln(global.hitGoalFile);
	file_text_close(global.hitGoalFile);
	
	global.hitWallFile = file_text_open_append(working_directory + "HitWall.txt");
	file_text_write_string(global.hitWallFile, runString);
	file_text_writeln(global.hitWallFile);
	file_text_write_string(global.hitWallFile, string(deadByWall));
	file_text_writeln(global.hitWallFile);
	file_text_close(global.hitWallFile);
	
	global.aliveFile = file_text_open_append(working_directory + "Alive.txt");
	file_text_write_string(global.aliveFile, runString);
	file_text_writeln(global.aliveFile);
	file_text_write_string(global.aliveFile, string(Alive));
	file_text_writeln(global.aliveFile);
	file_text_close(global.aliveFile);

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
				var _inputLayer = _agent.network.InputLayer[j];
				
				var _weightsString = "";
				for(var k = 0; k < array_length_1d(_inputLayer.Weights); k++) {
					_weightsString += string(_inputLayer.Weights[k]) + ", ";
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
				var _hidden1Layer = _agent.network.Hidden1Layer[j];
				
				var _weightsString = "";
				for(var k = 0; k < array_length_1d(_hidden1Layer.Weights); k++) {
					_weightsString += string(_hidden1Layer.Weights[k]) + ", ";
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
				var _hidden2Layer = _agent.network.Hidden2Layer[j];
				
				var _weightsString = "";
				for(var k = 0; k < array_length_1d(_hidden2Layer.Weights); k++) {
					_weightsString += string(_hidden2Layer.Weights[k]) + ", ";
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
				var _hidden3Layer = _agent.network.Hidden3Layer[j];
				
				var _weightsString = "";
				for(var k = 0; k < array_length_1d(_hidden3Layer.Weights); k++) {
					_weightsString += string(_hidden3Layer.Weights[k]) + ", ";
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
				var _outputLayer = _agent.network.OutputLayer[j];
				
				var _weightsString = "";
				for(var k = 0; k < array_length_1d(_outputLayer.Weights); k++) {
					_weightsString += string(_outputLayer.Weights[k]) + ", ";
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