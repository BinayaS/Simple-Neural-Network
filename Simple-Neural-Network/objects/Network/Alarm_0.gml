#region Update Input for InputLayer neurons
	var i = 0;
	repeat(InputLayerSize) {
		var _inputNeuron = InputLayer[i];
		_inputNeuron.rightText = false;
		switch(i) {
			case 0:
				_inputNeuron.input = owner.upDistance;
				_inputNeuron.text = "Up";
			break;
		
			case 1:
				_inputNeuron.input = owner.downDistance;
				_inputNeuron.text = "Down";
			break;
		
			case 2:
				_inputNeuron.input = owner.leftDistance;
				_inputNeuron.text = "Left";
			break;
		
			case 3:
				_inputNeuron.input = owner.rightDistance;
				_inputNeuron.text = "Right";
			break;
		
			case 4:
				_inputNeuron.input = owner.upLeftDistance;
				_inputNeuron.text = "Up Left";
			break;
		
			case 5:
				_inputNeuron.input = owner.upRightDistance;
				_inputNeuron.text = "Up Right";
			break;
		
			case 6:
				_inputNeuron.input = owner.downLeftDistance;
				_inputNeuron.text = "Down Left";
			break;
		
			case 7:
				_inputNeuron.input = owner.downRightDistance;
				_inputNeuron.text = "Down Right";
			break;
		
			case 8:
				_inputNeuron.input = owner.checkGoalDistance;
				_inputNeuron.text = "Goal Distance";
			break;
		}
		i++;
	}
	#endregion

#region Update Agent from OutputLayer
var _neuronUp = OutputLayer[0];
_neuronUp.text = "Up";
var _neuronDown = OutputLayer[1];
_neuronDown.text = "Down";
var _neuronLeft = OutputLayer[2];
_neuronLeft.text = "Left";
var _neuronRight = OutputLayer[3];
_neuronRight.text = "Right";	

//Left or right
if(_neuronLeft.Output > moveThreshold && _neuronRight.Output > moveThreshold) {
	if(_neuronLeft.Output > _neuronRight.Output) {
		owner.left = 1;
		owner.right = 0;
	} else {
		owner.right = 1;
		owner.left = 0;
	}
	} else {
	if(_neuronLeft.Output > moveThreshold) {
		owner.left = 1;
		owner.right = 0;
	} else if(_neuronRight.Output > moveThreshold) {
		owner.right = 1;
		owner.left = 0;
	}	else {
		owner.right = 0;
		owner.left = 0;
	}
}
	
//Up or down
if(_neuronUp.Output > moveThreshold && _neuronDown.Output > moveThreshold) {
	if(_neuronUp.Output > _neuronDown.Output) {
		owner.up = 1;
		owner.down = 0;
	} else {
		owner.down = 1;
		owner.up = 0;
	}
	} else {
	if(_neuronUp.Output > moveThreshold) {
		owner.up = 1;
		owner.down = 0;
	} else if(_neuronDown.Output > moveThreshold) {
		owner.down = 1;
		owner.up = 0;
	} else {
		owner.down = 0;
		owner.up = 0;	
	}
}
#endregion


if(update) {
	alarm[0] = 3;
	
	for(var i = 0; i < InputLayerSize; i++) {
		var _neuron = InputLayer[i];
		_neuron.showSelf = showNetwork;
		_neuron.baseY = baseY;
		//_neuron.alarm[0] = 3;
	}
	for(var i = 0; i < Hidden1LayerSize; i++) {
		var _neuron = Hidden1Layer[i];
		_neuron.showSelf = showNetwork;
		_neuron.baseY = baseY;
		//_neuron.alarm[0] = 3;
	}
	for(var i = 0; i < Hidden2LayerSize; i++) {
		var _neuron = Hidden2Layer[i];
		_neuron.showSelf = showNetwork;
		_neuron.baseY = baseY;
		//_neuron.alarm[0] = 3;
	}
	for(var i = 0; i < Hidden3LayerSize; i++) {
		var _neuron = Hidden3Layer[i];
		_neuron.showSelf = showNetwork;
		_neuron.baseY = baseY;
		//_neuron.alarm[0] = 3;
	}
	for(var i = 0; i < OutputLayerSize; i++) {
		var _neuron = OutputLayer[i];
		_neuron.showSelf = showNetwork;
		_neuron.baseY = baseY;
		//_neuron.alarm[0] = 3;
	}
	
}