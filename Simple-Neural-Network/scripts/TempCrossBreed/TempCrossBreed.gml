#region Randomly choose between the two parents to get the weights and bias
		
//Hidden1 layer
for(var k = 0; k < global.Hidden1Size; k++) {
	for(var j = 0; j < global.InputSize; j++) {
		//show_message(string(k) + " " + string(ds_list_find_value(_newAgent.network.Hidden1Layer, k)));
		var _newAgentNeuron = _newAgent.network.Hidden1Layer[k];
			
		var _topAgent0Neuron = topAgent0.network.Hidden1Layer[k];
		var _topAgent0Weights = _topAgent0Neuron.Weights[j];
			
		var _topAgent1Neuron = topAgent1.network.Hidden1Layer[k];
		var _topAgent1Weights = _topAgent1Neuron.Weights[j];
			
		var _rand = random_range(0, 100);
			
		if(_rand > 50) {
			_newAgentNeuron.Weights[j] = _topAgent0Weights;
			var _mutate = random_range(0, 1);
			if(_mutate < 0.1) {
				_newAgentNeuron.Weights[j] = random_range(-4, 4);
			}
			//_newAgentNeuron.Bias = _topAgent0Neuron.Bias;
		} else {
			_newAgentNeuron.Weights[j] = _topAgent1Weights;
			var _mutate = random_range(0, 1);
			if(_mutate < 0.1) {
				_newAgentNeuron.Weights[j] = random_range(-4, 4);
			}
			//_newAgentNeuron.Bias = _topAgent1Neuron.Bias;
		}
		_newAgentNeuron.Bias = (_topAgent0Neuron.Bias + _topAgent1Neuron.Bias)/2;
	}
}
		
//Hidden2 layer
for(var k = 0; k < global.Hidden2Size; k++) {
	for(var j = 0; j < global.Hidden1Size; j++) {
		var _newAgentNeuron = _newAgent.network.Hidden2Layer[k];
			
		var _topAgent0Neuron = topAgent0.network.Hidden2Layer[k];
		var _topAgent0Weights = _topAgent0Neuron.Weights[j];
			
		var _topAgent1Neuron = topAgent1.network.Hidden2Layer[k];
		var _topAgent1Weights = _topAgent1Neuron.Weights[j];
			
		var _rand = random_range(0, 100);
			
		if(_rand > 50) {
			_newAgentNeuron.Weights[j] = _topAgent0Weights;
			var _mutate = random_range(0, 1);
			if(_mutate < 0.1) {
				_newAgentNeuron.Weights[j] = random_range(-4, 4);
			}
			//_newAgentNeuron.Bias = _topAgent0Neuron.Bias;
		} else {
			_newAgentNeuron.Weights[j] = _topAgent1Weights;
			var _mutate = random_range(0, 1);
			if(_mutate < 0.1) {
				_newAgentNeuron.Weights[j] = random_range(-4, 4);
			}
			//_newAgentNeuron.Bias = _topAgent1Neuron.Bias;
		}
		_newAgentNeuron.Bias = (_topAgent0Neuron.Bias + _topAgent1Neuron.Bias)/2;
	}
}
		
//Hidden3 layer
for(var k = 0; k < global.Hidden3Size; k++) {
	for(var j = 0; j < global.Hidden2Size; j++) {
		var _newAgentNeuron = _newAgent.network.Hidden3Layer[k];
			
		var _topAgent0Neuron = topAgent0.network.Hidden3Layer[k];
		var _topAgent0Weights = _topAgent0Neuron.Weights[j];
			
		var _topAgent1Neuron = topAgent1.network.Hidden3Layer[k];
		var _topAgent1Weights = _topAgent1Neuron.Weights[j];
			
		var _rand = random_range(0, 100);
			
		if(_rand > 50) {
			_newAgentNeuron.Weights[j] = _topAgent0Weights;
			var _mutate = random_range(0, 1);
			if(_mutate < 0.1) {
				_newAgentNeuron.Weights[j] = random_range(-4, 4);
			}
			//_newAgentNeuron.Bias = _topAgent0Neuron.Bias;
		} else {
			_newAgentNeuron.Weights[j] = _topAgent1Weights;
			var _mutate = random_range(0, 1);
			if(_mutate < 0.1) {
				_newAgentNeuron.Weights[j] = random_range(-4, 4);
			}
			//_newAgentNeuron.Bias = _topAgent1Neuron.Bias;
		}
		_newAgentNeuron.Bias = (_topAgent0Neuron.Bias + _topAgent1Neuron.Bias)/2;
	}
}
		
//Output layer
for(var k = 0; k < global.OutputSize; k++) {
	for(var j = 0; j < global.Hidden3Size; j++) {
		var _newAgentNeuron = _newAgent.network.OutputLayer[k];
			
		var _topAgent0Neuron = topAgent0.network.OutputLayer[k];
		var _topAgent0Weights = _topAgent0Neuron.Weights[j];
			
		var _topAgent1Neuron = topAgent1.network.OutputLayer[k];
		var _topAgent1Weights = _topAgent1Neuron.Weights[j];
			
		var _rand = random_range(0, 100);
			
		if(_rand > 50) {
			_newAgentNeuron.Weights[j] = _topAgent0Weights;
			var _mutate = random_range(0, 1);
			if(_mutate < 0.1) {
				_newAgentNeuron.Weights[j] = random_range(-4, 4);
			}
			//_newAgentNeuron.Bias = _topAgent0Neuron.Bias;
		} else {
			_newAgentNeuron.Weights[j] = _topAgent1Weights;
			var _mutate = random_range(0, 1);
			if(_mutate < 0.1) {
				_newAgentNeuron.Weights[j] = random_range(-4, 4);
			}
			//_newAgentNeuron.Bias = _topAgent1Neuron.Bias;
		}
		_newAgentNeuron.Bias = (_topAgent0Neuron.Bias + _topAgent1Neuron.Bias)/2;
	}
} 
		
#endregion