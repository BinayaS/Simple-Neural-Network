owner = noone;
update = true;
yoffset = 32;
xoffset = 80;
moveThreshold = 0.1;
showNetwork = false;

InputLayerSize = global.InputSize;
Hidden1LayerSize = global.Hidden1Size;
Hidden2LayerSize = global.Hidden2Size;
Hidden3LayerSize = global.Hidden3Size;
OutputLayerSize = global.OutputSize;

InputLayer = [];
Hidden1Layer = [];
Hidden2Layer = [];
Hidden3Layer = [];
OutputLayer = [];

#region Create Layers of neurons and set them to randomly fill in their weights and bias

//Input (9)
for(var i = 0; i < InputLayerSize; i++) {
	var _newNeuron = instance_create_depth(x, y+yoffset*i+16, 0, Neuron);
	_newNeuron.Weights[0] = random_range(-4, 4);
	_newNeuron.Bias = random_range(-1, 1);
	_newNeuron.updateInput = true;
	InputLayer[i] = _newNeuron;
}

//Hidden1 (10)
for(var i = 0; i < Hidden1LayerSize; i++) {
	var _newNeuron = instance_create_depth(x+xoffset, y+yoffset*i, 0, Neuron);
	
	for(var j = 0; j < InputLayerSize; j++) {
		_newNeuron.Weights[j] = random_range(-4, 4);
	}
	
	_newNeuron.Bias = random_range(-1, 1);
	_newNeuron.update = true;
	Hidden1Layer[i] = _newNeuron;
}

//Hidden2 (10)
for(var i = 0; i < Hidden2LayerSize; i++) {
	var _newNeuron = instance_create_depth(x+xoffset*2, y+yoffset*i, 0, Neuron);
	
	for(var j = 0; j < Hidden1LayerSize; j++) {
		_newNeuron.Weights[j] = random_range(-4, 4);
	}
	
	_newNeuron.Bias = random_range(-1, 1);
	_newNeuron.update = true;
	Hidden2Layer[i] = _newNeuron;
}

//Hidden3 (10)
for(var i = 0; i < Hidden3LayerSize; i++) {
	var _newNeuron = instance_create_depth(x+xoffset*3, y+yoffset*i, 0, Neuron);
	
	for(var j = 0; j < Hidden2LayerSize; j++) {
		_newNeuron.Weights[j] = random_range(-4, 4);
	}
	
	_newNeuron.Bias = random_range(-1, 1);
	_newNeuron.update = true;
	Hidden3Layer[i] = _newNeuron;
}

//Output (4)
for(var i = 0; i < OutputLayerSize; i++) {
	var _newNeuron = instance_create_depth(x+xoffset*4, y+yoffset*i+16*5, 0, Neuron);
	
	for(var j = 0; j < Hidden3LayerSize; j++) {
		_newNeuron.Weights[j] = random_range(-4, 4);
	}
	
	_newNeuron.Bias = random_range(-1, 1);
	_newNeuron.update = true;
	OutputLayer[i] = _newNeuron;
}

#endregion

#region Connect Neurons together by output and input

//Connect Inputlayer to Hidden1
for(var i = 0; i < Hidden1LayerSize; i++) {
	for(var j = 0; j < InputLayerSize; j++) {
		Hidden1Layer[i].Inputs[j] = InputLayer[j];
	}
}

//Connect Hidden1 to Hidden2
for(var i = 0; i < Hidden2LayerSize; i++) {
	for(var j = 0; j < Hidden1LayerSize; j++) {
		Hidden2Layer[i].Inputs[j] = Hidden1Layer[j];
	}
}

//Connect Hidden2 to Hidden3
for(var i = 0; i < Hidden3LayerSize; i++) {
	for(var j = 0; j < Hidden2LayerSize; j++) {
		Hidden3Layer[i].Inputs[j] = Hidden2Layer[j];
	}
}

//Connect Hidden3 to Outputlayer
for(var i = 0; i < OutputLayerSize; i++) {
	for(var j = 0; j < Hidden3LayerSize; j++) {
		OutputLayer[i].Inputs[j] = Hidden3Layer[j];
	}
}

#endregion

alarm[0] = 2;