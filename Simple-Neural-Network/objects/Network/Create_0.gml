owner = noone;
update = false;
yoffset = 32;
xoffset = 80;

InputLayerSize = global.InputSize;
Hidden1LayerSize = global.Hidden1Size;
Hidden2LayerSize = global.Hidden2Size;
Hidden3LayerSize = global.Hidden3Size;
OutputLayerSize = global.OutputSize;

InputLayer = ds_list_create();
Hidden1Layer = ds_list_create();
Hidden2Layer = ds_list_create();
Hidden3Layer = ds_list_create();
OutputLayer = ds_list_create();

#region Create Layers of neurons and set them to randomly fill in their weights and bias

//Input (9)
var i = 0;
repeat(InputLayerSize) {
	var _newNeuron = instance_create_depth(x, y+yoffset*i+16, 0, Neuron);
	_newNeuron.alarm[1] = 2;
	_newNeuron.inputSize = 1;
	ds_list_add(InputLayer, _newNeuron);
	i++;
}

//Hidden1 (10)
var i = 0;
repeat(Hidden1LayerSize) {
	var _newNeuron = instance_create_depth(x+xoffset, y+yoffset*i, 0, Neuron);
	_newNeuron.alarm[0] = 2;
	_newNeuron.inputSize = InputLayerSize;
	ds_list_add(Hidden1Layer, _newNeuron);
	i++;
}

//Hidden2 (10)
var i = 0;
repeat(Hidden2LayerSize) {
	var _newNeuron = instance_create_depth(x+xoffset*2, y+yoffset*i, 0, Neuron);
	_newNeuron.alarm[0] = 2;
	_newNeuron.inputSize = Hidden1LayerSize;
	ds_list_add(Hidden2Layer, _newNeuron);
	i++;
}

//Hidden3 (10)
var i = 0;
repeat(Hidden3LayerSize) {
	var _newNeuron = instance_create_depth(x+xoffset*3, y+yoffset*i, 0, Neuron);
	_newNeuron.alarm[0] = 2;
	_newNeuron.inputSize = Hidden2LayerSize;
	ds_list_add(Hidden3Layer, _newNeuron);
	i++;
}

//Output (4)
var i = 0;
repeat(OutputLayerSize) {
	var _newNeuron = instance_create_depth(x+xoffset*4, y+yoffset*i+16*5, 0, Neuron);
	_newNeuron.alarm[0] = 2;
	_newNeuron.inputSize = Hidden3LayerSize;
	ds_list_add(OutputLayer, _newNeuron);
	i++;
}

#endregion

#region Connect Neurons together by output and input

//Connect Inputlayer to Hidden1
var i = 0;
repeat(InputLayerSize) {
	var j = 0;
	repeat(Hidden1LayerSize) {
		var _inputNeuron = ds_list_find_value(InputLayer, i);
		var _connectToNeuron = ds_list_find_value(Hidden1Layer, j);
		ds_list_add(_connectToNeuron.Inputs, _inputNeuron);
		j++;
	}
	
	i++;
}

var i = 0;
//Connect Hidden1 to Hidden2
repeat(Hidden1LayerSize) {
	
	var j = 0;
	repeat(Hidden2LayerSize) {
		var _inputNeuron = ds_list_find_value(Hidden1Layer, i);
		var _connectToNeuron = ds_list_find_value(Hidden2Layer, j);
		ds_list_add(_connectToNeuron.Inputs, _inputNeuron);
		j++;
	}
	
	i++;
}

var i = 0;
//Connect Hidden2 to Hidden3
repeat(Hidden2LayerSize) {
	
	var j = 0;
	repeat(Hidden3LayerSize) {
		var _inputNeuron = ds_list_find_value(Hidden2Layer, i);
		var _connectToNeuron = ds_list_find_value(Hidden3Layer, j);
		ds_list_add(_connectToNeuron.Inputs, _inputNeuron);
		j++;
	}
	
	i++;
}

var i = 0;
//Connect Hidden3 to Outputlayer
repeat(Hidden3LayerSize) {
	
	var j = 0;
	repeat(OutputLayerSize) {
		var _inputNeuron = ds_list_find_value(Hidden3Layer, i);
		var _connectToNeuron = ds_list_find_value(OutputLayer, j);
		ds_list_add(_connectToNeuron.Inputs, _inputNeuron);
		j++;
	}
	
	i++;
}

#endregion
